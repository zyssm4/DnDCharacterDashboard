-- SQL Script to add description columns to spells table
-- Execute this first to add the missing columns

ALTER TABLE `spells`
ADD COLUMN `description_de` TEXT DEFAULT NULL COMMENT 'German spell description',
ADD COLUMN `description_en` TEXT DEFAULT NULL COMMENT 'English spell description',
ADD COLUMN `school_de` VARCHAR(255) DEFAULT NULL COMMENT 'German school name',
ADD COLUMN `casting_time_de` VARCHAR(255) DEFAULT NULL COMMENT 'German casting time',
ADD COLUMN `range_de` VARCHAR(255) DEFAULT NULL COMMENT 'German range',
ADD COLUMN `duration_de` VARCHAR(255) DEFAULT NULL COMMENT 'German duration';

-- Update German school names based on existing school column
UPDATE `spells` SET `school_de` = 'Verwandlung' WHERE `school` = 'transmutation';
UPDATE `spells` SET `school_de` = 'Beschwörung' WHERE `school` = 'conjuration';
UPDATE `spells` SET `school_de` = 'Hervorrufung' WHERE `school` = 'evocation';
UPDATE `spells` SET `school_de` = 'Erkenntniszauber' WHERE `school` = 'divination';
UPDATE `spells` SET `school_de` = 'Verzauberung' WHERE `school` = 'enchantment';
UPDATE `spells` SET `school_de` = 'Illusion' WHERE `school` = 'illusion';
UPDATE `spells` SET `school_de` = 'Nekromantie' WHERE `school` = 'necromancy';
UPDATE `spells` SET `school_de` = 'Bannzauber' WHERE `school` = 'abjuration';

-- Update German casting times
UPDATE `spells` SET `casting_time_de` = '1 Aktion' WHERE `casting_time` = '1 action';
UPDATE `spells` SET `casting_time_de` = '1 Bonus-Aktion' WHERE `casting_time` = '1 bonus action';
UPDATE `spells` SET `casting_time_de` = '1 Reaktion' WHERE `casting_time` = '1 reaction';
UPDATE `spells` SET `casting_time_de` = '1 Minute' WHERE `casting_time` = '1 minute';
UPDATE `spells` SET `casting_time_de` = '10 Minuten' WHERE `casting_time` = '10 minutes';
UPDATE `spells` SET `casting_time_de` = '1 Stunde' WHERE `casting_time` = '1 hour';
UPDATE `spells` SET `casting_time_de` = '8 Stunden' WHERE `casting_time` = '8 hours';

-- Add basic German range translations
UPDATE `spells` SET `range_de` = 'Berührung' WHERE `range` = 'touch';
UPDATE `spells` SET `range_de` = 'Selbst' WHERE `range` = 'self';
UPDATE `spells` SET `range_de` = '9 m' WHERE `range` = '30 feet';
UPDATE `spells` SET `range_de` = '18 m' WHERE `range` = '60 feet';
UPDATE `spells` SET `range_de` = '27 m' WHERE `range` = '90 feet';
UPDATE `spells` SET `range_de` = '36 m' WHERE `range` = '120 feet';
UPDATE `spells` SET `range_de` = '90 m' WHERE `range` = '300 feet';
UPDATE `spells` SET `range_de` = '1,5 km' WHERE `range` = '1 mile';

-- Add basic German duration translations
UPDATE `spells` SET `duration_de` = 'Unmittelbar' WHERE `duration` = 'instantaneous';
UPDATE `spells` SET `duration_de` = '1 Runde' WHERE `duration` = '1 round';
UPDATE `spells` SET `duration_de` = 'Konzentration, bis zu 1 Minute' WHERE `duration` = 'concentration, up to 1 minute';
UPDATE `spells` SET `duration_de` = 'Konzentration, bis zu 10 Minuten' WHERE `duration` = 'concentration, up to 10 minutes';
UPDATE `spells` SET `duration_de` = 'Konzentration, bis zu 1 Stunde' WHERE `duration` = 'concentration, up to 1 hour';
UPDATE `spells` SET `duration_de` = '1 Minute' WHERE `duration` = '1 minute';
UPDATE `spells` SET `duration_de` = '10 Minuten' WHERE `duration` = '10 minutes';
UPDATE `spells` SET `duration_de` = '1 Stunde' WHERE `duration` = '1 hour';
UPDATE `spells` SET `duration_de` = '8 Stunden' WHERE `duration` = '8 hours';
UPDATE `spells` SET `duration_de` = '24 Stunden' WHERE `duration` = '24 hours';
UPDATE `spells` SET `duration_de` = 'Bis aufgehoben' WHERE `duration` = 'until dispelled';
