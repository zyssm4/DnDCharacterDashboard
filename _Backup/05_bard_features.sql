-- ========================================
-- BARDEN (BARD) KLASSENFÄHIGKEITEN
-- Vollständige Features für Level 1-20
-- ========================================

INSERT INTO class_features (class, feature_name_de, feature_name_en, level_required, subclass, description_de, description_en, feature_type, uses_per_rest, recovery_type) VALUES

-- Level 1
('bard', 'Zauberwirken', 'Spellcasting', 1, NULL,
'Du hast gelernt, Zauber zu wirken, indem du Musik, Poesie oder andere Kunstformen nutzt. Du kennst 4 Zaubertricks und 4 Zauber der Stufe 1. Dein Zauberattribut ist Charisma. Zauber-SG = 8 + Übungsbonus + Charisma-Modifikator.',
'You have learned to cast spells through music and performance. You know 4 cantrips and 4 1st-level spells. Your spellcasting ability is Charisma.',
'passive', NULL, NULL),

('bard', 'Bardeninspiration', 'Bardic Inspiration', 1, NULL,
'Du kannst als Bonusaktion eine Kreatur (außer dir) innerhalb von 18m inspirieren, die dich hören kann. Die Kreatur erhält einen Bardenwürfel (1W6), den sie innerhalb der nächsten 10 Minuten zu einem Attributswurf, Angriffswurf oder Rettungswurf addieren kann. Eine Kreatur kann nur einen Bardenwürfel gleichzeitig haben. Du kannst diese Fähigkeit eine Anzahl Male gleich deinem Charisma-Modifikator nutzen (mindestens 1x). Du erhältst alle verbrauchten Verwendungen nach einer langen Rast zurück. Würfel: Lvl 1-4: 1W6, Lvl 5-9: 1W8, Lvl 10-14: 1W10, Lvl 15+: 1W12.',
'You can inspire others through stirring words or music. As a bonus action, you grant one creature a Bardic Inspiration die (d6).',
'bonus_action', NULL, 'long_rest'),

-- Level 2
('bard', 'Tausendsassa', 'Jack of All Trades', 2, NULL,
'Du kannst die Hälfte deines Übungsbonus (abgerundet) zu jedem Attributswurf addieren, bei dem du nicht bereits deinen Übungsbonus nutzt.',
'You can add half your proficiency bonus, rounded down, to any ability check you make that doesn\'t already include your proficiency bonus.',
'passive', NULL, NULL),

('bard', 'Ausruhelied', 'Song of Rest', 2, NULL,
'Du kannst während einer kurzen Rast beruhigende Musik nutzen, um deinen verletzten Verbündeten zu helfen. Jeder verbündete Charakter, der Trefferwürfel während dieser Rast nutzt, erhält zusätzliche Trefferpunkte zurück: Lvl 2-8: 1W6, Lvl 9-12: 1W8, Lvl 13-16: 1W10, Lvl 17+: 1W12.',
'You can use soothing music or oration to help revitalize your wounded allies during a short rest.',
'special', NULL, NULL),

-- Level 3
('bard', 'Bardenkollegium', 'Bard College', 3, NULL,
'Du gräbst dich tiefer in die Fortgeschrittene Techniken deiner Kunst und wählst ein Bardenkollegium.',
'You delve into advanced techniques and choose a bard college.',
'passive', NULL, NULL),

('bard', 'Kollegium der Weisheit', 'College of Lore', 3, 'lore',
'Barden des Kollegiums der Weisheit wissen etwas über die meisten Dinge und sammeln Wissen aus Quellen von wissenschaftlichen Manuskripten bis zu Bauernmärchen.',
'Bards of the College of Lore know something about most things, collecting bits of knowledge from sources as diverse as scholarly tomes and peasant tales.',
'passive', NULL, NULL),

('bard', 'Bonusübungen: Weisheit', 'Bonus Proficiencies: Lore', 3, 'lore',
'Du erhältst Übung in drei beliebigen Fertigkeiten deiner Wahl.',
'You gain proficiency with three skills of your choice.',
'passive', NULL, NULL),

('bard', 'Schneidende Worte', 'Cutting Words', 3, 'lore',
'Als Reaktion kannst du einen Bardeninspiration-Würfel ausgeben, wenn eine Kreatur in 18m Reichweite, die du sehen kannst, einen Angriffswurf, Attributswurf oder Schadenswurf macht. Du ziehst die Zahl ab, die du würfelst, vom Wurf der Kreatur ab.',
'When a creature you can see within 60 feet makes an attack roll, ability check, or damage roll, you can use your reaction to expend a Bardic Inspiration die and subtract it from their roll.',
'reaction', NULL, NULL),

('bard', 'Kollegium der Schwerter', 'College of Swords', 3, 'swords',
'Barden des Kollegiums der Schwerter sind Künstler, die ihre Waffen als Instrumente ihrer Kunst nutzen, und verbinden Kampf mit Darbietung.',
'Bards of the College of Swords are called blades, and they entertain through daring feats of weapon prowess.',
'passive', NULL, NULL),

('bard', 'Bonusübungen: Schwerter', 'Bonus Proficiencies: Swords', 3, 'swords',
'Du erhältst Übung mit mittlerer Rüstung und dem Säbel. Wenn du eine einfache oder Kriegswaffe in einer Hand hältst und keine anderen Waffen, gilt diese als Bardenfokus.',
'You gain proficiency with medium armor and the scimitar. You can use a weapon as a spellcasting focus.',
'passive', NULL, NULL),

('bard', 'Kampfstil: Schwerter', 'Fighting Style: Swords', 3, 'swords',
'Wähle einen Kampfstil: Duellieren (+2 auf Schaden mit einhändigen Waffen) oder Zweiwaffenkampf (Bonusattacke mit zweiter Waffe erhält Attributsmodifikator).',
'You adopt a fighting style: Dueling or Two-Weapon Fighting.',
'passive', NULL, NULL),

('bard', 'Klingenflourish', 'Blade Flourish', 3, 'swords',
'Wenn du in deinem Zug die Angriffsaktion nutzt, kannst du einen Bardeninspiration-Würfel nutzen, um eine Klingenflourish-Option auszuführen: Defensiv (würfele und addiere zur RK), Schleudern (stoße Ziel weg), oder Mobil (bewege dich ohne Gelegenheitsangriffe).',
'When you take the Attack action on your turn, you can use a Bardic Inspiration die to perform a Blade Flourish.',
'special', NULL, NULL),

-- Level 4
('bard', 'Attributswerterhöhung', 'Ability Score Improvement', 4, NULL,
'Du kannst zwei Attributswerte deiner Wahl um jeweils 1 erhöhen, oder einen Attributswert um 2. Du kannst einen Wert nicht über 20 erhöhen. Alternativ kannst du ein Talent wählen.',
'You can increase one ability score by 2, or two ability scores by 1 each. You can\'t increase an ability score above 20. Alternatively, you can take a feat.',
'passive', NULL, NULL),

-- Level 5
('bard', 'Bardeninspiration (W8)', 'Bardic Inspiration (d8)', 5, NULL,
'Dein Bardeninspiration-Würfel wird zu einem W8.',
'Your Bardic Inspiration die becomes a d8.',
'passive', NULL, NULL),

('bard', 'Quelle der Inspiration', 'Font of Inspiration', 5, NULL,
'Du erhältst alle verbrauchten Verwendungen von Bardeninspiration nach einer kurzen oder langen Rast zurück.',
'You regain all expended uses of Bardic Inspiration when you finish a short or long rest.',
'passive', NULL, NULL),

-- Level 6 - Lore
('bard', 'Zusätzliche Zaubergeheimnisse', 'Additional Magical Secrets', 6, 'lore',
'Du lernst zwei Zauber deiner Wahl von einer beliebigen Klasse. Die Zauber müssen von einer Stufe sein, die du wirken kannst.',
'You learn two spells of your choice from any class. The spells must be of a level you can cast.',
'passive', NULL, NULL),

-- Level 6 - Swords
('bard', 'Zusätzlicher Angriff', 'Extra Attack', 6, 'swords',
'Du kannst zweimal angreifen, anstatt einmal, wenn du die Angriffsaktion in deinem Zug nutzt.',
'You can attack twice, instead of once, whenever you take the Attack action on your turn.',
'passive', NULL, NULL),

-- Level 10
('bard', 'Bardeninspiration (W10)', 'Bardic Inspiration (d10)', 10, NULL,
'Dein Bardeninspiration-Würfel wird zu einem W10.',
'Your Bardic Inspiration die becomes a d10.',
'passive', NULL, NULL),

('bard', 'Zaubergeheimnisse', 'Magical Secrets', 10, NULL,
'Du lernst zwei Zauber deiner Wahl von einer beliebigen Klasse. Die Zauber müssen von einer Stufe sein, die du wirken kannst. Weitere Zaubergeheimnisse auf Lvl 14 und 18.',
'You learn two spells of your choice from any class. The spells must be of a level you can cast.',
'passive', NULL, NULL),

('bard', 'Expertenwissen', 'Expertise', 10, NULL,
'Wähle zwei deiner Fertigkeiten. Dein Übungsbonus wird für diese Fertigkeiten verdoppelt.',
'Choose two of your skill proficiencies. Your proficiency bonus is doubled for any ability check you make using either of them.',
'passive', NULL, NULL),

-- Level 14
('bard', 'Bardeninspiration (W12)', 'Bardic Inspiration (d12)', 15, NULL,
'Dein Bardeninspiration-Würfel wird zu einem W12.',
'Your Bardic Inspiration die becomes a d12.',
'passive', NULL, NULL),

('bard', 'Zaubergeheimnisse (14)', 'Magical Secrets (14)', 14, NULL,
'Du lernst zwei weitere Zauber deiner Wahl von einer beliebigen Klasse.',
'You learn two more spells of your choice from any class.',
'passive', NULL, NULL),

-- Level 14 - Lore
('bard', 'Unvergleichliche Fertigkeit', 'Peerless Skill', 14, 'lore',
'Wenn du einen Attributswurf machst, kannst du einen Bardeninspiration-Würfel nutzen und ihn zum Wurf addieren.',
'When you make an ability check, you can expend one use of Bardic Inspiration and add the die to your check.',
'special', NULL, NULL),

-- Level 14 - Swords
('bard', 'Meisterflourier', 'Master\'s Flourish', 14, 'swords',
'Wenn du eine Klingenflourish-Option nutzt, kannst du einen W6 anstatt eines Bardeninspiration-Würfels nutzen.',
'When you use a Blade Flourish option, you can roll a d6 and use it instead of expending a Bardic Inspiration die.',
'passive', NULL, NULL),

-- Level 18
('bard', 'Zaubergeheimnisse (18)', 'Magical Secrets (18)', 18, NULL,
'Du lernst zwei weitere Zauber deiner Wahl von einer beliebigen Klasse.',
'You learn two more spells of your choice from any class.',
'passive', NULL, NULL),

-- Level 20
('bard', 'Überlegene Inspiration', 'Superior Inspiration', 20, NULL,
'Wenn du würfelst für Initiative und keine Verwendungen von Bardeninspiration mehr hast, erhältst du eine Verwendung zurück.',
'When you roll initiative and have no uses of Bardic Inspiration left, you regain one use.',
'passive', NULL, NULL);
