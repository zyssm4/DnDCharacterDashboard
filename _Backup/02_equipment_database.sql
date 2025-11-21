-- ========================================
-- AUSRÜSTUNGS-DATENBANK
-- Vollständige D&D 5e Ausrüstung auf Deutsch
-- ========================================

-- Equipment Tabelle erweitern
ALTER TABLE equipment
ADD COLUMN IF NOT EXISTS category VARCHAR(50), -- 'weapon', 'armor', 'tool', 'gear', 'magic_item'
ADD COLUMN IF NOT EXISTS rarity VARCHAR(50) DEFAULT 'common',
ADD COLUMN IF NOT EXISTS attunement BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS magic_bonus INT DEFAULT 0,
ADD COLUMN IF NOT EXISTS properties JSON,
ADD COLUMN IF NOT EXISTS range_normal INT,
ADD COLUMN IF NOT EXISTS range_long INT;

-- WAFFEN
INSERT INTO equipment (name_de, name_en, type, category, price_gm, weight_lbs, damage_dice, damage_type, properties, description_de) VALUES
-- Einfache Nahkampfwaffen
('Keule', 'Club', 'weapon', 'weapon', 0.1, 1, '1d4', 'Wucht', '{"simple": true, "melee": true, "light": true}', 'Eine einfache Holzkeule.'),
('Dolch', 'Dagger', 'weapon', 'weapon', 2, 0.5, '1d4', 'Stich', '{"simple": true, "melee": true, "finesse": true, "light": true, "thrown": true, "range": [20, 60]}', 'Eine kurze Klinge, perfekt zum Werfen.'),
('Großkeule', 'Greatclub', 'weapon', 'weapon', 0.2, 5, '1d8', 'Wucht', '{"simple": true, "melee": true, "two_handed": true}', 'Eine große, schwere Keule.'),
('Handaxt', 'Handaxe', 'weapon', 'weapon', 5, 1, '1d6', 'Hieb', '{"simple": true, "melee": true, "light": true, "thrown": true, "range": [20, 60]}', 'Eine einhandige Axt, die geworfen werden kann.'),
('Wurfspeer', 'Javelin', 'weapon', 'weapon', 0.5, 1, '1d6', 'Stich', '{"simple": true, "melee": true, "thrown": true, "range": [30, 120]}', 'Ein leichter Speer zum Werfen.'),
('Streitkolben', 'Mace', 'weapon', 'weapon', 5, 2, '1d6', 'Wucht', '{"simple": true, "melee": true}', 'Eine schwere Schlagwaffe mit Metallkopf.'),
('Quarterstaff', 'Quarterstaff', 'weapon', 'weapon', 0.2, 2, '1d6', 'Wucht', '{"simple": true, "melee": true, "versatile": "1d8"}', 'Ein langer Kampfstab.'),
('Sichel', 'Sickle', 'weapon', 'weapon', 1, 1, '1d4', 'Hieb', '{"simple": true, "melee": true, "light": true}', 'Eine gebogene Klinge.'),
('Speer', 'Spear', 'weapon', 'weapon', 1, 1.5, '1d6', 'Stich', '{"simple": true, "melee": true, "thrown": true, "versatile": "1d8", "range": [20, 60]}', 'Ein vielseitiger Speer.'),

-- Einfache Fernkampfwaffen
('Leichte Armbrust', 'Light Crossbow', 'weapon', 'weapon', 25, 2.5, '1d8', 'Stich', '{"simple": true, "ranged": true, "ammunition": true, "loading": true, "two_handed": true, "range": [80, 320]}', 'Eine einfach zu bedienende Armbrust.'),
('Kurzbogen', 'Shortbow', 'weapon', 'weapon', 25, 1, '1d6', 'Stich', '{"simple": true, "ranged": true, "ammunition": true, "two_handed": true, "range": [80, 320]}', 'Ein kompakter Bogen.'),
('Schleuder', 'Sling', 'weapon', 'weapon', 0.1, 0.1, '1d4', 'Wucht', '{"simple": true, "ranged": true, "ammunition": true, "range": [30, 120]}', 'Eine einfache Schleuder.'),

-- Kriegswaffen Nahkampf
('Streitaxt', 'Battleaxe', 'weapon', 'weapon', 10, 2, '1d8', 'Hieb', '{"martial": true, "melee": true, "versatile": "1d10"}', 'Eine einhandige Kriegsaxt.'),
('Morgenstern', 'Flail', 'weapon', 'weapon', 10, 1, '1d8', 'Wucht', '{"martial": true, "melee": true}', 'Eine Kette mit Stachelkugel.'),
('Glefe', 'Glaive', 'weapon', 'weapon', 20, 3, '1d10', 'Hieb', '{"martial": true, "melee": true, "heavy": true, "reach": true, "two_handed": true}', 'Eine Stangenwaffe mit Klinge.'),
('Großaxt', 'Greataxe', 'weapon', 'weapon', 30, 3.5, '1d12', 'Hieb', '{"martial": true, "melee": true, "heavy": true, "two_handed": true}', 'Eine massive Zweihandaxt.'),
('Großschwert', 'Greatsword', 'weapon', 'weapon', 50, 3, '2d6', 'Hieb', '{"martial": true, "melee": true, "heavy": true, "two_handed": true}', 'Ein gewaltiges Zweihandschwert.'),
('Hellebarde', 'Halberd', 'weapon', 'weapon', 20, 3, '1d10', 'Hieb', '{"martial": true, "melee": true, "heavy": true, "reach": true, "two_handed": true}', 'Eine Stangenwaffe mit Axtklinge.'),
('Lanze', 'Lance', 'weapon', 'weapon', 10, 3, '1d12', 'Stich', '{"martial": true, "melee": true, "reach": true, "special": true}', 'Eine Reiterlanze.'),
('Langschwert', 'Longsword', 'weapon', 'weapon', 15, 1.5, '1d8', 'Hieb', '{"martial": true, "melee": true, "versatile": "1d10"}', 'Ein klassisches Ritterschwert.'),
('Kriegshammer', 'Warhammer', 'weapon', 'weapon', 15, 1, '1d8', 'Wucht', '{"martial": true, "melee": true, "versatile": "1d10"}', 'Ein schwerer Kampfhammer.'),
('Rapier', 'Rapier', 'weapon', 'weapon', 25, 1, '1d8', 'Stich', '{"martial": true, "melee": true, "finesse": true}', 'Ein elegantes Fechtdegen.'),
('Säbel', 'Scimitar', 'weapon', 'weapon', 25, 1.5, '1d6', 'Hieb', '{"martial": true, "melee": true, "finesse": true, "light": true}', 'Ein gebogenes Schwert.'),
('Kurzschwert', 'Shortsword', 'weapon', 'weapon', 10, 1, '1d6', 'Stich', '{"martial": true, "melee": true, "finesse": true, "light": true}', 'Ein kurzes, leichtes Schwert.'),
('Dreizack', 'Trident', 'weapon', 'weapon', 5, 2, '1d6', 'Stich', '{"martial": true, "melee": true, "thrown": true, "versatile": "1d8", "range": [20, 60]}', 'Eine dreizackige Speerwaffe.'),

-- Kriegswaffen Fernkampf
('Armbrust', 'Heavy Crossbow', 'weapon', 'weapon', 50, 9, '1d10', 'Stich', '{"martial": true, "ranged": true, "ammunition": true, "heavy": true, "loading": true, "two_handed": true, "range": [100, 400]}', 'Eine schwere Armbrust mit großer Reichweite.'),
('Handarmbrust', 'Hand Crossbow', 'weapon', 'weapon', 75, 1.5, '1d6', 'Stich', '{"martial": true, "ranged": true, "ammunition": true, "light": true, "loading": true, "range": [30, 120]}', 'Eine kompakte Einhand-Armbrust.'),
('Langbogen', 'Longbow', 'weapon', 'weapon', 50, 1, '1d8', 'Stich', '{"martial": true, "ranged": true, "ammunition": true, "heavy": true, "two_handed": true, "range": [150, 600]}', 'Ein mächtiger Kriegsbogen.'),
('Netz', 'Net', 'weapon', 'weapon', 1, 1.5, '0', 'Spezial', '{"martial": true, "ranged": true, "thrown": true, "special": true, "range": [5, 15]}', 'Ein Wurfnetz zum Fangen von Gegnern.');

-- RÜSTUNGEN
INSERT INTO equipment (name_de, name_en, type, category, price_gm, weight_lbs, armor_class, properties, description_de) VALUES
-- Leichte Rüstung
('Gepolsterte Rüstung', 'Padded Armor', 'armor', 'armor', 5, 4, 11, '{"armor_type": "light", "stealth_disadvantage": true}', 'Gepolsterte Stoffrüstung.'),
('Lederrüstung', 'Leather Armor', 'armor', 'armor', 10, 5, 11, '{"armor_type": "light"}', 'Weiche, flexible Lederrüstung.'),
('Beschlagenes Leder', 'Studded Leather', 'armor', 'armor', 45, 6.5, 12, '{"armor_type": "light"}', 'Lederrüstung mit Metallnieten verstärkt.'),

-- Mittlere Rüstung
('Fellrüstung', 'Hide Armor', 'armor', 'armor', 10, 6, 12, '{"armor_type": "medium"}', 'Rohe Tierhäute als Rüstung.'),
('Kettenhemd', 'Chain Shirt', 'armor', 'armor', 50, 10, 13, '{"armor_type": "medium"}', 'Ein Hemd aus Kettengliedern.'),
('Schuppenpanzer', 'Scale Mail', 'armor', 'armor', 50, 22.5, 14, '{"armor_type": "medium", "stealth_disadvantage": true}', 'Rüstung aus überlappenden Metallschuppen.'),
('Brustpanzer', 'Breastplate', 'armor', 'armor', 400, 10, 14, '{"armor_type": "medium"}', 'Ein angepasster Brustschutz.'),
('Halbplattenrüstung', 'Half Plate', 'armor', 'armor', 750, 20, 15, '{"armor_type": "medium", "stealth_disadvantage": true}', 'Teilweise Plattenrüstung über Kettenhemd.'),

-- Schwere Rüstung
('Ringpanzer', 'Ring Mail', 'armor', 'armor', 30, 20, 14, '{"armor_type": "heavy", "stealth_disadvantage": true}', 'Lederrüstung mit Metallringen.'),
('Kettenrüstung', 'Chain Mail', 'armor', 'armor', 75, 27.5, 16, '{"armor_type": "heavy", "strength_requirement": 13, "stealth_disadvantage": true}', 'Komplette Kettenrüstung.'),
('Bänderpanzer', 'Splint Armor', 'armor', 'armor', 200, 30, 17, '{"armor_type": "heavy", "strength_requirement": 15, "stealth_disadvantage": true}', 'Rüstung aus Metallbändern.'),
('Plattenrüstung', 'Plate Armor', 'armor', 'armor', 1500, 32.5, 18, '{"armor_type": "heavy", "strength_requirement": 15, "stealth_disadvantage": true}', 'Die beste nicht-magische Rüstung.'),

-- Schilde
('Schild', 'Shield', 'armor', 'armor', 10, 3, 2, '{"armor_type": "shield"}', 'Gewährt +2 RK.');

-- WERKZEUGE & AUSRÜSTUNG
INSERT INTO equipment (name_de, name_en, type, category, price_gm, weight_lbs, description_de) VALUES
-- Werkzeuge
('Diebeswerkzeug', 'Thieves\' Tools', 'tool', 'tool', 25, 0.5, 'Werkzeuge zum Schlösserknacken und Fallen entschärfen.'),
('Schmiedewerkzeug', 'Smith\'s Tools', 'tool', 'tool', 20, 4, 'Werkzeuge für Schmiedearbeiten.'),
('Handwerkzeug (Tischler)', 'Carpenter\'s Tools', 'tool', 'tool', 8, 3, 'Werkzeuge für Holzarbeiten.'),
('Alchemistenwerkzeug', 'Alchemist\'s Supplies', 'tool', 'tool', 50, 4, 'Ausrüstung für alchemistische Experimente.'),
('Brauwerkzeug', 'Brewer\'s Supplies', 'tool', 'tool', 20, 4.5, 'Werkzeuge zum Brauen von Getränken.'),
('Kochgeschirr', 'Cook\'s Utensils', 'tool', 'tool', 1, 4, 'Töpfe, Pfannen und Besteck zum Kochen.'),
('Heiler-Set', 'Healer\'s Kit', 'tool', 'gear', 5, 1.5, 'Enthält Bandagen und Salben. 10 Verwendungen.'),
('Kräuterkundler-Set', 'Herbalism Kit', 'tool', 'tool', 5, 1.5, 'Werkzeuge zum Sammeln und Verarbeiten von Kräutern.'),

-- Musikinstrumente
('Laute', 'Lute', 'tool', 'tool', 35, 1, 'Ein Saiteninstrument für Barden.'),
('Flöte', 'Flute', 'tool', 'tool', 2, 0.5, 'Ein Holzblasinstrument.'),
('Trommel', 'Drum', 'tool', 'tool', 6, 1.5, 'Ein Schlaginstrument.'),
('Harfe', 'Harp', 'tool', 'tool', 30, 1, 'Ein elegantes Saiteninstrument.'),
('Horn', 'Horn', 'tool', 'tool', 3, 1, 'Ein Blasinstrument.'),
('Panflöte', 'Pan Flute', 'tool', 'tool', 12, 1, 'Eine Flöte aus mehreren Rohren.'),

-- Abenteuerausrüstung
('Rucksack', 'Backpack', 'gear', 'gear', 2, 2.5, 'Kann 15kg Ausrüstung tragen.'),
('Bettrolle', 'Bedroll', 'gear', 'gear', 1, 3.5, 'Eine Decke und Polsterung zum Schlafen.'),
('Dietrichset', 'Crowbar', 'gear', 'gear', 2, 2.5, 'Ein Brecheisen zum Aufhebeln.'),
('Fackel', 'Torch', 'gear', 'gear', 0.01, 0.5, 'Brennt 1 Stunde, 6m helles Licht, 6m dämmrig.'),
('Feuerstein und Stahl', 'Tinderbox', 'gear', 'gear', 0.5, 0.5, 'Zum Feuermachen.'),
('Hanfseil (15m)', 'Hempen Rope (50ft)', 'gear', 'gear', 1, 5, '15m starkes Seil.'),
('Kletterausrüstung', 'Climbing Kit', 'gear', 'gear', 25, 6, 'Haken, Stiefel, Handschuhe und Gurt.'),
('Laterne (Blendlaterne)', 'Lantern (Bullseye)', 'gear', 'gear', 10, 1, 'Wirft 18m Lichtkegel, 18m dämmrig.'),
('Laterne (Sturmlaterne)', 'Lantern (Hooded)', 'gear', 'gear', 5, 1, '9m helles Licht, 9m dämmrig.'),
('Öl (Flasche)', 'Oil (Flask)', 'gear', 'gear', 0.1, 0.5, 'Brennt 6 Stunden in Laterne oder als Wurfwaffe.'),
('Wasserschlauch', 'Waterskin', 'gear', 'gear', 0.2, 2.5, 'Fasst ca. 2 Liter Flüssigkeit.'),
('Rationen (1 Tag)', 'Rations (1 day)', 'gear', 'gear', 0.5, 1, 'Getrocknetes Essen für einen Tag.'),
('Seil (Seide, 15m)', 'Silk Rope (50ft)', 'gear', 'gear', 10, 2.5, 'Leichtes aber starkes Seil.'),
('Zelt (2 Personen)', 'Tent (2-person)', 'gear', 'gear', 2, 10, 'Ein einfaches Zelt für zwei Personen.'),
('Zunderbüchse', 'Tinderbox', 'gear', 'gear', 0.5, 0.5, 'Feuerstein, Stahl und Zunder.'),
('Wetzstein', 'Whetstone', 'gear', 'gear', 0.01, 0.5, 'Zum Schärfen von Klingen.'),
('Kreide', 'Chalk', 'gear', 'gear', 0.01, 0.1, 'Zum Markieren.'),
('Hammer', 'Hammer', 'gear', 'gear', 1, 1.5, 'Ein normaler Hammer.'),
('Brecheisen', 'Crowbar', 'gear', 'gear', 2, 2.5, 'Zum Aufbrechen.'),
('Fernrohr', 'Spyglass', 'gear', 'gear', 1000, 0.5, 'Vergrößert bis zu zweifach.'),
('Sanduhr', 'Hourglass', 'gear', 'gear', 25, 0.5, 'Misst eine Stunde Zeit.'),
('Kompass', 'Compass', 'gear', 'gear', 25, 0.5, 'Zeigt nach Norden.'),
('Lupe', 'Magnifying Glass', 'gear', 'gear', 100, 0.1, 'Gewährt Vorteil auf Untersuchungen kleiner Objekte.'),

-- Heilige Symbole
('Heiliges Symbol (Amulett)', 'Holy Symbol (Amulet)', 'gear', 'gear', 5, 0.5, 'Zauberfokus für Kleriker und Paladine.'),
('Heiliges Symbol (Emblem)', 'Holy Symbol (Emblem)', 'gear', 'gear', 5, 0.1, 'Kann auf Schild angebracht werden.'),
('Heiliges Symbol (Reliquiar)', 'Holy Symbol (Reliquary)', 'gear', 'gear', 5, 1, 'Eine heilige Reliquie in einer Box.'),

-- Arkane Fokusse
('Kristall', 'Crystal', 'gear', 'gear', 10, 0.5, 'Arkanfokus für Magier und Hexenmeister.'),
('Zauberstab', 'Wand', 'gear', 'gear', 10, 0.5, 'Arkanfokus für Magier und Hexenmeister.'),
('Stab', 'Staff', 'gear', 'gear', 5, 2, 'Arkanfokus für Magier und Hexenmeister.'),
('Zauberbuch', 'Spellbook', 'gear', 'gear', 50, 1.5, 'Enthält Platz für 100 Seiten Zauber.'),

-- Piratenzubehör
('Enterhaken', 'Grappling Hook', 'gear', 'gear', 2, 2, 'Zum Erklettern und Entern.'),
('Fernrohr', 'Spyglass', 'gear', 'gear', 1000, 0.5, 'Unverzichtbar für Piraten.'),
('Navigationsausrüstung', 'Navigator\'s Tools', 'tool', 'tool', 25, 1, 'Karten, Sextant und Kompass zur Navigation.'),
('Schiffsausrüstung', 'Vehicles (Water)', 'tool', 'tool', 0, 0, 'Fähigkeit, Wasserfahrzeuge zu steuern.'),
('Rum (Flasche)', 'Rum (bottle)', 'gear', 'gear', 2, 1, 'Hochprozentiges Piratengetränk.');

-- Tränke & Verbrauchsmaterialien
INSERT INTO equipment (name_de, name_en, type, category, price_gm, weight_lbs, rarity, description_de) VALUES
('Heiltrank', 'Potion of Healing', 'potion', 'magic_item', 50, 0.25, 'common', 'Stellt 2d4+2 TP wieder her.'),
('Heiltrank (Groß)', 'Potion of Greater Healing', 'potion', 'magic_item', 150, 0.25, 'uncommon', 'Stellt 4d4+4 TP wieder her.'),
('Heiltrank (Überragend)', 'Potion of Superior Healing', 'potion', 'magic_item', 500, 0.25, 'rare', 'Stellt 8d4+8 TP wieder her.'),
('Heiltrank (Supreme)', 'Potion of Supreme Healing', 'potion', 'magic_item', 2000, 0.25, 'very_rare', 'Stellt 10d4+20 TP wieder her.'),
('Antitoxin', 'Antitoxin', 'potion', 'gear', 50, 0.1, 'common', 'Gewährt Vorteil gegen Gift für 1 Stunde.'),
('Säureflasche', 'Acid (vial)', 'potion', 'gear', 25, 0.5, 'common', 'Verursacht 2d6 Säureschaden.');

CREATE INDEX idx_equipment_category ON equipment(category);
CREATE INDEX idx_equipment_type ON equipment(type);
CREATE INDEX idx_equipment_rarity ON equipment(rarity);
