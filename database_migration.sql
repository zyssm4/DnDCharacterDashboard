-- ============================================================================
-- D&D Character Tracker - Database Migration
-- ============================================================================
-- Run this file to update your database with all new features

-- ============================================================================
-- 1. ADD CURRENCY COLUMNS TO CHARACTERS TABLE
-- ============================================================================
ALTER TABLE characters
ADD COLUMN IF NOT EXISTS gold INT DEFAULT 0 COMMENT 'Character gold amount';

ALTER TABLE characters
ADD COLUMN IF NOT EXISTS silver INT DEFAULT 0 COMMENT 'Character silver amount';

ALTER TABLE characters
ADD COLUMN IF NOT EXISTS copper INT DEFAULT 0 COMMENT 'Character copper amount';

-- ============================================================================
-- 2. ADD SENSES COLUMN TO BEAST_SHAPES TABLE
-- ============================================================================
ALTER TABLE beast_shapes
ADD COLUMN IF NOT EXISTS senses VARCHAR(500) COMMENT 'Beast senses like darkvision, blindsight, etc.';

-- ============================================================================
-- 3. ADD MATERIAL COMPONENTS COLUMNS TO SPELLS TABLE
-- ============================================================================
ALTER TABLE spells
ADD COLUMN IF NOT EXISTS material VARCHAR(500) COMMENT 'Material components description (English)';

ALTER TABLE spells
ADD COLUMN IF NOT EXISTS material_de VARCHAR(500) COMMENT 'Material components description (German)';

-- ============================================================================
-- 4. UPDATE EXISTING CHARACTERS WITH DEFAULT CURRENCY
-- ============================================================================
UPDATE characters SET gold = 100, silver = 50, copper = 20 WHERE gold IS NULL OR gold = 0;

-- ============================================================================
-- 5. POPULATE BEAST SENSES (EXAMPLES)
-- ============================================================================
UPDATE beast_shapes SET senses = 'Darkvision 60 ft., Passive Perception 12' WHERE name_de LIKE '%Wolf%';
UPDATE beast_shapes SET senses = 'Darkvision 60 ft., Keen Smell' WHERE name_de LIKE '%Bär%';
UPDATE beast_shapes SET senses = 'Blindsight 60 ft.' WHERE name_de LIKE '%Fledermaus%';
UPDATE beast_shapes SET senses = 'Darkvision 120 ft., Keen Hearing and Smell' WHERE name_de LIKE '%Panther%';
UPDATE beast_shapes SET senses = 'Keen Sight, Passive Perception 14' WHERE name_de LIKE '%Adler%' OR name_de LIKE '%Falke%';

-- ============================================================================
-- 6. POPULATE SPELL MATERIAL COMPONENTS (EXAMPLES)
-- ============================================================================
UPDATE spells SET
    material = 'A piece of cured leather',
    material_de = 'Ein Stück gegerbtes Leder'
WHERE name_de = 'Mage Armor' OR name_de = 'Rüstung des Magiers';

UPDATE spells SET
    material = 'Bat guano and sulfur',
    material_de = 'Fledermausguano und Schwefel'
WHERE name_de = 'Fireball' OR name_de = 'Feuerball';

UPDATE spells SET
    material = 'A diamond worth at least 300 GP, which the spell consumes',
    material_de = 'Ein Diamant im Wert von mindestens 300 GP, der durch den Zauber verbraucht wird'
WHERE name_de = 'Revivify' OR name_de = 'Wiederbeleben';

UPDATE spells SET
    material = 'A diamond worth at least 1000 GP and at least 1 cubic inch, which the spell consumes',
    material_de = 'Ein Diamant im Wert von mindestens 1000 GP und mindestens 1 Kubikzoll groß, der durch den Zauber verbraucht wird'
WHERE name_de = 'Resurrection' OR name_de = 'Auferstehung';

UPDATE spells SET
    material = 'A pinch of powder or sand that is colored red, yellow, and blue',
    material_de = 'Eine Prise rotes, gelbes und blaues Pulver oder Sand'
WHERE name_de = 'Color Spray' OR name_de = 'Farbsprühregen';

-- ============================================================================
-- 7. POPULATE EQUIPMENT DATABASE WITH COMMON D&D 5E ITEMS
-- ============================================================================

-- Delete existing sample data (optional)
-- DELETE FROM equipment WHERE id > 0;

-- WEAPONS - Einfache Nahkampfwaffen
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, damage_dice, damage_type, properties, weight_lbs) VALUES
('Club', 'Keule', 'weapon', 'common', 'Eine einfache Holzkeule', '1d4', 'Schlag', '{"light": true, "weapon_type": "simple"}', 2),
('Dagger', 'Dolch', 'weapon', 'common', 'Eine kurze Klinge zum Stechen', '1d4', 'Stich', '{"finesse": true, "light": true, "thrown": true, "range": "20/60", "weapon_type": "simple"}', 1),
('Greatclub', 'Großkeule', 'weapon', 'common', 'Eine große Holzkeule', '1d8', 'Schlag', '{"two_handed": true, "weapon_type": "simple"}', 10),
('Handaxe', 'Handaxt', 'weapon', 'common', 'Eine kleine Axt für eine Hand', '1d6', 'Hieb', '{"light": true, "thrown": true, "range": "20/60", "weapon_type": "simple"}', 2),
('Javelin', 'Speer (Wurf)', 'weapon', 'common', 'Ein Wurfspeer', '1d6', 'Stich', '{"thrown": true, "range": "30/120", "weapon_type": "simple"}', 2),
('Light Hammer', 'Leichter Hammer', 'weapon', 'common', 'Ein kleiner Hammer', '1d4', 'Schlag', '{"light": true, "thrown": true, "range": "20/60", "weapon_type": "simple"}', 2),
('Mace', 'Streitkolben', 'weapon', 'common', 'Eine schwere Keule mit Metallkopf', '1d6', 'Schlag', '{"weapon_type": "simple"}', 4),
('Quarterstaff', 'Kampfstab', 'weapon', 'common', 'Ein Holzstab', '1d6', 'Schlag', '{"versatile": true, "versatile_damage": "1d8", "weapon_type": "simple"}', 4),
('Sickle', 'Sichel', 'weapon', 'common', 'Ein Werkzeug als Waffe', '1d4', 'Hieb', '{"light": true, "weapon_type": "simple"}', 2),
('Spear', 'Speer', 'weapon', 'common', 'Eine lange Stichwaffe', '1d6', 'Stich', '{"thrown": true, "versatile": true, "range": "20/60", "versatile_damage": "1d8", "weapon_type": "simple"}', 3);

-- WEAPONS - Einfache Fernkampfwaffen
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, damage_dice, damage_type, properties, weight_lbs) VALUES
('Light Crossbow', 'Leichte Armbrust', 'weapon', 'common', 'Eine kleine Armbrust', '1d8', 'Stich', '{"ranged": true, "loading": true, "two_handed": true, "range": "80/320", "weapon_type": "simple"}', 5),
('Shortbow', 'Kurzbogen', 'weapon', 'common', 'Ein kleiner Bogen', '1d6', 'Stich', '{"ranged": true, "two_handed": true, "range": "80/320", "weapon_type": "simple"}', 2),
('Sling', 'Schleuder', 'weapon', 'common', 'Ein Lederriemen zum Steinwerfen', '1d4', 'Schlag', '{"ranged": true, "range": "30/120", "weapon_type": "simple"}', 0);

-- WEAPONS - Kriegswaffen Nahkampf
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, damage_dice, damage_type, properties, weight_lbs) VALUES
('Battleaxe', 'Streitaxt', 'weapon', 'common', 'Eine große Kampfaxt', '1d8', 'Hieb', '{"versatile": true, "versatile_damage": "1d10", "weapon_type": "martial"}', 4),
('Flail', 'Flegel', 'weapon', 'common', 'Eine stachelige Kugel an einer Kette', '1d8', 'Schlag', '{"weapon_type": "martial"}', 2),
('Glaive', 'Glefe', 'weapon', 'common', 'Eine Stangenwaffe mit Klinge', '1d10', 'Hieb', '{"heavy": true, "reach": true, "two_handed": true, "weapon_type": "martial"}', 6),
('Greataxe', 'Großaxt', 'weapon', 'common', 'Eine massive zweihändige Axt', '1d12', 'Hieb', '{"heavy": true, "two_handed": true, "weapon_type": "martial"}', 7),
('Greatsword', 'Großschwert', 'weapon', 'common', 'Ein großes zweihändiges Schwert', '2d6', 'Hieb', '{"heavy": true, "two_handed": true, "weapon_type": "martial"}', 6),
('Halberd', 'Hellebarde', 'weapon', 'common', 'Eine Stangenwaffe mit Axt und Spitze', '1d10', 'Hieb', '{"heavy": true, "reach": true, "two_handed": true, "weapon_type": "martial"}', 6),
('Lance', 'Lanze', 'weapon', 'common', 'Eine lange Kavalleriewaffe', '1d12', 'Stich', '{"reach": true, "special": true, "weapon_type": "martial"}', 6),
('Longsword', 'Langschwert', 'weapon', 'common', 'Ein vielseitiges Schwert', '1d8', 'Hieb', '{"versatile": true, "versatile_damage": "1d10", "weapon_type": "martial"}', 3),
('Maul', 'Streithammer', 'weapon', 'common', 'Ein großer zweihändiger Hammer', '2d6', 'Schlag', '{"heavy": true, "two_handed": true, "weapon_type": "martial"}', 10),
('Morningstar', 'Morgenstern', 'weapon', 'common', 'Ein stacheliger Streitkolben', '1d8', 'Stich', '{"weapon_type": "martial"}', 4),
('Pike', 'Pike', 'weapon', 'common', 'Ein sehr langer Speer', '1d10', 'Stich', '{"heavy": true, "reach": true, "two_handed": true, "weapon_type": "martial"}', 18),
('Rapier', 'Rapier', 'weapon', 'common', 'Ein dünnes Stechschwert', '1d8', 'Stich', '{"finesse": true, "weapon_type": "martial"}', 2),
('Scimitar', 'Krummsäbel', 'weapon', 'common', 'Eine gekrümmte Klinge', '1d6', 'Hieb', '{"finesse": true, "light": true, "weapon_type": "martial"}', 3),
('Shortsword', 'Kurzschwert', 'weapon', 'common', 'Eine kurze Klinge', '1d6', 'Stich', '{"finesse": true, "light": true, "weapon_type": "martial"}', 2),
('Trident', 'Dreizack', 'weapon', 'common', 'Ein dreizackiger Speer', '1d6', 'Stich', '{"thrown": true, "versatile": true, "range": "20/60", "versatile_damage": "1d8", "weapon_type": "martial"}', 4),
('War Pick', 'Kriegspicke', 'weapon', 'common', 'Eine Spitzhacke zum Durchdringen von Rüstungen', '1d8', 'Stich', '{"weapon_type": "martial"}', 2),
('Warhammer', 'Kriegshammer', 'weapon', 'common', 'Ein schwerer Hammer', '1d8', 'Schlag', '{"versatile": true, "versatile_damage": "1d10", "weapon_type": "martial"}', 2),
('Whip', 'Peitsche', 'weapon', 'common', 'Eine flexible Schlagwaffe', '1d4', 'Hieb', '{"finesse": true, "reach": true, "weapon_type": "martial"}', 3);

-- WEAPONS - Kriegswaffen Fernkampf
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, damage_dice, damage_type, properties, weight_lbs) VALUES
('Blowgun', 'Blasrohr', 'weapon', 'common', 'Ein Rohr zum Verschießen von Pfeilen', '1', 'Stich', '{"ranged": true, "loading": true, "range": "25/100", "weapon_type": "martial"}', 1),
('Hand Crossbow', 'Handarmbrust', 'weapon', 'common', 'Eine kleine einhändige Armbrust', '1d6', 'Stich', '{"ranged": true, "light": true, "loading": true, "range": "30/120", "weapon_type": "martial"}', 3),
('Heavy Crossbow', 'Schwere Armbrust', 'weapon', 'common', 'Eine große kraftvolle Armbrust', '1d10', 'Stich', '{"ranged": true, "heavy": true, "loading": true, "two_handed": true, "range": "100/400", "weapon_type": "martial"}', 18),
('Longbow', 'Langbogen', 'weapon', 'common', 'Ein großer kraftvoller Bogen', '1d8', 'Stich', '{"ranged": true, "heavy": true, "two_handed": true, "range": "150/600", "weapon_type": "martial"}', 2);

-- ARMOR - Leichte Rüstung
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, armor_class, properties, weight_lbs) VALUES
('Padded Armor', 'Gepolsterte Rüstung', 'armor', 'common', 'Gesteppte Schichten aus Stoff und Watte', 11, '{"armor_type": "light", "stealth_disadvantage": true}', 8),
('Leather Armor', 'Lederrüstung', 'armor', 'common', 'Gehärtete Lederbrust und Schulterschutz', 11, '{"armor_type": "light"}', 10),
('Studded Leather Armor', 'Beschlagene Lederrüstung', 'armor', 'common', 'Mit Nieten oder Spitzen verstärkte Lederrüstung', 12, '{"armor_type": "light"}', 13);

-- ARMOR - Mittlere Rüstung
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, armor_class, properties, weight_lbs) VALUES
('Hide Armor', 'Fellrüstung', 'armor', 'common', 'Grobe Rüstung aus dicken Fellen', 12, '{"armor_type": "medium"}', 12),
('Chain Shirt', 'Kettenhemd', 'armor', 'common', 'Aus ineinandergreifenden Metallringen', 13, '{"armor_type": "medium"}', 20),
('Scale Mail', 'Schuppenpanzer', 'armor', 'common', 'Lederrüstung mit überlappenden Metallschuppen', 14, '{"armor_type": "medium", "stealth_disadvantage": true}', 45),
('Breastplate', 'Brustpanzer', 'armor', 'common', 'Angepasstes Metallbruststück', 14, '{"armor_type": "medium"}', 20),
('Half Plate', 'Halbplattenpanzer', 'armor', 'common', 'Plattenpanzer für Brust und Arme', 15, '{"armor_type": "medium", "stealth_disadvantage": true}', 40);

-- ARMOR - Schwere Rüstung
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, armor_class, properties, weight_lbs) VALUES
('Ring Mail', 'Ringpanzer', 'armor', 'common', 'Lederrüstung mit eingenähten schweren Ringen', 14, '{"armor_type": "heavy", "stealth_disadvantage": true}', 40),
('Chain Mail', 'Kettenpanzer', 'armor', 'common', 'Ineinandergreifende Metallringe bedecken den ganzen Körper', 16, '{"armor_type": "heavy", "stealth_disadvantage": true}', 55),
('Splint Armor', 'Schienenpanzer', 'armor', 'common', 'Schmale vertikale Metallstreifen an Lederrücken genietet', 17, '{"armor_type": "heavy", "stealth_disadvantage": true}', 60),
('Plate Armor', 'Plattenpanzer', 'armor', 'common', 'Ineinandergreifende Metallplatten bedecken den ganzen Körper', 18, '{"armor_type": "heavy", "stealth_disadvantage": true}', 65);

-- SHIELDS
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, armor_class, weight_lbs) VALUES
('Shield', 'Schild', 'shield', 'common', 'Ein Schild aus Holz oder Metall, gewährt +2 RK', 2, 6);

-- CONSUMABLES - Tränke
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, weight_lbs) VALUES
('Potion of Healing', 'Heiltrank', 'consumable', 'common', 'Heilt 2d4+2 Trefferpunkte', 0.5),
('Potion of Greater Healing', 'Großer Heiltrank', 'consumable', 'uncommon', 'Heilt 4d4+4 Trefferpunkte', 0.5),
('Potion of Superior Healing', 'Überlegener Heiltrank', 'consumable', 'rare', 'Heilt 8d4+8 Trefferpunkte', 0.5),
('Potion of Supreme Healing', 'Ultimativer Heiltrank', 'consumable', 'very rare', 'Heilt 10d4+20 Trefferpunkte', 0.5),
('Antitoxin', 'Gegengift', 'consumable', 'common', 'Gewährt Vorteil auf Rettungswürfe gegen Gift für 1 Stunde', 0.5),
('Potion of Climbing', 'Trank des Kletterns', 'consumable', 'common', 'Gewährt Klettergeschwindigkeit gleich Gehgeschwindigkeit für 1 Stunde', 0.5),
('Potion of Invisibility', 'Trank der Unsichtbarkeit', 'consumable', 'very rare', 'Macht dich für 1 Stunde unsichtbar', 0.5);

-- TOOLS
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, weight_lbs) VALUES
('Thieves Tools', 'Diebeswerkzeug', 'tool', 'common', 'Werkzeuge zum Schlösserknacken und Entschärfen von Fallen', 1),
('Herbalism Kit', 'Kräuterkundeset', 'tool', 'common', 'Werkzeuge zum Identifizieren und Verwenden von Pflanzen', 3),
('Healers Kit', 'Heilerset', 'tool', 'common', 'Enthält Bandagen, Salben und Schienen', 3),
('Rope, Hempen (50 feet)', 'Seil, Hanf (15m)', 'tool', 'common', 'Hat 2 Trefferpunkte und kann mit DC 17 Stärkeprobe zerrissen werden', 10),
('Rope, Silk (50 feet)', 'Seil, Seide (15m)', 'tool', 'common', 'Hat 2 Trefferpunkte und kann mit DC 17 Stärkeprobe zerrissen werden', 5),
('Tinderbox', 'Feuerzeug', 'tool', 'common', 'Ein kleiner Behälter mit Feuerstein, Feuerstahl und Zunder', 1),
('Torch', 'Fackel', 'tool', 'common', 'Brennt 1 Stunde, spendet helles Licht in 6m Radius', 1),
('Lantern, Hooded', 'Laterne, Blendlaterne', 'tool', 'common', 'Wirft helles Licht in 9m Radius für 6 Stunden pro Pinte Öl', 2),
('Oil (flask)', 'Öl (Flasche)', 'consumable', 'common', 'Kann als Brennstoff oder als Wurfwaffe verwendet werden', 1),
('Waterskin', 'Wasserschlauch', 'tool', 'common', 'Fasst 4 Pinten Flüssigkeit', 5),
('Backpack', 'Rucksack', 'tool', 'common', 'Kann 0,03 Kubikmeter oder 15kg Ausrüstung halten', 5),
('Bedroll', 'Schlafsack', 'tool', 'common', 'Eine warme Decke und Schlafmatte', 7),
('Rations (1 day)', 'Rationen (1 Tag)', 'consumable', 'common', 'Getrocknete Lebensmittel für längere Reisen', 2),
('Tent, two-person', 'Zelt, Zweipersonen', 'tool', 'common', 'Ein einfacher und tragbarer Unterschlupf aus Segeltuch', 20);

-- MISC - Spell Components & Magic Items
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, weight_lbs) VALUES
('Component Pouch', 'Komponentenbeutel', 'misc', 'common', 'Enthält materielle Komponenten zum Zaubern', 2),
('Spellbook', 'Zauberbuch', 'misc', 'common', 'Ein ledergebundener Band mit 100 leeren Seiten', 3),
('Arcane Focus (Crystal)', 'Arkaner Fokus (Kristall)', 'misc', 'common', 'Ein speziell gefertigter Kristall zum Kanalisieren von Zaubern', 1),
('Arcane Focus (Orb)', 'Arkaner Fokus (Orb)', 'misc', 'common', 'Ein polierter Orb zum Kanalisieren von Zaubern', 3),
('Arcane Focus (Rod)', 'Arkaner Fokus (Stab)', 'misc', 'common', 'Ein speziell für Zauberei gefertigter Stab', 2),
('Arcane Focus (Staff)', 'Arkaner Fokus (Stecken)', 'misc', 'common', 'Ein Kampfstab als Zauberfokus', 4),
('Arcane Focus (Wand)', 'Arkaner Fokus (Zauberstab)', 'misc', 'common', 'Ein Zauberstab zum Kanalisieren von Zaubern', 1),
('Druidic Focus (Sprig of Mistletoe)', 'Druidenfokus (Mistelzweig)', 'misc', 'common', 'Ein Mistelzweig für druidische Magie', 0),
('Druidic Focus (Totem)', 'Druidenfokus (Totem)', 'misc', 'common', 'Ein kleines Totem, das die Natur repräsentiert', 0),
('Druidic Focus (Wooden Staff)', 'Druidenfokus (Holzstab)', 'misc', 'common', 'Ein Holzstab von einem heiligen Baum', 4),
('Druidic Focus (Yew Wand)', 'Druidenfokus (Eibenstab)', 'misc', 'common', 'Ein Zauberstab aus Eibenholz', 1),
('Holy Symbol (Amulet)', 'Heiliges Symbol (Amulett)', 'misc', 'common', 'Ein Amulett mit heiligem Symbol', 1),
('Holy Symbol (Emblem)', 'Heiliges Symbol (Emblem)', 'misc', 'common', 'Ein Emblem für göttliche Magie', 0),
('Holy Symbol (Reliquary)', 'Heiliges Symbol (Reliquiar)', 'misc', 'common', 'Ein Behälter mit einer heiligen Reliquie', 2);

-- MISC - Spell Component Materials
INSERT INTO equipment (name_en, name_de, type, rarity, description_de, weight_lbs) VALUES
('Diamond (50 GP)', 'Diamant (50 GP)', 'misc', 'uncommon', 'Ein kleiner Diamant im Wert von 50 Goldstücken', 0),
('Diamond (100 GP)', 'Diamant (100 GP)', 'misc', 'uncommon', 'Ein Diamant im Wert von 100 Goldstücken', 0),
('Diamond (300 GP)', 'Diamant (300 GP)', 'misc', 'rare', 'Ein Diamant im Wert von 300 Goldstücken (für Wiederbeleben)', 0),
('Diamond (500 GP)', 'Diamant (500 GP)', 'misc', 'rare', 'Ein großer Diamant im Wert von 500 Goldstücken', 0),
('Diamond (1000 GP)', 'Diamant (1000 GP)', 'misc', 'very rare', 'Ein großer Diamant im Wert von 1000 Goldstücken (für Auferstehung)', 0),
('Ruby', 'Rubin', 'misc', 'uncommon', 'Ein kostbarer roter Edelstein', 0),
('Sapphire', 'Saphir', 'misc', 'uncommon', 'Ein kostbarer blauer Edelstein', 0),
('Emerald', 'Smaragd', 'misc', 'uncommon', 'Ein kostbarer grüner Edelstein', 0),
('Pearl', 'Perle', 'misc', 'uncommon', 'Ein glänzender weißer Edelstein aus Austern', 0),
('Jade', 'Jade', 'misc', 'uncommon', 'Ein grüner Zierstein', 0),
('Incense', 'Weihrauch', 'misc', 'common', 'Duftendes Material, das wohlriechenden Rauch erzeugt', 0),
('Sulfur', 'Schwefel', 'misc', 'common', 'Gelbes kristallines Element für Feuerzauber', 0),
('Bat Guano', 'Fledermausguano', 'misc', 'common', 'Fledermauskot für explosive Zauber', 0),
('Charcoal', 'Holzkohle', 'misc', 'common', 'Verbranntes Holz für verschiedene Zauber', 0),
('Salt', 'Salz', 'misc', 'common', 'Gewöhnliches Salz für Schutzzauber', 1),
('Iron Filings', 'Eisenfeilspäne', 'misc', 'common', 'Kleine Eisenpartikel', 0),
('Silver Dust', 'Silberstaub', 'misc', 'uncommon', 'Pulverisiertes Silber', 0),
('Gold Dust', 'Goldstaub', 'misc', 'uncommon', 'Pulverisiertes Gold', 0),
('Crystal Prism', 'Kristallprisma', 'misc', 'uncommon', 'Ein Glasprisma, das Licht bricht', 0),
('Glass Bead', 'Glasperle', 'misc', 'common', 'Eine kleine Glaskugel', 0),
('Amber', 'Bernstein', 'misc', 'uncommon', 'Versteinertes Baumharz', 0),
('Bone', 'Knochen', 'misc', 'common', 'Ein Tierknochen', 0),
('Hair', 'Haar', 'misc', 'common', 'Eine Haarsträhne', 0),
('Feather', 'Feder', 'misc', 'common', 'Eine Vogelfeder', 0),
('Leather Strip', 'Lederstreifen', 'misc', 'common', 'Ein Streifen gegerbtes Leder', 0),
('Silk Thread', 'Seidenfaden', 'misc', 'common', 'Feiner Seidenfaden', 0),
('Velvet Cloth', 'Samttuch', 'misc', 'uncommon', 'Weicher Samtstoff', 0),
('Wool', 'Wolle', 'misc', 'common', 'Tierische Wollfaser', 0);

-- ============================================================================
-- Migration Complete!
-- ============================================================================
-- Your database is now updated with:
-- ✅ Currency tracking (gold, silver, copper)
-- ✅ Beast senses field
-- ✅ Spell material components
-- ✅ 100+ equipment items for database search
-- ============================================================================
