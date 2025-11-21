# 🎯 VOLLSTÄNDIGE MULTI-KLASSEN IMPLEMENTIERUNG

## ✅ WAS BEREITS FERTIG IST:

### Datenbank (SQL-Migrationen)
- ✅ `migrations/01_multi_class_system.sql` - Basis-Schema für alle Klassen
- ✅ `migrations/02_equipment_database.sql` - 100+ Ausrüstungsgegenstände
- ✅ `migrations/03_backgrounds.sql` - 9 Hintergründe inkl. Pirat
- ✅ `migrations/04_rogue_features.sql` - Schurke Level 1-20
- ✅ `migrations/05_bard_features.sql` - Barde Level 1-20
- ✅ `migrations/06_wizard_features.sql` - Magier Level 1-20
- ✅ `migrations/07_paladin_features.sql` - Paladin Level 1-20
- ✅ `migrations/08_spells_all_classes_part1.sql` - Zaubertricks + Level 1-1
- ✅ `migrations/08_spells_all_classes_part2.sql` - Level 2-3
- ✅ `migrations/08_spells_all_classes_part3.sql` - Level 4-9
- ✅ `beast_shapes_migration.sql` - Wildshape Bestien

### Dokumentation
- ✅ `IMPLEMENTATION_GUIDE.md` - Vollständiger Plan
- ✅ Dieses Dokument - Komplettanleitung

## 🚀 INSTALLATION

### 1. Datenbank Migrationen ausführen

```bash
# Reihenfolge ist wichtig!
cd C:\Users\mauri\Desktop\dnd

mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/01_multi_class_system.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/02_equipment_database.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/03_backgrounds.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/04_rogue_features.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/05_bard_features.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/06_wizard_features.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/07_paladin_features.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/08_spells_all_classes_part1.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/08_spells_all_classes_part2.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < migrations/08_spells_all_classes_part3.sql
mysql -u root -p'9mkdH9t4Pt6!T4?f' dnd < beast_shapes_migration.sql
```

## 📝 WICHTIGE ERWEITERUNGEN FÜR BESTEHENDE DATEIEN

### db_actions.php - Neue API-Endpunkte hinzufügen

Füge folgende Cases zu den GET Requests hinzu (nach Zeile 148):

```php
// Get class features for a specific class and level
case 'class_features':
    $class = $_GET['class'] ?? null;
    $level = $_GET['level'] ?? 1;

    if (!$class) {
        http_response_code(400);
        echo json_encode(['error' => 'Class required']);
        exit;
    }

    $stmt = $pdo->prepare("
        SELECT * FROM class_features
        WHERE class = ? AND level_required <= ?
        ORDER BY level_required, id
    ");
    $stmt->execute([$class, $level]);
    $features = $stmt->fetchAll();

    echo json_encode(['success' => true, 'data' => $features]);
    break;

// Get all backgrounds
case 'backgrounds':
    $stmt = $pdo->query("SELECT * FROM backgrounds ORDER BY name_de");
    $backgrounds = $stmt->fetchAll();

    echo json_encode(['success' => true, 'data' => $backgrounds]);
    break;

// Get spells for specific class
case 'spells_by_class':
    $class = $_GET['class'] ?? null;
    $maxLevel = $_GET['max_spell_level'] ?? 9;

    if (!$class) {
        http_response_code(400);
        echo json_encode(['error' => 'Class required']);
        exit;
    }

    $stmt = $pdo->prepare("
        SELECT * FROM spells
        WHERE JSON_CONTAINS(class_list, ?)
        AND (level = 0 OR level <= ?)
        ORDER BY level, name_de
    ");
    $stmt->execute([json_encode($class), $maxLevel]);
    $spells = $stmt->fetchAll();

    echo json_encode(['success' => true, 'data' => $spells]);
    break;

// Search equipment
case 'search_equipment':
    $query = $_GET['q'] ?? '';
    $category = $_GET['category'] ?? null;
    $type = $_GET['type'] ?? null;

    $sql = "SELECT * FROM equipment WHERE 1=1";
    $params = [];

    if ($query) {
        $sql .= " AND (name_de LIKE ? OR name_en LIKE ? OR description_de LIKE ?)";
        $searchTerm = "%$query%";
        $params[] = $searchTerm;
        $params[] = $searchTerm;
        $params[] = $searchTerm;
    }

    if ($category) {
        $sql .= " AND category = ?";
        $params[] = $category;
    }

    if ($type) {
        $sql .= " AND type = ?";
        $params[] = $type;
    }

    $sql .= " ORDER BY name_de LIMIT 100";

    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $items = $stmt->fetchAll();

    echo json_encode(['success' => true, 'data' => $items]);
    break;

// Get class resources for character
case 'class_resources':
    $charId = $_GET['char_id'] ?? null;

    if (!$charId) {
        http_response_code(400);
        echo json_encode(['error' => 'Character ID required']);
        exit;
    }

    $stmt = $pdo->prepare("SELECT * FROM class_resources WHERE character_id = ?");
    $stmt->execute([$charId]);
    $resources = $stmt->fetchAll();

    echo json_encode(['success' => true, 'data' => $resources]);
    break;

// Check if character exists for class
case 'check_character':
    $class = $_GET['class'] ?? null;

    if (!$class) {
        http_response_code(400);
        echo json_encode(['error' => 'Class required']);
        exit;
    }

    $stmt = $pdo->prepare("SELECT id, name, level FROM characters WHERE class = ? LIMIT 1");
    $stmt->execute([$class]);
    $character = $stmt->fetch();

    echo json_encode([
        'success' => true,
        'exists' => $character !== false,
        'data' => $character ?: null
    ]);
    break;
```

Füge zu POST Requests hinzu:

```php
// Use class resource (e.g., Bardic Inspiration, Sneak Attack use tracking)
case 'use_resource':
    $charId = $input['char_id'] ?? null;
    $resourceType = $input['resource_type'] ?? null;

    if (!$charId || !$resourceType) {
        http_response_code(400);
        echo json_encode(['error' => 'Character ID and resource type required']);
        exit;
    }

    $stmt = $pdo->prepare("
        UPDATE class_resources
        SET current_uses = GREATEST(0, current_uses - 1),
            updated_at = CURRENT_TIMESTAMP
        WHERE character_id = ? AND resource_type = ?
    ");
    $stmt->execute([$charId, $resourceType]);

    echo json_encode(['success' => true, 'message' => 'Resource used']);
    break;

// Reset class resources (short or long rest)
case 'reset_resources':
    $charId = $input['char_id'] ?? null;
    $restType = $input['rest_type'] ?? 'long_rest'; // 'short_rest' or 'long_rest'

    if (!$charId) {
        http_response_code(400);
        echo json_encode(['error' => 'Character ID required']);
        exit;
    }

    if ($restType === 'short_rest') {
        $stmt = $pdo->prepare("
            UPDATE class_resources
            SET current_uses = max_uses
            WHERE character_id = ? AND recovery_type IN ('short_rest', 'long_rest')
        ");
    } else {
        $stmt = $pdo->prepare("
            UPDATE class_resources
            SET current_uses = max_uses
            WHERE character_id = ?
        ");
    }

    $stmt->execute([$charId]);

    echo json_encode(['success' => true, 'message' => 'Resources restored']);
    break;
```

## 🎨 KLASSENSPEZIFISCHE DASHBOARD-ANPASSUNGEN

### Für jede Klasse brauchst du folgende Anpassungen:

#### 1. Druide (dashboard.html) - ✅ BEREITS FERTIG
- Wildshape System vorhanden
- Spell Slots vorhanden
- Alle Features implementiert

#### 2. Schurke (dashboard-rogue.html) - NEU ERSTELLEN

**Spezifische Features:**
- Sneak Attack Würfel-Anzeige (basierend auf Level)
- Cunning Action Indikator
- Expertise-Fertigkeiten hervorheben
- Keine Spell Slots (non-caster)
- Pirat-Theme: Braun/Schwarz/Rot Farben

**Ressourcen zu tracken:**
- Sneak Attack (passiv, zeige nur Würfel-Anzahl)
- Stroke of Luck (1x pro Short Rest ab Level 20)

#### 3. Barde (dashboard-bard.html) - NEU ERSTELLEN

**Spezifische Features:**
- Bardic Inspiration Würfel (Click-to-use mit Circles)
- Anzahl basierend auf CHA-Mod
- Würfel-Größe basierend auf Level (d6/d8/d10/d12)
- Jack of All Trades (passiv anzeigen)
- Song of Rest (passiv)
- Spell Slots wie Druide
- Lila/Pink Theme

**Ressourcen:**
- Bardic Inspiration (CHA-Mod pro Long Rest, Font of Inspiration ab Lvl 5 = Short Rest)

#### 4. Magier (dashboard-wizard.html) - NEU ERSTELLEN

**Spezifische Features:**
- Zauberbuch-Anzeige (alle bekannten Zauber)
- Vorbereitete Zauber (INT-Mod + Level Anzahl)
- Arcane Recovery (Zauberplätze während Short Rest)
- Spell Slots wie Druide
- Blau/Arcane Theme

**Ressourcen:**
- Arcane Recovery (1x pro Long Rest)

#### 5. Paladin (dashboard-paladin.html) - NEU ERSTELLEN

**Spezifische Features:**
- Lay on Hands Pool (Level × 5 HP)
- Divine Sense Uses (1 + CHA-Mod)
- Divine Smite (verbraucht Spell Slots)
- Channel Divinity (1-3x per Short Rest je nach Level)
- Spell Slots (bis Level 5 nur)
- Gold/Weiß/Heilig Theme

**Ressourcen:**
- Lay on Hands Pool
- Divine Sense
- Channel Divinity
- Cleansing Touch (ab Level 14)

## 🎨 FARBSCHEMAS PRO KLASSE

```css
/* Druide - Grün/Naturthema */
:root.druid {
  --primary: #2d5016;
  --secondary: #66bb6a;
  --accent: #a5d6a7;
}

/* Schurke - Dunkel/Piratenthema */
:root.rogue {
  --primary: #1a1a2e;
  --secondary: #c8102e;
  --accent: #e6b800;
}

/* Barde - Lila/Künstlerthema */
:root.bard {
  --primary: #6a1b9a;
  --secondary: #ab47bc;
  --accent: #ce93d8;
}

/* Magier - Blau/Arkan */
:root.wizard {
  --primary: #0d47a1;
  --secondary: #42a5f5;
  --accent: #90caf9;
}

/* Paladin - Gold/Heilig */
:root.paladin {
  --primary: #f57c00;
  --secondary: #ffd54f;
  --accent: #fff9c4;
}
```

## 📦 SCHNELLSTART - TESTING

### 1. Test-Charakter für jede Klasse erstellen

```sql
-- Schurke (Pirat)
INSERT INTO characters (name, class, level, background, strength, dexterity, constitution, intelligence, wisdom, charisma, armor_class, current_hp, max_hp)
VALUES ('Jack Sparrow', 'rogue', 5, 'pirate', 10, 18, 14, 12, 13, 14, 15, 38, 38);

-- Barde
INSERT INTO characters (name, class, level, background, strength, dexterity, constitution, intelligence, wisdom, charisma, armor_class, current_hp, max_hp)
VALUES ('Melodia', 'bard', 5, 'entertainer', 8, 14, 12, 13, 10, 18, 14, 32, 32);

-- Magier
INSERT INTO characters (name, class, level, background, strength, dexterity, constitution, intelligence, wisdom, charisma, armor_class, current_hp, max_hp)
VALUES ('Gandorin', 'wizard', 5, 'sage', 8, 14, 13, 18, 15, 11, 13, 28, 28);

-- Paladin
INSERT INTO characters (name, class, level, background, strength, dexterity, constitution, intelligence, wisdom, charisma, armor_class, current_hp, max_hp)
VALUES ('Sir Galahad', 'paladin', 5, 'noble', 16, 10, 14, 10, 12, 16, 18, 44, 44);
```

### 2. Ressourcen initialisieren

```sql
-- Schurke Resources (für Testing - Stroke of Luck ab Level 20)
-- Keine speziellen Ressourcen auf Level 5

-- Barde Resources
INSERT INTO class_resources (character_id, resource_type, max_uses, current_uses, recovery_type)
SELECT id, 'bardic_inspiration', 4, 4, 'long_rest' FROM characters WHERE name = 'Melodia';

-- Magier Resources
INSERT INTO class_resources (character_id, resource_type, max_uses, current_uses, recovery_type)
SELECT id, 'arcane_recovery', 1, 1, 'long_rest' FROM characters WHERE name = 'Gandorin';

-- Paladin Resources
INSERT INTO class_resources (character_id, resource_type, max_uses, current_uses, recovery_type)
SELECT id, 'lay_on_hands', 25, 25, 'long_rest' FROM characters WHERE name = 'Sir Galahad';

INSERT INTO class_resources (character_id, resource_type, max_uses, current_uses, recovery_type)
SELECT id, 'divine_sense', 4, 4, 'long_rest' FROM characters WHERE name = 'Sir Galahad';

INSERT INTO class_resources (character_id, resource_type, max_uses, current_uses, recovery_type)
SELECT id, 'channel_divinity', 1, 1, 'short_rest' FROM characters WHERE name = 'Sir Galahad';
```

## 🔥 NÄCHSTE SCHRITTE - PRIORITÄT

1. **JETZT**: Führe alle SQL-Migrationen aus (siehe oben)
2. **DANN**: Erweitere `db_actions.php` mit den neuen API-Endpunkten (Code oben)
3. **DANACH**: Erstelle Test-Charaktere (SQL oben)
4. **DANN**: Teste mit dem Druiden-Dashboard ob die Datenbank funktioniert
5. **ZULETZT**: Erstelle Dashboards für andere Klassen (nutze dashboard.html als Vorlage)

## 💡 TEMPLATE FÜR NEUE DASHBOARDS

Kopiere `dashboard.html` und passe an:

1. **Farben ändern** (CSS am Anfang)
2. **Klassenspezifische Features** hinzufügen
3. **Spell Slots anpassen** (Paladin nur bis Level 5)
4. **Ressourcen-Tracker** hinzufügen (Bardic Inspiration, Lay on Hands, etc.)
5. **Klassenname & Icons** ändern

## ✨ FERTIG!

Nach diesen Schritten hast du ein **vollständig funktionsfähiges Multi-Klassen D&D-System** mit:

- ✅ 5 Spielbare Klassen
- ✅ Hunderte Zaubersprüche (deutsch)
- ✅ Alle Klassenfähigkeiten
- ✅ Wildshape System
- ✅ Equipment-Datenbank
- ✅ Hintergründe
- ✅ Komplett deutsche Lokalisierung

**Happy Gaming! 🎲🎉**
