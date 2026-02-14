<?php
// Druiden Charakter Tracker - PHP API
// Handles GET and SET operations for character data, spells, items, and wildshapes

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

// Include database configuration and connection
try {
    require_once __DIR__ . '/ConfigFile/dbconfig.php';
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Datenbankverbindung fehlgeschlagen: ' . $e->getMessage()]);
    exit;
}

// Get request method and action
$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

// ============================================
// GET REQUESTS - READ DATA
// ============================================

if ($method === 'GET') {
    
    switch ($action) {

        // Check if character exists for a class
        case 'check_character':
            $class = $_GET['class'] ?? null;

            if (!$class) {
                http_response_code(400);
                echo json_encode(['error' => 'Class parameter required']);
                exit;
            }

            // Map English class names to German DB names
            $classMap = [
                'druid' => 'druid',
                'rogue' => 'Schurke',
                'bard' => 'Barde',
                'wizard' => 'Magier',
                'paladin' => 'Paladin'
            ];

            $dbClass = $class;

            $stmt = $pdo->prepare("
                SELECT id, name, level, class FROM characters WHERE class = ? LIMIT 1
            ");
            $stmt->execute([$dbClass]);
            $character = $stmt->fetch();

            if ($character) {
                echo json_encode([
                    'success' => true,
                    'exists' => true,
                    'data' => $character
                ]);
            } else {
                echo json_encode([
                    'success' => true,
                    'exists' => false
                ]);
            }
            break;

        // Get character data
        case 'character':
            $charId = $_GET['id'] ?? null;
            $class = $_GET['class'] ?? null;

            // Allow fetching by class OR by ID
            if (!$charId && !$class) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID or class required']);
                exit;
            }

            if ($charId) {
                $stmt = $pdo->prepare("
                    SELECT * FROM characters WHERE id = ?
                ");
                $stmt->execute([$charId]);
            } else {
                // Map English class names to German DB names
                $classMap = [
                    'druid' => 'Druide',
                    'rogue' => 'Schurke',
                    'bard' => 'Barde',
                    'wizard' => 'Magier',
                    'paladin' => 'Paladin'
                ];
                $dbClass = $classMap[$class] ?? $class;

                $stmt = $pdo->prepare("
                    SELECT * FROM characters WHERE class = ? LIMIT 1
                ");
                $stmt->execute([$dbClass]);
            }
            $character = $stmt->fetch();
            
            if (!$character) {
                http_response_code(404);
                echo json_encode(['error' => 'Character not found']);
                exit;
            }
            
            // Decode JSON fields
            $character['spell_slots'] = json_decode($character['spell_slots'], true);
            $character['equipped_items'] = json_decode($character['equipped_items'], true);
            $character['inventory'] = json_decode($character['inventory'], true);
            $character['prepared_spells'] = json_decode($character['prepared_spells'], true);
            $character['saving_throw_proficiencies'] = json_decode($character['saving_throw_proficiencies'] ?? '[]', true);
            $character['skill_proficiencies'] = json_decode($character['skill_proficiencies'] ?? '[]', true);
            $character['equipped_weapon'] = json_decode($character['equipped_weapon'] ?? 'null', true);

            echo json_encode(['success' => true, 'data' => $character]);
            break;
            
        // Get all spells for a class
        case 'spells':
            $level = $_GET['level'] ?? null;
            $maxSpellLevel = $_GET['max_spell_level'] ?? 9;
            $class = $_GET['class'] ?? 'druid';

            // Map English class names to German DB names for spell filtering
            $classMap = [
                'druid' => 'Druide',
                'rogue' => 'Schurke',
                'bard' => 'Barde',
                'wizard' => 'Magier',
                'paladin' => 'Paladin'
            ];
            $dbClass = $classMap[$class] ?? $class;

            $query = "SELECT * FROM spells WHERE class LIKE :class";
            $params = [':class' => '%' . $dbClass . '%'];

            if ($maxSpellLevel !== null) {
                $query .= " AND (level = 0 OR level <= :max_spell_level)";
                $params[':max_spell_level'] = $maxSpellLevel;
            }

            $query .= " ORDER BY level, name_de";

            $stmt = $pdo->prepare($query);

            foreach ($params as $key => $value) {
                if ($key === ':max_spell_level') {
                    $stmt->bindValue($key, $value, PDO::PARAM_INT);
                } else {
                    $stmt->bindValue($key, $value);
                }
            }

            $stmt->execute();
            $spells = $stmt->fetchAll();

            echo json_encode(['success' => true, 'data' => $spells]);
            break;

        // Get class features for a specific class and level
        case 'class_features':
            $class = $_GET['class'] ?? null;
            $level = $_GET['level'] ?? 1;

            if (!$class) {
                http_response_code(400);
                echo json_encode(['error' => 'Class parameter required']);
                exit;
            }

            // Return class-specific features based on level
            $features = [];

            // Define features for each class
            $classFeatures = [
                'druid' => [
                    1 => ['Druidic', 'Spellcasting'],
                    2 => ['Wild Shape', 'Druid Circle'],
                    4 => ['Wild Shape Improvement', 'Ability Score Improvement'],
                    6 => ['Druid Circle Feature'],
                    8 => ['Wild Shape Improvement', 'Ability Score Improvement'],
                    10 => ['Druid Circle Feature'],
                    12 => ['Ability Score Improvement'],
                    14 => ['Druid Circle Feature'],
                    16 => ['Ability Score Improvement'],
                    18 => ['Timeless Body', 'Beast Spells'],
                    19 => ['Ability Score Improvement'],
                    20 => ['Archdruid']
                ],
                'rogue' => [
                    1 => ['Expertise', 'Sneak Attack', 'Thieves\' Cant'],
                    2 => ['Cunning Action'],
                    3 => ['Roguish Archetype'],
                    4 => ['Ability Score Improvement'],
                    5 => ['Uncanny Dodge'],
                    6 => ['Expertise'],
                    7 => ['Evasion'],
                    8 => ['Ability Score Improvement'],
                    9 => ['Roguish Archetype Feature'],
                    10 => ['Ability Score Improvement'],
                    11 => ['Reliable Talent'],
                    12 => ['Ability Score Improvement'],
                    13 => ['Roguish Archetype Feature'],
                    14 => ['Blindsense'],
                    15 => ['Slippery Mind'],
                    16 => ['Ability Score Improvement'],
                    17 => ['Roguish Archetype Feature'],
                    18 => ['Elusive'],
                    19 => ['Ability Score Improvement'],
                    20 => ['Stroke of Luck']
                ],
                'bard' => [
                    1 => ['Spellcasting', 'Bardic Inspiration (d6)'],
                    2 => ['Jack of All Trades', 'Song of Rest (d6)'],
                    3 => ['Bard College', 'Expertise'],
                    4 => ['Ability Score Improvement'],
                    5 => ['Bardic Inspiration (d8)', 'Font of Inspiration'],
                    6 => ['Countercharm', 'Bard College Feature'],
                    7 => [],
                    8 => ['Ability Score Improvement'],
                    9 => ['Song of Rest (d8)'],
                    10 => ['Bardic Inspiration (d10)', 'Expertise', 'Magical Secrets'],
                    11 => [],
                    12 => ['Ability Score Improvement'],
                    13 => ['Song of Rest (d10)'],
                    14 => ['Magical Secrets', 'Bard College Feature'],
                    15 => ['Bardic Inspiration (d12)'],
                    16 => ['Ability Score Improvement'],
                    17 => ['Song of Rest (d12)'],
                    18 => ['Magical Secrets'],
                    19 => ['Ability Score Improvement'],
                    20 => ['Superior Inspiration']
                ],
                'wizard' => [
                    1 => ['Spellcasting', 'Arcane Recovery'],
                    2 => ['Arcane Tradition'],
                    3 => [],
                    4 => ['Ability Score Improvement'],
                    5 => [],
                    6 => ['Arcane Tradition Feature'],
                    7 => [],
                    8 => ['Ability Score Improvement'],
                    9 => [],
                    10 => ['Arcane Tradition Feature'],
                    11 => [],
                    12 => ['Ability Score Improvement'],
                    13 => [],
                    14 => ['Arcane Tradition Feature'],
                    15 => [],
                    16 => ['Ability Score Improvement'],
                    17 => [],
                    18 => ['Spell Mastery'],
                    19 => ['Ability Score Improvement'],
                    20 => ['Signature Spells']
                ],
                'paladin' => [
                    1 => ['Divine Sense', 'Lay on Hands'],
                    2 => ['Fighting Style', 'Spellcasting', 'Divine Smite'],
                    3 => ['Divine Health', 'Sacred Oath'],
                    4 => ['Ability Score Improvement'],
                    5 => ['Extra Attack'],
                    6 => ['Aura of Protection'],
                    7 => ['Sacred Oath Feature'],
                    8 => ['Ability Score Improvement'],
                    9 => [],
                    10 => ['Aura of Courage'],
                    11 => ['Improved Divine Smite'],
                    12 => ['Ability Score Improvement'],
                    13 => [],
                    14 => ['Cleansing Touch'],
                    15 => ['Sacred Oath Feature'],
                    16 => ['Ability Score Improvement'],
                    17 => [],
                    18 => ['Aura Improvements'],
                    19 => ['Ability Score Improvement'],
                    20 => ['Sacred Oath Feature']
                ]
            ];

            // Get all features up to the character's level
            $classData = $classFeatures[$class] ?? [];
            for ($i = 1; $i <= $level; $i++) {
                if (isset($classData[$i])) {
                    foreach ($classData[$i] as $feature) {
                        $features[] = [
                            'level' => $i,
                            'name' => $feature
                        ];
                    }
                }
            }

            echo json_encode(['success' => true, 'data' => $features]);
            break;
            
        // Get prepared spells for character
        case 'prepared_spells':
            $charId = $_GET['char_id'] ?? null;
            
            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }
            
            $stmt = $pdo->prepare("
                SELECT prepared_spells FROM characters WHERE id = ?
            ");
            $stmt->execute([$charId]);
            $result = $stmt->fetch();
            
            $preparedSpells = json_decode($result['prepared_spells'], true) ?? [];
            
            // Get full spell details
            if (!empty($preparedSpells)) {
                $placeholders = str_repeat('?,', count($preparedSpells) - 1) . '?';
                $stmt = $pdo->prepare("
                    SELECT * FROM spells WHERE id IN ($placeholders)
                ");
                $stmt->execute($preparedSpells);
                $spells = $stmt->fetchAll();
                
                echo json_encode(['success' => true, 'data' => $spells]);
            } else {
                echo json_encode(['success' => true, 'data' => []]);
            }
            break;
            
        // Get wildshapes available for character level
        case 'wildshapes':
            $level = $_GET['level'] ?? 2;
            $circle = $_GET['circle'] ?? 'land';
            
            // Calculate max CR based on circle and level
            if ($circle === 'moon') {
                if ($level >= 6) {
                    $maxCR = floor($level / 3);
                } else if ($level >= 2) {
                    $maxCR = 1;
                }
            } else {
                if ($level >= 8) {
                    $maxCR = 1;
                } else if ($level >= 4) {
                    $maxCR = 0.5;
                } else {
                    $maxCR = 0.25;
                }
            }
            
            $stmt = $pdo->prepare("
                SELECT * FROM beast_shapes 
                WHERE min_level <= ? AND cr <= ?
                ORDER BY cr, name_de
            ");
            $stmt->execute([$level, $maxCR]);
            $beasts = $stmt->fetchAll();
            
            echo json_encode(['success' => true, 'data' => $beasts]);
            break;

        // Get backgrounds
        case 'backgrounds':
            $classFilter = $_GET['class'] ?? null;

            $query = "SELECT * FROM backgrounds";

            // Optional: Filter backgrounds suitable for specific class
            // For now, return all backgrounds
            $query .= " ORDER BY name_de";

            $stmt = $pdo->prepare($query);
            $stmt->execute();
            $backgrounds = $stmt->fetchAll();

            echo json_encode(['success' => true, 'data' => $backgrounds]);
            break;

        // Get equipment/items
        case 'equipment':
            try {
                $type = $_GET['type'] ?? null;
                $search = $_GET['search'] ?? null;

                $query = "SELECT * FROM equipment";
                $conditions = [];
                $params = [];

                if ($type) {
                    $conditions[] = "type = :type";
                    $params[':type'] = $type;
                }

                if ($search) {
                    $conditions[] = "(name_de LIKE :search OR name_en LIKE :search OR description_de LIKE :search)";
                    $params[':search'] = "%{$search}%";
                }

                if (!empty($conditions)) {
                    $query .= " WHERE " . implode(' AND ', $conditions);
                }

                $query .= " ORDER BY name_de";

                $stmt = $pdo->prepare($query);

                foreach ($params as $key => $value) {
                    $stmt->bindValue($key, $value);
                }

                $stmt->execute();
                $equipment = $stmt->fetchAll();

                echo json_encode(['success' => true, 'data' => $equipment]);
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(['success' => false, 'error' => 'Datenbankfehler: ' . $e->getMessage()]);
            }
            break;
            
        // Get character inventory
        case 'inventory':
            $charId = $_GET['char_id'] ?? null;

            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }

            $stmt = $pdo->prepare("
                SELECT inventory, equipped_items FROM characters WHERE id = ?
            ");
            $stmt->execute([$charId]);
            $result = $stmt->fetch();

            if (!$result) {
                http_response_code(404);
                echo json_encode(['success' => false, 'error' => 'Character not found']);
                exit;
            }

            // Decode with proper null handling
            $inventory = $result['inventory'] ? json_decode($result['inventory'], true) : [];
            $equipped = $result['equipped_items'] ? json_decode($result['equipped_items'], true) : [];

            // Ensure arrays are returned even if null
            $inventory = $inventory ?? [];
            $equipped = $equipped ?? [];

            echo json_encode([
                'success' => true,
                'data' => [
                    'inventory' => $inventory,
                    'equipped' => $equipped
                ]
            ]);
            break;

        // Get all characters (for debugging/testing)
        case 'all_characters':
            $stmt = $pdo->query("
                SELECT id, name, class, level, race, background,
                       strength, dexterity, constitution, intelligence, wisdom, charisma,
                       armor_class, current_hp, max_hp
                FROM characters
                ORDER BY id DESC
            ");
            $characters = $stmt->fetchAll();
            echo json_encode(['success' => true, 'data' => $characters]);
            break;

        // Get beast shapes for wildshape
        case 'beast_shapes':
            $level = $_GET['level'] ?? null;
            $cr = $_GET['cr'] ?? null;

            $query = "SELECT * FROM beast_shapes WHERE 1=1";
            $params = [];

            if ($level !== null) {
                $query .= " AND min_level <= ?";
                $params[] = intval($level);
            }

            if ($cr !== null) {
                $query .= " AND cr = ?";
                $params[] = floatval($cr);
            }

            $query .= " ORDER BY cr ASC, name_de ASC";

            $stmt = $pdo->prepare($query);
            $stmt->execute($params);
            $beasts = $stmt->fetchAll();

            echo json_encode(['success' => true, 'data' => $beasts]);
            break;

        default:
            http_response_code(400);
            echo json_encode(['error' => 'Invalid action']);
            break;
    }
}

// ============================================
// POST REQUESTS - CREATE/UPDATE DATA
// ============================================

else if ($method === 'POST') {
    
    $input = json_decode(file_get_contents('php://input'), true);
    
    switch ($action) {
        
        // Create new character
        case 'create_character':
            try {
                // Define saving throw proficiencies by class
                $savingThrowsByClass = [
                    'Druide' => ['intelligence', 'wisdom'],
                    'Schurke' => ['dexterity', 'intelligence'],
                    'Barde' => ['dexterity', 'charisma'],
                    'Magier' => ['intelligence', 'wisdom'],
                    'Paladin' => ['wisdom', 'charisma']
                ];

                $characterClass = $input['class'] ?? 'Druide';
                $savingThrows = $savingThrowsByClass[$characterClass] ?? ['wisdom', 'intelligence'];

                $stmt = $pdo->prepare("
                    INSERT INTO characters (
                        name, level, class, druid_circle, race, background,
                        strength, dexterity, constitution,
                        intelligence, wisdom, charisma,
                        armor_class, current_hp, max_hp,
                        spell_slots, prepared_spells,
                        inventory, equipped_items,
                        saving_throw_proficiencies, skill_proficiencies
                    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                ");

                $spellSlots = json_encode($input['spell_slots'] ?? []);
                $knownSpells = json_encode($input['known_spells'] ?? []);
                $inventory = json_encode($input['inventory'] ?? []);
                $equippedItems = json_encode($input['equipped_items'] ?? []);
                $savingThrowProfs = json_encode($savingThrows);
                $skillProfs = json_encode($input['skill_proficiencies'] ?? []);

                $result = $stmt->execute([
                    $input['name'] ?? 'Unbenannter Charakter',
                    $input['level'] ?? 1,
                    $characterClass,
                    $input['druid_circle'] ?? null,
                    $input['race'] ?? null,
                    $input['background'] ?? null,
                    $input['strength'] ?? 10,
                    $input['dexterity'] ?? 10,
                    $input['constitution'] ?? 10,
                    $input['intelligence'] ?? 10,
                    $input['wisdom'] ?? 10,
                    $input['charisma'] ?? 10,
                    $input['armor_class'] ?? 10,
                    $input['current_hp'] ?? 8,
                    $input['max_hp'] ?? 8,
                    $spellSlots,
                    $knownSpells,
                    $inventory,
                    $equippedItems,
                    $savingThrowProfs,
                    $skillProfs
                ]);

                if (!$result) {
                    throw new Exception('Database insert failed: ' . implode(', ', $stmt->errorInfo()));
                }

                $charId = $pdo->lastInsertId();

                echo json_encode([
                    'success' => true,
                    'message' => 'Character created',
                    'character_id' => $charId
                ]);
            } catch (Exception $e) {
                http_response_code(500);
                echo json_encode([
                    'success' => false,
                    'error' => $e->getMessage()
                ]);
            }
            break;
            
        // Update character
        case 'update_character':
            $charId = $input['id'] ?? null;

            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }

            $savingThrowProfs = json_encode($input['saving_throw_proficiencies'] ?? []);
            $skillProfs = json_encode($input['skill_proficiencies'] ?? []);
            $equippedWeapon = json_encode($input['equipped_weapon'] ?? null);

            $stmt = $pdo->prepare("
                UPDATE characters SET
                    name = ?,
                    level = ?,
                    druid_circle = ?,
                    strength = ?,
                    dexterity = ?,
                    constitution = ?,
                    intelligence = ?,
                    wisdom = ?,
                    charisma = ?,
                    armor_class = ?,
                    current_hp = ?,
                    max_hp = ?,
                    saving_throw_proficiencies = ?,
                    skill_proficiencies = ?,
                    equipped_weapon = ?,
                    updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");

            $stmt->execute([
                $input['name'],
                $input['level'],
                $input['druid_circle'],
                $input['strength'],
                $input['dexterity'],
                $input['constitution'],
                $input['intelligence'],
                $input['wisdom'],
                $input['charisma'],
                $input['armor_class'],
                $input['current_hp'],
                $input['max_hp'],
                $savingThrowProfs,
                $skillProfs,
                $equippedWeapon,
                $charId
            ]);

            echo json_encode(['success' => true, 'message' => 'Character updated']);
            break;
            
        // Update spell slots
        case 'update_spell_slots':
            $charId = $input['char_id'] ?? null;
            $spellSlots = json_encode($input['spell_slots'] ?? []);
            
            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }
            
            $stmt = $pdo->prepare("
                UPDATE characters SET spell_slots = ?, updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            $stmt->execute([$spellSlots, $charId]);
            
            echo json_encode(['success' => true, 'message' => 'Spell slots updated']);
            break;
            
        // Long rest - restore spell slots
        case 'long_rest':
            $charId = $input['char_id'] ?? null;
            
            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }
            
            // Get character level to determine spell slots
            $stmt = $pdo->prepare("SELECT level FROM characters WHERE id = ?");
            $stmt->execute([$charId]);
            $char = $stmt->fetch();
            
            $level = $char['level'];
            
            // Reset all spell slots based on level
            $spellSlotsPerLevel = [
                1 => [2],
                2 => [3],
                3 => [4, 2],
                4 => [4, 3],
                5 => [4, 3, 2],
                6 => [4, 3, 3],
                7 => [4, 3, 3, 1],
                8 => [4, 3, 3, 2],
                9 => [4, 3, 3, 3, 1],
                10 => [4, 3, 3, 3, 2],
                11 => [4, 3, 3, 3, 2, 1],
                12 => [4, 3, 3, 3, 2, 1],
                13 => [4, 3, 3, 3, 2, 1, 1],
                14 => [4, 3, 3, 3, 2, 1, 1],
                15 => [4, 3, 3, 3, 2, 1, 1, 1],
                16 => [4, 3, 3, 3, 2, 1, 1, 1],
                17 => [4, 3, 3, 3, 2, 1, 1, 1, 1],
                18 => [4, 3, 3, 3, 3, 1, 1, 1, 1],
                19 => [4, 3, 3, 3, 3, 2, 1, 1, 1],
                20 => [4, 3, 3, 3, 3, 2, 2, 1, 1]
            ];
            
            $slots = $spellSlotsPerLevel[$level] ?? [2];
            $resetSlots = [];
            
            foreach ($slots as $index => $count) {
                $slotLevel = $index + 1;
                $resetSlots[$slotLevel] = array_fill(0, $count, false);
            }
            
            $spellSlots = json_encode($resetSlots);
            
            // Also restore HP to max
            $stmt = $pdo->prepare("
                UPDATE characters 
                SET spell_slots = ?, 
                    current_hp = max_hp,
                    updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            $stmt->execute([$spellSlots, $charId]);
            
            echo json_encode(['success' => true, 'message' => 'Long rest completed']);
            break;
            
        // Short rest (druids don't restore spell slots)
        case 'short_rest':
            $charId = $input['char_id'] ?? null;
            
            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }
            
            // You could restore HP here if you implement hit dice
            echo json_encode(['success' => true, 'message' => 'Short rest completed']);
            break;
            
        // Update prepared spells
        case 'update_prepared_spells':
            $charId = $input['char_id'] ?? null;
            $preparedSpells = json_encode($input['prepared_spells'] ?? []);
            
            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }
            
            $stmt = $pdo->prepare("
                UPDATE characters SET prepared_spells = ?, updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            $stmt->execute([$preparedSpells, $charId]);
            
            echo json_encode(['success' => true, 'message' => 'Prepared spells updated']);
            break;
            
        // Update inventory
        case 'update_inventory':
            $charId = $input['char_id'] ?? null;
            $inventory = json_encode($input['inventory'] ?? []);
            $equipped = json_encode($input['equipped_items'] ?? []);

            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }

            $stmt = $pdo->prepare("
                UPDATE characters
                SET inventory = ?, equipped_items = ?, updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            $stmt->execute([$inventory, $equipped, $charId]);

            echo json_encode(['success' => true, 'message' => 'Inventory updated']);
            break;

        // Update equipped weapon
        case 'update_equipped_weapon':
            $charId = $input['char_id'] ?? null;
            $equippedWeapon = json_encode($input['equipped_weapon'] ?? null);

            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }

            $stmt = $pdo->prepare("
                UPDATE characters
                SET equipped_weapon = ?, updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            $stmt->execute([$equippedWeapon, $charId]);

            echo json_encode(['success' => true, 'message' => 'Equipped weapon updated']);
            break;

        // Update character AC
        case 'update_character_ac':
            $charId = $input['char_id'] ?? null;
            $armorClass = $input['armor_class'] ?? 10;

            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }

            $stmt = $pdo->prepare("
                UPDATE characters
                SET armor_class = ?, updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            $stmt->execute([$armorClass, $charId]);

            echo json_encode(['success' => true, 'message' => 'Armor class updated']);
            break;

        // Update character HP
        case 'update_hp':
            $charId = $input['char_id'] ?? null;
            $currentHp = $input['current_hp'] ?? null;
            $maxHp = $input['max_hp'] ?? null;

            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }

            $updates = [];
            $params = [];

            if ($currentHp !== null) {
                $updates[] = "current_hp = ?";
                $params[] = $currentHp;
            }

            if ($maxHp !== null) {
                $updates[] = "max_hp = ?";
                $params[] = $maxHp;
            }

            if (empty($updates)) {
                http_response_code(400);
                echo json_encode(['error' => 'No HP values provided']);
                exit;
            }

            $params[] = $charId;
            $stmt = $pdo->prepare("
                UPDATE characters
                SET " . implode(', ', $updates) . ", updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            $stmt->execute($params);

            echo json_encode(['success' => true, 'message' => 'HP updated']);
            break;

        // Update class-specific resources (bardic inspiration, lay on hands, etc.)
        case 'update_class_resource':
            $charId = $input['char_id'] ?? null;
            $resourceName = $input['resource_name'] ?? null;
            $resourceValue = $input['resource_value'] ?? null;

            if (!$charId || !$resourceName) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID and resource name required']);
                exit;
            }

            // Store in a JSON field for flexibility
            $stmt = $pdo->prepare("
                UPDATE characters
                SET class_resources = JSON_SET(COALESCE(class_resources, '{}'), ?, ?),
                    updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            $stmt->execute(['$.' . $resourceName, $resourceValue, $charId]);

            echo json_encode(['success' => true, 'message' => 'Class resource updated']);
            break;

        default:
            http_response_code(400);
            echo json_encode(['error' => 'Invalid action']);
            break;
    }
}

// ============================================
// DELETE REQUESTS
// ============================================

else if ($method === 'DELETE') {
    
    switch ($action) {
        
        // Delete character
        case 'delete_character':
            $charId = $_GET['id'] ?? null;
            
            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }
            
            $stmt = $pdo->prepare("DELETE FROM characters WHERE id = ?");
            $stmt->execute([$charId]);
            
            echo json_encode(['success' => true, 'message' => 'Character deleted']);
            break;
            
        default:
            http_response_code(400);
            echo json_encode(['error' => 'Invalid action']);
            break;
    }
}

else {
    http_response_code(405);
    echo json_encode(['error' => 'Method not allowed']);
}

// Close connection
$pdo = null;
?>