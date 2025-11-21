-- ========================================
-- SCHURKEN (ROGUE) KLASSENFÄHIGKEITEN
-- Vollständige Features für Level 1-20
-- ========================================

-- Schurken Features einfügen
INSERT INTO class_features (class, feature_name_de, feature_name_en, level_required, subclass, description_de, description_en, feature_type, uses_per_rest, recovery_type) VALUES

-- Level 1
('rogue', 'Expertise', 'Expertise', 1, NULL,
'Wähle zwei deiner Fertigkeiten, in denen du Übung hast, oder eine Fertigkeit und Diebeswerkzeuge. Dein Übungsbonus wird für alle Würfe mit den gewählten Fertigkeiten verdoppelt. Auf Stufe 6 kannst du zwei weitere Fertigkeiten wählen.',
'Choose two of your skill proficiencies, or one skill and thieves\' tools. Your proficiency bonus is doubled for any ability check you make using either of the chosen proficiencies.',
'passive', NULL, NULL),

('rogue', 'Hinterhältiger Angriff', 'Sneak Attack', 1, NULL,
'Du weißt, wie du präzise zuschlägst und die Ablenkung eines Feindes ausnutzt. Einmal pro Zug kannst du einem Angriff zusätzlichen Schaden zufügen, wenn du Vorteil auf den Angriffswurf hast (1d6). Du brauchst keinen Vorteil, wenn sich ein anderer Feind des Ziels innerhalb von 1,5m befindet, dieser Feind nicht kampfunfähig ist und du keinen Nachteil hast. Schaden steigt mit Level: Lvl 1: 1d6, Lvl 3: 2d6, Lvl 5: 3d6, Lvl 7: 4d6, Lvl 9: 5d6, Lvl 11: 6d6, Lvl 13: 7d6, Lvl 15: 8d6, Lvl 17: 9d6, Lvl 19: 10d6.',
'Once per turn, you can deal an extra damage to one creature you hit with an attack if you have advantage on the attack roll.',
'passive', NULL, NULL),

('rogue', 'Ganovensprache', 'Thieves\' Cant', 1, NULL,
'Du kennst die Ganovensprache, eine geheime Mischung aus Dialekt, Jargon und verschlüsselten Nachrichten, die es dir erlaubt, versteckte Botschaften in scheinbar normalen Gesprächen zu verbergen. Nur andere Kreaturen, die Ganovensprache kennen, verstehen solche Nachrichten. Es dauert viermal so lange, eine Nachricht in Ganovensprache zu vermitteln, wie es dauern würde, dieselbe Idee klar auszusprechen.',
'You know thieves\' cant, a secret mix of dialect, jargon, and code that allows you to hide messages in seemingly normal conversation.',
'passive', NULL, NULL),

-- Level 2
('rogue', 'Gewitzte Aktion', 'Cunning Action', 2, NULL,
'Dein schnelles Denken und deine Beweglichkeit erlauben es dir, dich schneller zu bewegen. Du kannst in jedem deiner Züge im Kampf eine Bonusaktion nutzen, um die Aktion Spurt, Rückzug oder Verstecken auszuführen.',
'Your quick thinking and agility allow you to move and act quickly. You can take a bonus action on each of your turns to take the Dash, Disengage, or Hide action.',
'bonus_action', NULL, NULL),

-- Level 3 - Archetypen
('rogue', 'Freibeuter (Archetyp)', 'Swashbuckler (Archetype)', 3, 'swashbuckler',
'Du konzentrierst dein Training auf die Kunst des Klingenfechtens. Ein Freibeuter zeichnet sich durch Dreistigkeit aus und kann mehrere Gegner gleichzeitig in Duellen bekämpfen.',
'You focus your training on the art of blade fighting. A swashbuckler excels in single combat.',
'passive', NULL, NULL),

('rogue', 'Eleganter Manöver', 'Fancy Footwork', 3, 'swashbuckler',
'Wenn du in deinem Zug einen Nahkampfangriff gegen eine Kreatur ausführst, provoziert diese Kreatur bis zum Ende deines Zuges keine Gelegenheitsangriffe von dir.',
'When you make a melee attack against a creature, that creature can\'t make opportunity attacks against you for the rest of your turn.',
'passive', NULL, NULL),

('rogue', 'Draufgängerische Initiative', 'Rakish Audacity', 3, 'swashbuckler',
'Du addierst deinen Charisma-Modifikator zu deinen Initiativwürfen. Außerdem kannst du Hinterhältigen Angriff gegen ein Ziel nutzen, wenn du innerhalb von 1,5m keine anderen Kreaturen als dein Ziel hast und du keinen Nachteil auf den Angriffswurf hast.',
'You add your Charisma modifier to your initiative rolls. You can also use Sneak Attack if no creature other than your target is within 5 feet of you.',
'passive', NULL, NULL),

-- Assassine (Alternative)
('rogue', 'Assassine (Archetyp)', 'Assassin (Archetype)', 3, 'assassin',
'Du konzentrierst dein Training auf die düstere Kunst des Tötens. Diejenigen, die an diesem Archetyp festhalten, sind Spione, Auftragskiller und alle, die im Töten spezialisiert sind.',
'You focus your training on the grim art of death. Those who adhere to this archetype are diverse: hired killers, spies, bounty hunters.',
'passive', NULL, NULL),

('rogue', 'Bonusübungen: Assassine', 'Bonus Proficiencies: Assassin', 3, 'assassin',
'Du erhältst Übung mit dem Verkleidungsset und dem Giftmischersets.',
'You gain proficiency with the disguise kit and the poisoner\'s kit.',
'passive', NULL, NULL),

('rogue', 'Attentäter', 'Assassinate', 3, 'assassin',
'Du hast Vorteil auf Angriffswürfe gegen jede Kreatur, die in diesem Kampf noch nicht an der Reihe war. Zusätzlich ist jeder Treffer, den du gegen eine überraschte Kreatur landest, ein kritischer Treffer.',
'You have advantage on attack rolls against any creature that hasn\'t taken a turn yet. Any hit you score against a surprised creature is a critical hit.',
'passive', NULL, NULL),

-- Dieb (Alternative)
('rogue', 'Dieb (Archetyp)', 'Thief (Archetype)', 3, 'thief',
'Du verfeinerst deine Fähigkeiten in den diebesischen Künsten. Einbrecher, Banditen, Taschendiebe und andere Kriminelle folgen typischerweise diesem Archetyp.',
'You hone your skills in larceny. Burglars, bandits, cutpurses, and other criminals follow this archetype.',
'passive', NULL, NULL),

('rogue', 'Flinke Hände', 'Fast Hands', 3, 'thief',
'Du kannst die Bonusaktion von Gewitzte Aktion nutzen, um einen Geschicklichkeitswurf (Fingerfertigkeit) zu machen, Diebeswerkzeuge zu benutzen, um Fallen zu entschärfen oder Schlösser zu knacken, oder die Aktion Gegenstand benutzen auszuführen.',
'You can use the bonus action granted by Cunning Action to make a Dexterity (Sleight of Hand) check, use thieves\' tools, or take the Use an Object action.',
'bonus_action', NULL, NULL),

('rogue', 'Fassadenkletterer', 'Second-Story Work', 3, 'thief',
'Klettern kostet dich keine zusätzliche Bewegung. Zusätzlich erhöht sich deine Sprungdistanz um eine Anzahl von Metern gleich deinem Geschicklichkeitsmodifikator, wenn du einen Anlauf nimmst.',
'Climbing no longer costs you extra movement. When you make a running jump, the distance you cover increases by a number of feet equal to your Dexterity modifier.',
'passive', NULL, NULL),

-- Level 5
('rogue', 'Ausweichen', 'Uncanny Dodge', 5, NULL,
'Wenn ein Angreifer, den du sehen kannst, dich mit einem Angriff trifft, kannst du deine Reaktion nutzen, um den Schaden dieses Angriffs gegen dich zu halbieren.',
'When an attacker you can see hits you with an attack, you can use your reaction to halve the attack\'s damage against you.',
'reaction', NULL, NULL),

-- Level 6
('rogue', 'Expertise (Stufe 6)', 'Expertise (Level 6)', 6, NULL,
'Wähle zwei weitere deiner Fertigkeiten, in denen du Übung hast. Dein Übungsbonus wird für alle Würfe mit den gewählten Fertigkeiten verdoppelt.',
'Choose two more of your skill proficiencies. Your proficiency bonus is doubled for any ability check you make using either of the chosen proficiencies.',
'passive', NULL, NULL),

-- Level 7
('rogue', 'Entrinnen', 'Evasion', 7, NULL,
'Du kannst flinken Gefahren wie einem Blitzschlag oder einem Feuerball geschickt ausweichen. Wenn du einem Effekt ausgesetzt bist, der dir erlaubt, einen Geschicklichkeits-Rettungswurf zu machen, um nur halben Schaden zu erleiden, erleidest du stattdessen gar keinen Schaden bei Erfolg und nur halben Schaden bei Misserfolg.',
'You can nimbly dodge out of the way of certain area effects. When you are subjected to an effect that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed.',
'passive', NULL, NULL),

-- Level 9 - Swashbuckler
('rogue', 'Panache', 'Panache', 9, 'swashbuckler',
'Du kannst eine Aktion nutzen, um einen Charisma-Wurf (Überzeugen) gegen den Weisheits-Rettungswurf einer Kreatur zu machen. Bei Erfolg ist die Kreatur für 1 Minute von dir bezaubert oder verängstigt (deine Wahl). Die Kreatur hat Nachteil auf Angriffswürfe gegen andere Ziele als dich und kann keine Gelegenheitsangriffe gegen andere als dich machen.',
'You can make a Charisma (Persuasion) check contested by a creature\'s Wisdom saving throw. On success, the creature is charmed or frightened by you for 1 minute.',
'action', NULL, NULL),

-- Level 11
('rogue', 'Verlässliches Talent', 'Reliable Talent', 11, NULL,
'Wenn du einen Attributswurf machst, der eine Fertigkeit oder ein Werkzeug nutzt, in dem du Übung hast, wird ein Wurf von 9 oder niedriger auf dem W20 als 10 behandelt.',
'Whenever you make an ability check that lets you add your proficiency bonus, you can treat a d20 roll of 9 or lower as a 10.',
'passive', NULL, NULL),

-- Level 13 - Swashbuckler
('rogue', 'Eleganter Manöver (Verbessert)', 'Elegant Maneuver', 13, 'swashbuckler',
'Du kannst eine Bonusaktion nutzen, um Vorteil auf den nächsten Akrobatik- oder Athletikwurf zu erhalten, den du im selben Zug machst.',
'You can use a bonus action to gain advantage on the next Acrobatics or Athletics check you make during the same turn.',
'bonus_action', NULL, NULL),

-- Level 14
('rogue', 'Blindgespür', 'Blindsense', 14, NULL,
'Du bist dir der Lage jeder verborgenen oder unsichtbaren Kreatur innerhalb von 3m bewusst, wenn du hören kannst.',
'If you are able to hear, you are aware of the location of any hidden or invisible creature within 10 feet of you.',
'passive', NULL, NULL),

-- Level 15
('rogue', 'Fließender Verstand', 'Slippery Mind', 15, NULL,
'Du erhältst Übung in Weisheits-Rettungswürfen.',
'You gain proficiency in Wisdom saving throws.',
'passive', NULL, NULL),

-- Level 17 - Swashbuckler
('rogue', 'Meisterduellant', 'Master Duelist', 17, 'swashbuckler',
'Wenn du einen Angriffswurf verfehlst, kannst du den Wurf mit Vorteil wiederholen. Du kannst diese Fähigkeit einmal pro kurzer oder langer Rast nutzen.',
'If you miss with an attack roll, you can roll it again with advantage. Once you use this ability, you can\'t use it again until you finish a short or long rest.',
'special', 1, 'short_rest'),

-- Level 18
('rogue', 'Unfassbar', 'Elusive', 18, NULL,
'Kein Angriff hat Vorteil gegen dich, solange du nicht kampfunfähig bist.',
'No attack roll has advantage against you while you aren\'t incapacitated.',
'passive', NULL, NULL),

-- Level 20
('rogue', 'Schlagglück', 'Stroke of Luck', 20, NULL,
'Wenn dein Angriff ein Ziel verfehlt, das sich in Reichweite befindet, kannst du den Fehlschlag in einen Treffer verwandeln. Oder wenn du einen Attributswurf verfehlst, kannst du den W20-Wurf als 20 behandeln. Du kannst diese Fähigkeit einmal pro kurzer oder langer Rast nutzen.',
'If your attack misses a target within range, you can turn the miss into a hit. Alternatively, if you fail an ability check, you can treat the d20 roll as a 20.',
'special', 1, 'short_rest');
