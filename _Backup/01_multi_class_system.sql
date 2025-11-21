-- ========================================
-- MULTI-CLASS SYSTEM MIGRATION
-- Erweitert die Datenbank für 5 Spielerklassen
-- ========================================

-- Characters Tabelle erweitern für alle Klassen
ALTER TABLE characters
ADD COLUMN IF NOT EXISTS class VARCHAR(50) DEFAULT 'druid',
ADD COLUMN IF NOT EXISTS class_features JSON,
ADD COLUMN IF NOT EXISTS background VARCHAR(50),
ADD COLUMN IF NOT EXISTS race VARCHAR(50),
ADD COLUMN IF NOT EXISTS inspiration BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS proficiency_bonus INT DEFAULT 2,
ADD COLUMN IF NOT EXISTS hit_dice_remaining VARCHAR(20),
ADD COLUMN IF NOT EXISTS death_saves JSON,
ADD COLUMN IF NOT EXISTS conditions JSON,
ADD COLUMN IF NOT EXISTS exhaustion_level INT DEFAULT 0;

-- Klassen-spezifische Ressourcen Tabelle
CREATE TABLE IF NOT EXISTS class_resources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT NOT NULL,
    resource_type VARCHAR(50) NOT NULL, -- z.B. 'sneak_attack', 'bardic_inspiration', 'rage', 'lay_on_hands'
    max_uses INT NOT NULL,
    current_uses INT NOT NULL,
    recovery_type VARCHAR(20) DEFAULT 'long_rest', -- 'short_rest', 'long_rest', 'none'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE
);

-- Klassenspezifische Fähigkeiten Tabelle
CREATE TABLE IF NOT EXISTS class_features (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class VARCHAR(50) NOT NULL,
    feature_name_de VARCHAR(100) NOT NULL,
    feature_name_en VARCHAR(100),
    level_required INT NOT NULL,
    subclass VARCHAR(50),
    description_de TEXT NOT NULL,
    description_en TEXT,
    feature_type VARCHAR(50), -- 'passive', 'action', 'bonus_action', 'reaction', 'special'
    uses_per_rest INT,
    recovery_type VARCHAR(20), -- 'short_rest', 'long_rest', 'none'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_class (class),
    INDEX idx_level (level_required)
);

-- Hintergründe Tabelle (Backgrounds)
CREATE TABLE IF NOT EXISTS backgrounds (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_de VARCHAR(100) NOT NULL,
    name_en VARCHAR(100),
    description_de TEXT,
    skill_proficiencies JSON, -- ['deception', 'insight']
    tool_proficiencies JSON,
    languages INT DEFAULT 0,
    equipment JSON,
    feature_name_de VARCHAR(100),
    feature_description_de TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Spellcasting Tabelle erweitern für verschiedene Klassen
ALTER TABLE spells
ADD COLUMN IF NOT EXISTS class_list JSON; -- Speichert alle Klassen die den Zauber nutzen können

-- Update existing spells to include class list
UPDATE spells SET class_list = '["Druide"]' WHERE class LIKE '%Druide%';

CREATE INDEX IF NOT EXISTS idx_spells_class_list ON spells((CAST(class_list AS CHAR(255))));
