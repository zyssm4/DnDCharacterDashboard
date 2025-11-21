-- ========================================
-- PALADIN KLASSENFÄHIGKEITEN
-- Vollständige Features für Level 1-20
-- ========================================

INSERT INTO class_features (class, feature_name_de, feature_name_en, level_required, subclass, description_de, description_en, feature_type, uses_per_rest, recovery_type) VALUES

-- Level 1
('paladin', 'Göttliches Gespür', 'Divine Sense', 1, NULL,
'Als Aktion kannst du bis zum Ende deines nächsten Zuges die Lage jedes Himmelswesens, Untoten oder Feindes innerhalb von 18m spüren, das nicht hinter totaler Deckung ist. Du kannst diese Fähigkeit eine Anzahl Male gleich 1 + Charisma-Modifikator nutzen. Du erhältst alle Verwendungen nach einer langen Rast zurück.',
'As an action, you can detect the presence of celestials, fiends, or undead within 60 feet until the end of your next turn. You can use this feature a number of times equal to 1 + your Charisma modifier.',
'action', NULL, 'long_rest'),

('paladin', 'Handauflegen', 'Lay on Hands', 1, NULL,
'Du besitzt einen Vorrat an Heilkraft (Trefferpunkte = Paladinlevel × 5). Als Aktion kannst du eine Kreatur berühren und bis zu dieser Menge an Trefferpunkten wiederherstellen. Alternativ kannst du 5 Trefferpunkte ausgeben, um eine Krankheit oder ein Gift zu heilen. Der Vorrat regeneriert nach langer Rast.',
'You have a pool of healing power that replenishes when you take a long rest. With that pool, you can restore a total number of hit points equal to your paladin level × 5.',
'action', NULL, 'long_rest'),

-- Level 2
('paladin', 'Kampfstil', 'Fighting Style', 2, NULL,
'Wähle einen Kampfstil: Verteidigung (+1 RK mit Rüstung), Duellieren (+2 Schaden mit einhändigen Waffen), Großwaffenkampf (würfle Schadenswürfel von 1 oder 2 neu), oder Schutz (gib Verbündeten Nachteil gegen Angriffe als Reaktion).',
'You adopt a fighting style: Defense, Dueling, Great Weapon Fighting, or Protection.',
'passive', NULL, NULL),

('paladin', 'Zauberwirken', 'Spellcasting', 2, NULL,
'Du lernst, göttliche Magie durch Meditation und Gebet zu wirken. Du bereitest Zauber vor (Anzahl = CHA-Mod + halbe Paladinlevel, abgerundet, mindestens 1). Dein Zauberattribut ist Charisma. Zauber-SG = 8 + Übungsbonus + CHA-Mod. Ab Stufe 2 hast du 2 Zauberplätze der Stufe 1.',
'By 2nd level, you have learned to draw on divine magic through meditation and prayer. Your spellcasting ability is Charisma.',
'passive', NULL, NULL),

('paladin', 'Göttlicher Schlag', 'Divine Smite', 2, NULL,
'Wenn du eine Kreatur mit einer Nahkampfwaffe triffst, kannst du einen Zauberplatz ausgeben, um zusätzlichen gleißenden Schaden zu verursachen: 2W8 + 1W8 pro Stufe des Zauberplatzes (maximal 5W8). Gegen Untote oder Feindes zusätzliche +1W8.',
'When you hit a creature with a melee weapon attack, you can expend one spell slot to deal radiant damage to the target, in addition to the weapon\'s damage. The extra damage is 2d8 for a 1st-level spell slot, plus 1d8 for each spell level higher than 1st, to a maximum of 5d8.',
'special', NULL, NULL),

-- Level 3
('paladin', 'Heiliger Eid', 'Sacred Oath', 3, NULL,
'Du schwörst einen Eid, der dich für immer bindet. Bis zu diesem Zeitpunkt warst du in Vorbereitung. Wähle: Eid der Hingabe, Eid der Rache, Eid der Alten, oder Eid der Eroberung.',
'You swear an oath that binds you as a paladin forever. Choose: Oath of Devotion, Oath of Vengeance, Oath of the Ancients, or Oath of Conquest.',
'passive', NULL, NULL),

-- Eid der Hingabe
('paladin', 'Eid der Hingabe', 'Oath of Devotion', 3, 'devotion',
'Der Eid der Hingabe bindet einen Paladin an die erhabensten Ideale von Gerechtigkeit, Tugend und Ordnung.',
'The Oath of Devotion binds a paladin to the loftiest ideals of justice, virtue, and order.',
'passive', NULL, NULL),

('paladin', 'Eid-Zauber: Hingabe', 'Oath Spells: Devotion', 3, 'devotion',
'Du erhältst Eid-Zauber: Lvl 3: Schutz vor Gut und Böse, Schutzgebiet; Lvl 5: Geringere Wiederherstellung, Zone der Wahrheit; Lvl 9: Schutzkreis, Leuchtfeuer der Hoffnung; Lvl 13: Bewegungsfreiheit, Wächter des Glaubens; Lvl 17: Gemeinschaft, Flammenschlag.',
'You gain oath spells at paladin levels 3, 5, 9, 13, and 17.',
'passive', NULL, NULL),

('paladin', 'Kanalisierende Göttlichkeit: Hingabe', 'Channel Divinity: Devotion', 3, 'devotion',
'Du kannst deine Kanalisierende Göttlichkeit nutzen für: Heilige Waffe (1 Minute +CHA-Mod Schaden, helles Licht) oder Vertreibe Unheiliges (WEI-RW oder Feindes/Untote fliehen 1 Minute).',
'You can use your Channel Divinity to wield sacred weapon or turn the unholy.',
'action', 1, 'short_rest'),

-- Eid der Rache
('paladin', 'Eid der Rache', 'Oath of Vengeance', 3, 'vengeance',
'Der Eid der Rache ist ein feierliches Gelübde, das Böse zu bestrafen, koste es, was es wolle.',
'The Oath of Vengeance is a solemn commitment to punish those who have committed grievous sins.',
'passive', NULL, NULL),

('paladin', 'Eid-Zauber: Rache', 'Oath Spells: Vengeance', 3, 'vengeance',
'Du erhältst Eid-Zauber: Lvl 3: Verderben, Jägersmarkierung; Lvl 5: Nebel, Person festhalten; Lvl 9: Hast, Schutz vor Energie; Lvl 13: Verbannung, Dimensionstür; Lvl 17: Person festhalten (Masse), Scrying.',
'You gain oath spells at paladin levels 3, 5, 9, 13, and 17.',
'passive', NULL, NULL),

('paladin', 'Kanalisierende Göttlichkeit: Rache', 'Channel Divinity: Vengeance', 3, 'vengeance',
'Du kannst deine Kanalisierende Göttlichkeit nutzen für: Eid des Feindes (Bonusaktion, Vorteil gegen eine Kreatur) oder Strafender Ansturm (10m Bewegung als Reaktion auf Angriff).',
'You can use your Channel Divinity to avenge the fallen or intimidate foes.',
'action', 1, 'short_rest'),

-- Eid der Alten
('paladin', 'Eid der Alten', 'Oath of the Ancients', 3, 'ancients',
'Der Eid der Alten ist so alt wie das Feen-Volk und die Rituale der Druiden. Diese Paladine beschützen das Licht, die Schönheit und das Leben gegen die Macht der Finsternis.',
'The Oath of the Ancients is as old as the race of elves and the rituals of druids. These paladins protect the light and beauty of life.',
'passive', NULL, NULL),

('paladin', 'Eid-Zauber: Alten', 'Oath Spells: Ancients', 3, 'ancients',
'Du erhältst Eid-Zauber: Lvl 3: Mit Tieren sprechen, Verstrickung; Lvl 5: Mondstrahl, Nebelwolke; Lvl 9: Pflanzenwachstum, Schutz vor Energie; Lvl 13: Eiswand, Steinhaut; Lvl 17: Gemeinschaft, Baumlauf.',
'You gain oath spells at paladin levels 3, 5, 9, 13, and 17.',
'passive', NULL, NULL),

('paladin', 'Kanalisierende Göttlichkeit: Alten', 'Channel Divinity: Ancients', 3, 'ancients',
'Du kannst deine Kanalisierende Göttlichkeit nutzen für: Natur entfesseln (Wurzeln halten Gegner fest) oder Vertreibe Untreue (Feindes und Feenwesen fliehen).',
'You can use your Channel Divinity to invoke primeval forces or turn the faithless.',
'action', 1, 'short_rest'),

-- Level 4, 8, 12, 16, 19
('paladin', 'Attributswerterhöhung', 'Ability Score Improvement', 4, NULL,
'Du kannst zwei Attributswerte deiner Wahl um jeweils 1 erhöhen, oder einen Attributswert um 2. Alternativ kannst du ein Talent wählen.',
'You can increase one ability score by 2, or two ability scores by 1 each. Alternatively, you can take a feat.',
'passive', NULL, NULL),

-- Level 5
('paladin', 'Zusätzlicher Angriff', 'Extra Attack', 5, NULL,
'Du kannst zweimal angreifen, anstatt einmal, wenn du die Angriffsaktion in deinem Zug nutzt.',
'You can attack twice, instead of once, whenever you take the Attack action on your turn.',
'passive', NULL, NULL),

-- Level 6
('paladin', 'Aura des Schutzes', 'Aura of Protection', 6, NULL,
'Immer wenn du oder eine verbündete Kreatur innerhalb von 3m einen Rettungswurf macht, erhält die Kreatur einen Bonus auf den Wurf gleich deinem Charisma-Modifikator (mindestens +1). Du musst bei Bewusstsein sein. Auf Stufe 18 erhöht sich die Reichweite auf 9m.',
'Whenever you or a friendly creature within 10 feet must make a saving throw, the creature gains a bonus equal to your Charisma modifier. You must be conscious to grant this bonus. At 18th level, range increases to 30 feet.',
'passive', NULL, NULL),

-- Level 7 - Devotion
('paladin', 'Aura der Hingabe', 'Aura of Devotion', 7, 'devotion',
'Du und verbündete Kreaturen innerhalb von 3m können nicht bezaubert werden, solange du bei Bewusstsein bist. Auf Stufe 18 erhöht sich die Reichweite auf 9m.',
'You and friendly creatures within 10 feet can\'t be charmed while you are conscious. At 18th level, range increases to 30 feet.',
'passive', NULL, NULL),

-- Level 7 - Vengeance
('paladin', 'Unerbittlicher Rächer', 'Relentless Avenger', 7, 'vengeance',
'Wenn du eine Kreatur mit einem Gelegenheitsangriff triffst, kannst du dich als Teil derselben Reaktion bis zu halber Bewegungsrate direkt auf die Kreatur zubewegen.',
'When you hit a creature with an opportunity attack, you can move up to half your speed immediately after the attack as part of the same reaction.',
'passive', NULL, NULL),

-- Level 7 - Ancients
('paladin', 'Aura des Schutzes (Alten)', 'Aura of Warding', 7, 'ancients',
'Du und verbündete Kreaturen innerhalb von 3m haben Widerstand gegen Schaden von Zaubern. Auf Stufe 18 erhöht sich die Reichweite auf 9m.',
'You and friendly creatures within 10 feet have resistance to damage from spells. At 18th level, range increases to 30 feet.',
'passive', NULL, NULL),

-- Level 10
('paladin', 'Aura des Mutes', 'Aura of Courage', 10, NULL,
'Du und verbündete Kreaturen innerhalb von 3m können nicht verängstigt werden, solange du bei Bewusstsein bist. Auf Stufe 18 erhöht sich die Reichweite auf 9m.',
'You and friendly creatures within 10 feet can\'t be frightened while you are conscious. At 18th level, range increases to 30 feet.',
'passive', NULL, NULL),

-- Level 11
('paladin', 'Verbesserter Göttlicher Schlag', 'Improved Divine Smite', 11, NULL,
'Wann immer du eine Kreatur mit einer Nahkampfwaffe triffst, erleidet sie zusätzliche 1W8 gleißenden Schaden.',
'Whenever you hit a creature with a melee weapon, the creature takes an extra 1d8 radiant damage.',
'passive', NULL, NULL),

-- Level 14
('paladin', 'Reinigende Berührung', 'Cleansing Touch', 14, NULL,
'Du kannst deine Aktion nutzen, um einen Zauber auf dir oder einer willigen Kreatur zu beenden, die du berührst. Du kannst diese Fähigkeit eine Anzahl Male gleich deinem Charisma-Modifikator nutzen (mindestens 1x). Du erhältst alle Verwendungen nach langer Rast zurück.',
'You can use your action to end one spell on yourself or on one willing creature you touch. You can use this feature a number of times equal to your Charisma modifier.',
'action', NULL, 'long_rest'),

-- Level 15 - Devotion
('paladin', 'Reiner Geist', 'Purity of Spirit', 15, 'devotion',
'Du bist immer unter dem Effekt eines Schutz vor Gut und Böse Zaubers.',
'You are always under the effects of a protection from evil and good spell.',
'passive', NULL, NULL),

-- Level 15 - Vengeance
('paladin', 'Seelenjäger', 'Soul of Vengeance', 15, 'vengeance',
'Wenn eine Kreatur unter dem Effekt deines Eid des Feindes einen Angriff macht, kannst du als Reaktion einen Nahkampfangriff gegen diese Kreatur machen.',
'When a creature under the effect of your Abjure Enemy makes an attack, you can use your reaction to make a melee weapon attack against that creature.',
'reaction', NULL, NULL),

-- Level 15 - Ancients
('paladin', 'Unsterblicher Beschützer', 'Undying Sentinel', 15, 'ancients',
'Wenn du auf 0 Trefferpunkte fällst, aber nicht sofort stirbst, kannst du wählen, auf 1 TP zu fallen. Du kannst diese Fähigkeit einmal pro langer Rast nutzen. Außerdem erleidest du keine Nachteile durch Altern und kannst nicht magisch gealtert werden.',
'When you are reduced to 0 hit points and are not killed outright, you can choose to drop to 1 hit point instead. Once you use this feature, you can\'t use it again until you finish a long rest.',
'passive', 1, 'long_rest'),

-- Level 20 - Devotion
('paladin', 'Heiliger Nimbus', 'Holy Nimbus', 20, 'devotion',
'Als Aktion strahlst du für 1 Minute ein Himmels licht aus (9m Radius helles Licht, 9m dämmrig). Feindes und Untote am Beginn ihres Zuges in 9m erleiden 10 gleißenden Schaden. Du hast Vorteil auf Rettungswürfe gegen Feindes- und Untotenzauber. Einmal pro langer Rast.',
'As an action, you emanate sunlight for 1 minute. During that time, you shed bright light in a 30-foot radius. Whenever an enemy creature starts its turn in the bright light, it takes 10 radiant damage. You have advantage on saving throws against spells cast by fiends and undead.',
'action', 1, 'long_rest'),

-- Level 20 - Vengeance
('paladin', 'Rächerengel', 'Avenging Angel', 20, 'vengeance',
'Als Aktion verwandelst du dich für 1 Stunde: Flügel wachsen (18m Fluggeschwindigkeit), Aura der Bedrohung (Kreaturen in 9m haben Nachteil auf Angriffe gegen andere als dich). Einmal pro langer Rast.',
'As an action, you undergo a transformation for 1 hour. You sprout wings and gain a flying speed of 60 feet. Additionally, you emanate an aura of menace in a 30-foot radius.',
'action', 1, 'long_rest'),

-- Level 20 - Ancients
('paladin', 'Uralter Champion', 'Elder Champion', 20, 'ancients',
'Als Aktion transformierst du für 1 Minute: Am Beginn jedes deiner Züge regenerierst du 10 TP. Wenn du einen Paladinzauber mit Wirkzeit 1 Aktion wirkst, kannst du ihn als Bonusaktion wirken. Feindes und Untote in 3m haben Nachteil auf Rettungswürfe gegen deine Zauber und Kanalisierende Göttlichkeit. Einmal pro langer Rast.',
'As an action, you transform for 1 minute. At the start of each of your turns, you regain 10 hit points. Whenever you cast a paladin spell with a casting time of 1 action, you can cast it using a bonus action instead.',
'action', 1, 'long_rest');
