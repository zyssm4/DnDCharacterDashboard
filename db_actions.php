<?php
// Druiden Charakter Tracker - PHP API
// Handles GET and SET operations for character data, spells, items, and wildshapes

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

// Include database configuration and connection
require_once __DIR__ . '/ConfigFile/dbconfig.php';

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
            
            if (!$charId) {
                http_response_code(400);
                echo json_encode(['error' => 'Character ID required']);
                exit;
            }
            
            $stmt = $pdo->prepare("
                SELECT * FROM characters WHERE id = ?
            ");
            $stmt->execute([$charId]);
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
            
        // Get all spells for druids
        case 'spells':
            $level = $_GET['level'] ?? null;
            $maxSpellLevel = $_GET['max_spell_level'] ?? 9;
            
            $query = "SELECT * FROM spells WHERE class LIKE '%Druide%'";
            
            if ($maxSpellLevel !== null) {
                $query .= " AND (level = 0 OR level <= :max_spell_level)";
            }
            
            $query .= " ORDER BY level, name_de";
            
            $stmt = $pdo->prepare($query);
            
            if ($maxSpellLevel !== null) {
                $stmt->bindParam(':max_spell_level', $maxSpellLevel, PDO::PARAM_INT);
            }
            
            $stmt->execute();
            $spells = $stmt->fetchAll();
            
            echo json_encode(['success' => true, 'data' => $spells]);
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
                    $maxCR = floor($level / 2);
                } else if ($level >= 2) {
                    $maxCR = floor($level / 3);
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
            $stmt = $pdo->prepare("
                INSERT INTO characters (
                    name, level, druid_circle,
                    strength, dexterity, constitution,
                    intelligence, wisdom, charisma,
                    armor_class, current_hp, max_hp,
                    spell_slots, prepared_spells,
                    inventory, equipped_items,
                    saving_throw_proficiencies, skill_proficiencies
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ");

            $spellSlots = json_encode($input['spell_slots'] ?? []);
            $preparedSpells = json_encode($input['prepared_spells'] ?? []);
            $inventory = json_encode($input['inventory'] ?? []);
            $equippedItems = json_encode($input['equipped_items'] ?? []);
            $savingThrowProfs = json_encode($input['saving_throw_proficiencies'] ?? ['intelligence', 'wisdom']);
            $skillProfs = json_encode($input['skill_proficiencies'] ?? []);

            $stmt->execute([
                $input['name'] ?? 'Unbenannter Druide',
                $input['level'] ?? 1,
                $input['druid_circle'] ?? 'land',
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
                $preparedSpells,
                $inventory,
                $equippedItems,
                $savingThrowProfs,
                $skillProfs
            ]);

            $charId = $pdo->lastInsertId();

            echo json_encode([
                'success' => true,
                'message' => 'Character created',
                'character_id' => $charId
            ]);
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