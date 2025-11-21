-- SQL Script to translate spell components to German
-- Übersetzt alle Komponenten-Angaben von V, S, M zu vollständigen deutschen Bezeichnungen

-- V = Verbal → Verbal (ausgesprochen)
-- S = Somatic → Gesten (körperliche Bewegungen)
-- M = Material → Material (physische Gegenstände)

-- Alle möglichen Kombinationen übersetzen:

-- V, S, M (alle drei)
UPDATE `spells`
SET `components` = 'Verbal, Gesten, Material'
WHERE `components` = 'V, S, M' OR `components` = 'VSM' OR `components` = 'V,S,M' OR `components` = 'V, G, M';

-- V, S (nur Verbal und Gestisch)
UPDATE `spells`
SET `components` = 'Verbal, Gesten'
WHERE `components` = 'V, S' OR `components` = 'VS' OR `components` = 'V,S' OR `components` = 'V, G';

-- V, M (nur Verbal und Material)
UPDATE `spells`
SET `components` = 'Verbal, Material'
WHERE `components` = 'V, M' OR `components` = 'VM' OR `components` = 'V,M';

-- S, M (nur Gestisch und Material)
UPDATE `spells`
SET `components` = 'Gesten, Material'
WHERE `components` = 'S, M' OR `components` = 'SM' OR `components` = 'S,M' OR `components` = 'G, M';

-- Nur V (nur Verbal)
UPDATE `spells`
SET `components` = 'Verbal'
WHERE `components` = 'V' AND LENGTH(`components`) = 1;

-- Nur S (nur Gestisch)
UPDATE `spells`
SET `components` = 'Gesten'
WHERE (`components` = 'S' OR `components` = 'G') AND LENGTH(`components`) = 1;

-- Nur M (nur Material)
UPDATE `spells`
SET `components` = 'Material'
WHERE `components` = 'M' AND LENGTH(`components`) = 1;

-- Spezielle Fälle mit Materialbeschreibungen
-- Wenn Material-Komponenten spezifiziert sind, Format: "Verbal, Gesten, Material (Beschreibung)"
UPDATE `spells`
SET `components` = REPLACE(`components`, 'V, S, M (', 'Verbal, Gesten, Material (')
WHERE `components` LIKE 'V, S, M (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'V, G, M (', 'Verbal, Gesten, Material (')
WHERE `components` LIKE 'V, G, M (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'S, M (', 'Gesten, Material (')
WHERE `components` LIKE 'S, M (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'G, M (', 'Gesten, Material (')
WHERE `components` LIKE 'G, M (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'V, S (', 'Verbal, Gesten (')
WHERE `components` LIKE 'V, S (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'V, G (', 'Verbal, Gesten (')
WHERE `components` LIKE 'V, G (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'V, M (', 'Verbal, Material (')
WHERE `components` LIKE 'V, M (%';

-- Für Fälle ohne Kommas
UPDATE `spells`
SET `components` = REPLACE(`components`, 'VSM (', 'Verbal, Gesten, Material (')
WHERE `components` LIKE 'VSM (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'VS (', 'Verbal, Gesten (')
WHERE `components` LIKE 'VS (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'SM (', 'Gesten, Material (')
WHERE `components` LIKE 'SM (%';

UPDATE `spells`
SET `components` = REPLACE(`components`, 'VM (', 'Verbal, Material (')
WHERE `components` LIKE 'VM (%';

-- Alternative Schreibweisen (Kleinbuchstaben)
UPDATE `spells`
SET `components` = 'Verbal, Gesten, Material'
WHERE `components` IN ('v, s, m', 'v,s,m', 'vsm', 'V S M');

UPDATE `spells`
SET `components` = 'Verbal, Gesten'
WHERE `components` IN ('v, s', 'v,s', 'vs', 'v s', 'V S');

UPDATE `spells`
SET `components` = 'Gesten, Material'
WHERE `components` IN ('s, m', 's,m', 'sm', 's m', 'S M', 'g, m', 'g,m', 'gm');

UPDATE `spells`
SET `components` = 'Verbal, Material'
WHERE `components` IN ('v, m', 'v,m', 'vm', 'v m', 'V M');

UPDATE `spells`
SET `components` = 'Gesten'
WHERE `components` IN ('s', 'S', 'g', 'G');

UPDATE `spells`
SET `components` = 'Verbal'
WHERE `components` IN ('v');

-- Verification: Zeige alle Komponenten nach der Aktualisierung
-- SELECT DISTINCT components FROM spells ORDER BY components;
