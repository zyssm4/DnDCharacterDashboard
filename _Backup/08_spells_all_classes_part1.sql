-- ========================================
-- ZAUBER FÜR ALLE KLASSEN - TEIL 1
-- Zaubertricks (Cantrips) + Level 1-3 Zauber
-- Mit deutschen Beschreibungen
-- ========================================

-- Zuerst die class_list Spalte für die Spells-Tabelle hinzufügen/aktualisieren
ALTER TABLE spells
ADD COLUMN IF NOT EXISTS school_en VARCHAR(50);
MODIFY COLUMN class_list JSON DEFAULT NULL;


-- ========================================
-- ZAUBERTRICKS (LEVEL 0)
-- ========================================

INSERT INTO spells (name_de, name_en, level, school_de, school_en, casting_time_de, casting_time_en, range_de, range_en, components, duration_de, duration_en, concentration, ritual, description_de, description_en, class_list) VALUES

-- Universal Cantrips
('Licht', 'Light', 0, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, M',
'1 Stunde', '1 hour', FALSE, FALSE,
'Du berührst ein Objekt (max. 3m), das helles Licht in 6m Radius und dämmriges Licht weitere 6m ausstrahlt. Das Licht hat eine Farbe deiner Wahl. Einen Gegenstand vollständig bedecken blockiert das Licht. Der Zauber endet, wenn du ihn erneut wirkst oder als Aktion beendest.',
'You touch one object that is no larger than 10 feet in any dimension. Until the spell ends, the object sheds bright light in a 20-foot radius and dim light for an additional 20 feet.',
'["Barde", "Kleriker", "Magier", "Hexenmeister"]'),

('Prestidigitation', 'Prestidigitation', 0, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', '3 m', '10 feet', 'V, S',
'Bis zu 1 Stunde', 'Up to 1 hour', FALSE, FALSE,
'Ein Zaubertrick für kleine magische Tricks: sinnliche Effekte erschaffen, Objekt reinigen/erwärmen/abkühlen/markieren, kleine Illusionen. Du kannst bis zu drei Effekte gleichzeitig aktiv haben.',
'This spell is a minor magical trick that novice spellcasters use for practice. You create one of several minor effects.',
'["Barde", "Hexenmeister", "Magier"]'),

('Magierhand', 'Mage Hand', 0, 'Beschwörung', 'Conjuration', '1 Aktion', '1 action', '9 m', '30 feet', 'V, S',
'1 Minute', '1 minute', FALSE, FALSE,
'Eine schwebende, geisterhafte Hand erscheint in Reichweite. Du kannst deine Aktion nutzen, um die Hand zu kontrollieren. Die Hand kann bis zu 5kg tragen, Objekte manipulieren, Türen/Container öffnen, aber nicht angreifen oder magische Gegenstände aktivieren.',
'A spectral, floating hand appears at a point you choose within range. The hand lasts for the duration or until you dismiss it. You can use your action to control the hand.',
'["Barde", "Hexenmeister", "Magier"]'),

-- Barden Cantrips
('Boshafter Spott', 'Vicious Mockery', 0, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '18 m', '60 feet', 'V',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du schleuderst beleidigenden Worten auf eine Kreatur in Reichweite. Ziel muss WEI-RW bestehen oder 1W4 psychischen Schaden erleiden und Nachteil auf den nächsten Angriffswurf vor Ende ihres nächsten Zuges. Schaden steigt: 2W4 (5. Lvl), 3W4 (11. Lvl), 4W4 (17. Lvl).',
'You unleash a string of insults laced with subtle enchantments at one creature you can see. The target must succeed on a Wisdom saving throw or take 1d4 psychic damage and have disadvantage on the next attack roll it makes before the end of its next turn.',
'["Barde"]'),

('Tanzende Lichter', 'Dancing Lights', 0, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Du erschaffst bis zu vier fackel-große Lichter in Reichweite, die wie Fackeln, Laternen oder Glühwürmchen aussehen. Jedes gibt dämmriges Licht in 3m Radius. Du kannst die Lichter als Bonusaktion bis zu 18m bewegen.',
'You create up to four torch-sized lights within range, making them appear as torches, lanterns, or glowing orbs that hover for the duration.',
'["Barde", "Magier", "Hexenmeister"]'),

-- Magier Cantrips
('Feuerbolzen', 'Fire Bolt', 0, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du schleuderst einen Feuerball auf eine Kreatur oder Objekt. Mache einen Fernkampf-Zauberangriff. Bei Treffer: 1W10 Feuerschaden. Entzündet brennbare, nicht getragene Objekte. Schaden steigt: 2W10 (5. Lvl), 3W10 (11. Lvl), 4W10 (17. Lvl).',
'You hurl a mote of fire at a creature or object. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. Damage increases at higher levels.',
'["Magier", "Hexenmeister"]'),

('Froststrahl', 'Ray of Frost', 0, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Ein eiskalter Strahl auf eine Kreatur. Fernkampf-Zauberangriff: 1W8 Kälteschaden bei Treffer, Geschwindigkeit -3m bis zu deinem nächsten Zug. Schaden steigt: 2W8 (5. Lvl), 3W8 (11. Lvl), 4W8 (17. Lvl).',
'A frigid beam of blue-white light streaks toward a creature. Make a ranged spell attack. On hit, target takes 1d8 cold damage and speed is reduced by 10 feet until the start of your next turn.',
'["Magier", "Hexenmeister"]'),

('Magiegeschoss', 'Magic Missile', 0, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Drei leuchtende Pfeile erscheinen. Jeder trifft automatisch eine Kreatur deiner Wahl in Reichweite: 1W4+1 Energieschaden pro Pfeil. Auf höheren Zauberstufen: +1 Pfeil pro Stufe über 1.',
'You create three glowing darts of magical force. Each dart hits a creature of your choice within range, dealing 1d4+1 force damage.',
'["Magier"]'),

('Schockgriff', 'Shocking Grasp', 0, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Nahkampf-Zauberangriff mit Blitzehand. Bei Treffer: 1W8 Blitzschaden, Ziel kann keine Reaktionen bis zu seinem nächsten Zug. Vorteil gegen Ziele in Metallrüstung. Schaden steigt mit Level.',
'Make a melee spell attack. On hit, target takes 1d8 lightning damage and can\'t take reactions until the start of its next turn. You have advantage if target is wearing metal armor.',
'["Magier", "Hexenmeister"]'),

-- Druiden Cantrips (bereits vorhanden, aber komplettieren)
('Dornenpeitsche', 'Thorn Whip', 0, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', '9 m', '30 feet', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Eine peitschenartige Ranke erschießt auf eine Kreatur. Nahkampf-Zauberangriff: 1W6 Stichschaden bei Treffer. Große oder kleinere Kreatur wird 3m zu dir gezogen. Schaden steigt mit Level.',
'You create a long, vine-like whip covered in thorns. Make a melee spell attack. On hit, target takes 1d6 piercing damage and if Large or smaller, you pull it 10 feet closer.',
'["Druide"]'),

('Formen von Wasser', 'Shape Water', 0, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', '9 m', '30 feet', 'S',
'Unmittelbar oder 1 Stunde', 'Instantaneous or 1 hour', FALSE, FALSE,
'Du wählst einen Bereich Wasser (1,5m-Würfel) in Reichweite und bewirkst einen Effekt: Wasser bewegen, Form ändern (1 Std), Farbe/Opazität ändern (1 Std), oder Einfrieren (1 Std). Du kannst bis zu zwei Effekte gleichzeitig aktiv haben.',
'You choose an area of water that you can see within range and that fits within a 5-foot cube. You manipulate it in one of the following ways: move, change shape, change color/opacity, or freeze it.',
'["Druide", "Hexenmeister", "Magier"]'),

-- Paladin / Kleriker Cantrips
('Heiliges Licht', 'Sacred Flame', 0, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Flammenartiges gleißendes Licht auf Kreatur in Sicht. Ziel macht GES-RW oder erleidet 1W8 gleißenden Schaden. Keine Deckung gewährt Bonus. Schaden steigt: 2W8 (5. Lvl), 3W8 (11. Lvl), 4W8 (17. Lvl).',
'Flame-like radiance descends on a creature you can see. Target must succeed on a Dexterity saving throw or take 1d8 radiant damage. Target gains no benefit from cover.',
'["Kleriker"]'),

-- Hexenmeister Cantrips
('Eldritch Blast', 'Eldritch Blast', 0, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Ein knisternder Strahl aus krackelnder Energie. Fernkampf-Zauberangriff: 1W10 Energieschaden. Auf 5. Lvl: 2 Strahlen, 11. Lvl: 3 Strahlen, 17. Lvl: 4 Strahlen. Jeder Strahl kann dasselbe oder unterschiedliche Ziele treffen.',
'A beam of crackling energy streaks toward a creature. Make a ranged spell attack. On hit, target takes 1d10 force damage. At higher levels, you create more beams.',
'["Hexenmeister"]'),

-- ========================================
-- LEVEL 1 ZAUBER
-- ========================================

('Magierpanzer', 'Mage Armor', 1, 'Bannzauber', 'Abjuration', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'8 Stunden', '8 hours', FALSE, FALSE,
'Du berührst eine willige Kreatur ohne Rüstung. Bis der Zauber endet, beträgt die RK des Ziels 13 + GES-Modifikator. Der Zauber endet, wenn das Ziel eine Rüstung anlegt oder du ihn als Aktion beendest.',
'You touch a willing creature who isn\'t wearing armor, and a protective magical force surrounds it. The target\'s base AC becomes 13 + its Dexterity modifier.',
'["Hexenmeister", "Magier"]'),

('Schild', 'Shield', 1, 'Bannzauber', 'Abjuration', '1 Reaktion', '1 reaction', 'Selbst', 'Self', 'V, S',
'1 Runde', '1 round', FALSE, FALSE,
'Als Reaktion, wenn du getroffen wirst oder Ziel eines Magiegeschosses bist, gewinnst du +5 RK bis zu deinem nächsten Zug, einschließlich gegen den auslösenden Angriff.',
'An invisible barrier of magical force appears and protects you. Until the start of your next turn, you have a +5 bonus to AC, including against the triggering attack.',
'["Magier", "Hexenmeister"]'),

('Feenfeuer', 'Faerie Fire', 1, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '18 m', '60 feet', 'V',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Objekte in einem 6m-Würfel in Reichweite werden von blauem, grünem oder violettem Licht umrissen. Kreaturen im Bereich machen GES-RW oder werden umrissen. Umrissene Kreaturen/Objekte gewähren Vorteil auf Angriffe gegen sie, und sie können nicht von Unsichtbarkeit profitieren.',
'Each object in a 20-foot cube within range is outlined in light. Creatures in the area must make a Dexterity saving throw. On a failed save, creatures and objects are outlined in light, granting advantage on attacks against them.',
'["Barde", "Druide"]'),

('Heilende Wunden', 'Cure Wounds', 1, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du berührst eine Kreatur und stellst 1W8 + Zauberwirken-Modifikator Trefferpunkte wieder her. Hat keinen Effekt auf Untote oder Konstrukte. Auf höheren Stufen: +1W8 pro Stufe über 1.',
'A creature you touch regains hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.',
'["Barde", "Druide", "Kleriker", "Paladin"]'),

('Donnerw elle', 'Thunderwave', 1, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', 'Selbst (4,5m Würfel)', 'Self (15-foot cube)', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Eine Welle donnernder Kraft schwebt von dir weg. Jede Kreatur in einem 4,5m-Würfel ausgehend von dir muss KON-RW machen oder 2W8 Schallschaden erleiden und 3m weggestoßen werden. Bei Erfolg halber Schaden, kein Wegstoßen. Höhere Stufen: +1W8 pro Stufe.',
'A wave of thunderous force sweeps out from you. Each creature in a 15-foot cube must make a Constitution saving throw or take 2d8 thunder damage and be pushed 10 feet away.',
'["Barde", "Druide", "Magier", "Hexenmeister"]'),

('Schlaf', 'Sleep', 1, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '27 m', '90 feet', 'V, S, M',
'1 Minute', '1 minute', FALSE, FALSE,
'Kreaturen in einem 6m-Radius fallen in magischen Schlaf. Würfle 5W8; so viele Trefferpunkte an Kreaturen werden beeinflusst, beginnend mit der niedrigsten TP-Kreatur. Untote und Kreaturen immun gegen Bezauberung sind nicht betroffen. Höhere Stufen: +2W8 pro Stufe.',
'Creatures within 20 feet of a point fall asleep. Roll 5d8; this is how many hit points of creatures this spell can affect, starting with the lowest current hit points.',
'["Barde", "Hexenmeister", "Magier"]'),

('Brennende Hände', 'Burning Hands', 1, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', 'Selbst (4,5m Kegel)', 'Self (15-foot cone)', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Flammen schießen aus deinen ausgestreckten Händen. Jede Kreatur im 4,5m-Kegel muss GES-RW machen oder 3W6 Feuerschaden erleiden (Erfolg: halber Schaden). Feuer entzündet brennbare Objekte im Bereich. Höhere Stufen: +1W6 pro Stufe.',
'A thin sheet of flames shoots forth from your outstretched fingertips. Each creature in a 15-foot cone must make a Dexterity saving throw or take 3d6 fire damage (half on success).',
'["Magier", "Hexenmeister"]'),

('Magisches Geschoss', 'Magic Missile', 1, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Drei leuchtende Pfeile magischer Energie. Jeder Pfeil trifft automatisch eine Kreatur deiner Wahl in Reichweite und verursacht 1W4+1 Energieschaden. Höhere Stufen: +1 Pfeil pro Stufe über 1.',
'You create three glowing darts. Each dart hits a creature of your choice that you can see within range and deals 1d4+1 force damage. The darts all strike simultaneously.',
'["Magier"]'),

('Person bezaubern', 'Charm Person', 1, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '9 m', '30 feet', 'V, S',
'1 Stunde', '1 hour', FALSE, FALSE,
'Du versuchst, einen Humanoiden in Sicht zu bezaubern. Er muss WEI-RW machen (Vorteil, wenn du oder Gefährten gegen ihn kämpfen) oder wird von dir bezaubert. Solange bezaubert, betrachtet er dich als freundlichen Bekannten. Der Zauber endet, wenn du oder Gefährten ihm Schaden zufügen. Höhere Stufen: +1 Ziel pro Stufe.',
'You attempt to charm a humanoid you can see. It must make a Wisdom saving throw or be charmed by you for the duration. It regards you as a friendly acquaintance.',
'["Barde", "Druide", "Hexenmeister", "Magier"]'),

('Sprung', 'Jump', 1, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'1 Minute', '1 minute', FALSE, FALSE,
'Du berührst eine Kreatur. Die Sprungdistanz der Kreatur wird für die Dauer verdreifacht.',
'You touch a creature. The creature\'s jump distance is tripled until the spell ends.',
'["Druide", "Magier", "Hexenmeister"]'),

('Verstehen', 'Comprehend Languages', 1, 'Erkenntnismagie', 'Divination', '1 Aktion', '1 action', 'Selbst', 'Self', 'V, S, M',
'1 Stunde', '1 hour', FALSE, TRUE,
'Für die Dauer verstehst du die wörtliche Bedeutung jeder gesprochenen Sprache, die du hörst. Du verstehst auch geschriebene Sprachen, musst aber die Schrift berühren. Etwa eine Seite pro Minute. Der Zauber entschlüsselt keine Geheimbotschaften oder Glyphen.',
'For the duration, you understand the literal meaning of any spoken language. You also understand any written language, but you must be touching the surface on which the words are written.',
'["Barde", "Hexenmeister", "Magier"]'),

('Mit Tieren sprechen', 'Speak with Animals', 1, 'Erkenntnismagie', 'Divination', '1 Aktion', '1 action', 'Selbst', 'Self', 'V, S',
'10 Minuten', '10 minutes', FALSE, TRUE,
'Du erhältst die Fähigkeit, Tiere zu verstehen und verbal mit ihnen zu kommunizieren. Das Wissen und Bewusstsein vieler Tiere ist durch ihre Intelligenz begrenzt, aber sie können Informationen über nahe gelegene Orte und Monster geben.',
'You gain the ability to comprehend and verbally communicate with beasts for the duration. The knowledge and awareness of many beasts is limited by their intelligence.',
'["Barde", "Druide"]');
