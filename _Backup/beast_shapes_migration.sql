-- Beast Shapes Table Migration
-- This creates/updates the beast_shapes table with complete wildshape form data

-- Drop table if exists and recreate with full schema
DROP TABLE IF EXISTS beast_shapes;

CREATE TABLE beast_shapes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_de VARCHAR(100) NOT NULL,
    name_en VARCHAR(100),
    cr DECIMAL(4,3) NOT NULL,
    min_level INT DEFAULT 2,
    hp INT NOT NULL,
    ac INT NOT NULL,
    speed VARCHAR(100) NOT NULL,

    -- Ability Scores
    strength INT NOT NULL,
    dexterity INT NOT NULL,
    constitution INT NOT NULL,
    intelligence INT NOT NULL,
    wisdom INT NOT NULL,
    charisma INT NOT NULL,

    -- Combat & Features
    special_abilities TEXT,
    attacks JSON, -- Array of {name, bonus, damage}

    -- Restrictions
    requires_swimming BOOLEAN DEFAULT FALSE,
    requires_flying BOOLEAN DEFAULT FALSE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert CR 0 beasts
INSERT INTO beast_shapes (name_de, name_en, cr, min_level, hp, ac, speed, strength, dexterity, constitution, intelligence, wisdom, charisma, special_abilities, attacks, requires_swimming, requires_flying) VALUES
('Katze', 'Cat', 0, 2, 2, 12, '12m', 3, 15, 10, 3, 12, 7, 'Heimlichkeit +4, Scharfes Gehör und Geruchssinn', '[{"name":"Klauen","bonus":0,"damage":"1"}]', FALSE, FALSE),
('Rabe', 'Raven', 0, 2, 1, 12, '3m, fliegen 15m', 2, 14, 8, 2, 12, 6, 'Mimikry (Geräusche imitieren)', '[{"name":"Schnabel","bonus":4,"damage":"1"}]', FALSE, TRUE),
('Spinne', 'Spider', 0, 2, 1, 12, '6m, klettern 6m', 2, 14, 8, 1, 10, 2, 'Spinnensinne, Spinnenbewegung', '[{"name":"Biss","bonus":4,"damage":"1 + Gift"}]', FALSE, FALSE);

-- Insert CR 1/8 beasts
INSERT INTO beast_shapes (name_de, name_en, cr, min_level, hp, ac, speed, strength, dexterity, constitution, intelligence, wisdom, charisma, special_abilities, attacks, requires_swimming, requires_flying) VALUES
('Adler', 'Eagle', 0.125, 2, 3, 12, '3m, fliegen 18m', 6, 15, 10, 2, 14, 7, 'Scharfer Blick (Vorteil auf Wahrnehmung)', '[{"name":"Klauen","bonus":4,"damage":"1d4+2 Hieb"}]', FALSE, TRUE),
('Riesenratte', 'Giant Rat', 0.125, 2, 7, 12, '9m', 7, 15, 11, 2, 10, 4, 'Scharfe Sinne, Rudeltaktik', '[{"name":"Biss","bonus":4,"damage":"1d4+2 Stich"}]', FALSE, FALSE),
('Mastiff', 'Mastiff', 0.125, 2, 5, 12, '12m', 13, 14, 12, 3, 12, 7, 'Scharfes Gehör und Geruchssinn', '[{"name":"Biss","bonus":3,"damage":"1d6+1 Stich"}]', FALSE, FALSE);

-- Insert CR 1/4 beasts
INSERT INTO beast_shapes (name_de, name_en, cr, min_level, hp, ac, speed, strength, dexterity, constitution, intelligence, wisdom, charisma, special_abilities, attacks, requires_swimming, requires_flying) VALUES
('Wolf', 'Wolf', 0.25, 2, 11, 13, '12m', 12, 15, 12, 3, 12, 6, 'Rudeltaktik (Vorteil mit Verbündeten), Scharfer Blick', '[{"name":"Biss","bonus":4,"damage":"2d4+2 Stich"}]', FALSE, FALSE),
('Riesengiftschlange', 'Giant Poisonous Snake', 0.25, 2, 11, 14, '9m, schwimmen 9m', 10, 18, 13, 2, 10, 3, 'Giftbiss (RW KON SG 11 oder 3d6 Giftschaden)', '[{"name":"Biss","bonus":6,"damage":"1d4+4 Stich + 3d6 Gift"}]', TRUE, FALSE),
('Wildschwein', 'Boar', 0.25, 2, 11, 11, '12m', 13, 11, 12, 2, 9, 5, 'Ansturm (nach 6m Bewegung zusätzlicher Stoßangriff), Tapferkeit', '[{"name":"Stoßzahn","bonus":3,"damage":"1d6+1 Hieb"}]', FALSE, FALSE),
('Panther', 'Panther', 0.25, 2, 13, 12, '15m, klettern 12m', 14, 15, 10, 3, 14, 7, 'Anspringen (Ziel niederwerfen nach Sprung), Heimlichkeit +6', '[{"name":"Biss","bonus":4,"damage":"1d6+2 Stich"},{"name":"Klauen","bonus":4,"damage":"1d4+2 Hieb"}]', FALSE, FALSE),
('Rieseneule', 'Giant Owl', 0.25, 2, 19, 12, '1,5m, fliegen 18m', 13, 15, 12, 8, 13, 10, 'Überragende Sinne (Vorteil auf Wahrnehmung), Lautloser Flug', '[{"name":"Klauen","bonus":4,"damage":"2d6+2 Hieb"}]', FALSE, TRUE);

-- Insert CR 1/2 beasts
INSERT INTO beast_shapes (name_de, name_en, cr, min_level, hp, ac, speed, strength, dexterity, constitution, intelligence, wisdom, charisma, special_abilities, attacks, requires_swimming, requires_flying) VALUES
('Riesenziegenspinne', 'Giant Spider', 0.5, 4, 19, 13, '9m, klettern 9m', 14, 16, 12, 3, 11, 4, 'Netzbewegung (ignoriert Bewegungseinschränkungen von Netzen), Spinnensinne', '[{"name":"Biss","bonus":5,"damage":"1d8+3 Stich + 2d8 Gift"}]', FALSE, FALSE),
('Reh', 'Elk', 0.5, 4, 13, 13, '15m', 11, 16, 11, 2, 14, 5, 'Ansturm (nach 6m zusätzlicher Hufangriff)', '[{"name":"Geweih","bonus":5,"damage":"1d6+3 Stich"},{"name":"Hufe","bonus":5,"damage":"1d4+3 Wucht"}]', FALSE, FALSE),
('Krokodil', 'Crocodile', 0.5, 4, 19, 12, '6m, schwimmen 9m', 15, 10, 13, 2, 10, 5, 'Angriff halten (bei Treffer Ziel festhalten)', '[{"name":"Biss","bonus":4,"damage":"1d10+2 Stich"}]', TRUE, FALSE),
('Riesenwespe', 'Giant Wasp', 0.5, 4, 13, 12, '3m, fliegen 15m', 10, 14, 10, 1, 10, 3, 'Giftiger Stachel (RW KON SG 11 oder 3d6 Giftschaden)', '[{"name":"Stachel","bonus":4,"damage":"1d6+2 Stich + 3d6 Gift"}]', FALSE, TRUE);

-- Insert CR 1 beasts
INSERT INTO beast_shapes (name_de, name_en, cr, min_level, hp, ac, speed, strength, dexterity, constitution, intelligence, wisdom, charisma, special_abilities, attacks, requires_swimming, requires_flying) VALUES
('Riesengeier', 'Giant Vulture', 1, 8, 22, 10, '3m, fliegen 18m', 15, 10, 15, 6, 12, 7, 'Rudelstrategie (Vorteil mit Verbündeten), Scharfer Blick', '[{"name":"Schnabel","bonus":4,"damage":"2d4+2 Stich"},{"name":"Klauen","bonus":4,"damage":"2d6+2 Hieb"}]', FALSE, TRUE),
('Braunbär', 'Brown Bear', 1, 8, 34, 11, '12m, klettern 9m', 19, 10, 16, 2, 13, 7, 'Scharfer Geruchssinn (Vorteil auf Wahrnehmung)', '[{"name":"Biss","bonus":6,"damage":"1d8+4 Stich"},{"name":"Klauen","bonus":6,"damage":"2d6+4 Hieb"}]', FALSE, FALSE),
('Riesenhyäne', 'Giant Hyena', 1, 8, 45, 12, '15m', 16, 14, 14, 2, 12, 7, 'Niederwerfen (bei Treffer Ziel niederstrecken), Rampage (Bonusaktion bei Kill)', '[{"name":"Biss","bonus":5,"damage":"2d6+3 Stich"}]', FALSE, FALSE),
('Riesenkröte', 'Giant Toad', 1, 8, 39, 11, '6m, schwimmen 12m', 15, 13, 13, 2, 10, 3, 'Amphibisch (atmet Luft und Wasser), Verschlingen (kleine Kreaturen)', '[{"name":"Biss","bonus":4,"damage":"1d10+2 Stich + Greifen"}]', TRUE, FALSE),
('Riesenkrake', 'Giant Octopus', 1, 8, 52, 11, '3m, schwimmen 18m', 17, 13, 13, 4, 10, 4, 'Tintenwolke (verschleiert 6m Radius), Unterwasseratmung', '[{"name":"Tentakel","bonus":5,"damage":"1d6+3 Wucht"},{"name":"Tinte","bonus":0,"damage":"Blind"}]', TRUE, FALSE);

-- Insert CR 2 beasts (Moon Druids Level 6+)
INSERT INTO beast_shapes (name_de, name_en, cr, min_level, hp, ac, speed, strength, dexterity, constitution, intelligence, wisdom, charisma, special_abilities, attacks, requires_swimming, requires_flying) VALUES
('Riesenkrokodil', 'Giant Crocodile', 2, 6, 85, 14, '9m, schwimmen 15m', 21, 9, 17, 2, 10, 7, 'Angriff halten (hält Ziel fest), Mehrfachangriff', '[{"name":"Biss","bonus":8,"damage":"3d10+5 Stich"},{"name":"Schwanz","bonus":8,"damage":"2d8+5 Wucht"}]', TRUE, FALSE),
('Säbelzahntiger', 'Saber-toothed Tiger', 2, 6, 52, 12, '12m', 18, 14, 15, 3, 12, 8, 'Anspringen (15m Bewegung = Ziel niederwerfen), Mehrfachangriff', '[{"name":"Biss","bonus":6,"damage":"1d10+4 Stich"},{"name":"Klauen","bonus":6,"damage":"2d6+4 Hieb"}]', FALSE, FALSE),
('Plesiosaurus', 'Plesiosaurus', 2, 6, 68, 13, '6m, schwimmen 12m', 18, 15, 16, 2, 12, 5, 'Unterwasseratmung (nur im Wasser)', '[{"name":"Biss","bonus":6,"damage":"3d6+4 Stich"}]', TRUE, FALSE),
('Riesenconstrictor', 'Giant Constrictor Snake', 2, 6, 60, 12, '9m, schwimmen 9m', 19, 14, 12, 1, 10, 3, 'Umschlingen (hält Ziel fest), Würgen (automatischer Schaden)', '[{"name":"Biss","bonus":6,"damage":"2d6+4 Stich"},{"name":"Umschlingen","bonus":6,"damage":"2d8+4 Wucht + Greifen"}]', TRUE, FALSE);

-- Insert CR 3 beasts (Moon Druids Level 9+)
INSERT INTO beast_shapes (name_de, name_en, cr, min_level, hp, ac, speed, strength, dexterity, constitution, intelligence, wisdom, charisma, special_abilities, attacks, requires_swimming, requires_flying) VALUES
('Ankylosaurus', 'Ankylosaurus', 3, 9, 68, 15, '9m', 19, 11, 15, 2, 12, 5, 'Schwanzangriff (niederstrecken bei Treffer), Mehrfachangriff', '[{"name":"Schwanz","bonus":7,"damage":"4d6+4 Wucht"}]', FALSE, FALSE),
('Riesenskorpion', 'Giant Scorpion', 3, 9, 52, 15, '12m', 15, 13, 15, 1, 9, 3, 'Mehrfachangriff (Scheren + Stachel), Giftiger Stachel (4d10 Gift)', '[{"name":"Schere","bonus":4,"damage":"1d8+2 Wucht + Greifen"},{"name":"Stachel","bonus":4,"damage":"1d10+2 Stich + 4d10 Gift"}]', FALSE, FALSE);

-- Create index for faster lookups
CREATE INDEX idx_cr ON beast_shapes(cr);
CREATE INDEX idx_min_level ON beast_shapes(min_level);
CREATE INDEX idx_requirements ON beast_shapes(requires_swimming, requires_flying);
