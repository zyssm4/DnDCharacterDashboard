-- ========================================
-- MAGIER (WIZARD) KLASSENFÄHIGKEITEN
-- Vollständige Features für Level 1-20
-- ========================================

INSERT INTO class_features (class, feature_name_de, feature_name_en, level_required, subclass, description_de, description_en, feature_type, uses_per_rest, recovery_type) VALUES

-- Level 1
('wizard', 'Zauberwirken', 'Spellcasting', 1, NULL,
'Als Magier nutzt du ein Zauberbuch, das deine Zauberformeln enthält. Auf Stufe 1 kennst du 3 Zaubertricks und hast 6 Zauber der Stufe 1 in deinem Zauberbuch. Dein Zauberattribut ist Intelligenz. Zauber-SG = 8 + Übungsbonus + Intelligenz-Modifikator. Du musst Zauber vorbereiten (Anzahl = INT-Mod + Magierstufe, mindestens 1).',
'As a wizard, you have a spellbook containing your spells. At 1st level, you know 3 cantrips and have 6 1st-level spells in your spellbook. Your spellcasting ability is Intelligence.',
'passive', NULL, NULL),

('wizard', 'Arkane Wiederherstellung', 'Arcane Recovery', 1, NULL,
'Einmal pro Tag während einer kurzen Rast kannst du einige deiner magischen Energien wiederherstellen. Wähle verbrauchte Zauberplätze, deren kombinierte Stufe maximal der Hälfte deiner Magierstufe entspricht (abgerundet), und mindestens Stufe 6. Du kannst keine Zauberplätze der Stufe 6 oder höher wiederherstellen.',
'Once per day when you finish a short rest, you can recover some expended spell slots. The spell slots can have a combined level equal to or less than half your wizard level (rounded up).',
'special', 1, 'long_rest'),

-- Level 2
('wizard', 'Arkane Tradition', 'Arcane Tradition', 2, NULL,
'Du wählst eine arkane Tradition, die deine magischen Studien formt: Hervorrufung, Bannzauber, Verzauberung, Illusion, Nekromantie, Verwandlung, Beschwörung oder Erkenntnismagie.',
'You choose an arcane tradition to shape your practice of magic.',
'passive', NULL, NULL),

-- Schule der Hervorrufung
('wizard', 'Schule der Hervorrufung', 'School of Evocation', 2, 'evocation',
'Du konzentrierst dein Studium auf Magie, die elementare Effekte wie bittere Kälte, sengende Flammen, rollenden Donner, knackende Blitze und brennende Säure erschafft.',
'You focus your study on magic that creates powerful elemental effects such as bitter cold, searing flame, rolling thunder, crackling lightning, and burning acid.',
'passive', NULL, NULL),

('wizard', 'Hervorrufungsgelehrter', 'Evocation Savant', 2, 'evocation',
'Gold und Zeit, die du benötigst, um einen Hervorrufungszauber in dein Zauberbuch zu kopieren, sind halbiert.',
'The gold and time you must spend to copy an evocation spell into your spellbook is halved.',
'passive', NULL, NULL),

('wizard', 'Zauber formen', 'Sculpt Spells', 2, 'evocation',
'Wenn du einen Hervorrufungszauber wirkst, kannst du eine Anzahl von Kreaturen gleich 1 + Zaubergrad wählen. Die gewählten Kreaturen bestehen automatisch ihren Rettungswurf und erleiden keinen Schaden, wenn sie normalerweise halben Schaden erleiden würden.',
'When you cast an evocation spell, you can choose a number of creatures equal to 1 + the spell\'s level. The chosen creatures automatically succeed on their saving throws against the spell.',
'passive', NULL, NULL),

-- Schule der Bannzauber
('wizard', 'Schule der Bannzauber', 'School of Abjuration', 2, 'abjuration',
'Die Schule der Bannzauber betont Magie, die Effekte blockiert, verbannt oder schützt. Bannmeister suchen Schutz für sich und andere.',
'The School of Abjuration emphasizes magic that blocks, banishes, or protects. Abjurers seek protection for themselves and others.',
'passive', NULL, NULL),

('wizard', 'Bannzaubergelehrter', 'Abjuration Savant', 2, 'abjuration',
'Gold und Zeit, die du benötigst, um einen Bannzauber in dein Zauberbuch zu kopieren, sind halbiert.',
'The gold and time you must spend to copy an abjuration spell into your spellbook is halved.',
'passive', NULL, NULL),

('wizard', 'Arkaner Schild', 'Arcane Ward', 2, 'abjuration',
'Wenn du einen Bannzauber der Stufe 1 oder höher wirkst, erschaffst du gleichzeitig eine magische Schutzsphäre. Der Schild hat Trefferpunkte gleich dem doppelten deiner Magierstufe + INT-Mod. Wenn du Schaden erleidest, absorbiert der Schild den Schaden zuerst. Der Schild regeneriert, wenn du Bannzauber wirkst.',
'When you cast an abjuration spell of 1st level or higher, you can create a magical ward. The ward has hit points equal to twice your wizard level + your Intelligence modifier.',
'passive', NULL, NULL),

-- Schule der Beschwörung
('wizard', 'Schule der Beschwörung', 'School of Conjuration', 2, 'conjuration',
'Als Beschwörer bevorzugst du Zauber, die Objekte und Kreaturen aus dem Nichts herbeizaubern.',
'As a conjurer, you favor spells that produce objects and creatures out of thin air.',
'passive', NULL, NULL),

('wizard', 'Beschwörungsgelehrter', 'Conjuration Savant', 2, 'conjuration',
'Gold und Zeit, die du benötigst, um einen Beschwörungszauber in dein Zauberbuch zu kopieren, sind halbiert.',
'The gold and time you must spend to copy a conjuration spell into your spellbook is halved.',
'passive', NULL, NULL),

('wizard', 'Kleinbeschwörung', 'Minor Conjuration', 2, 'conjuration',
'Als Aktion kannst du ein lebloses Objekt in deiner Hand oder am Boden in einem unbesetzten Bereich in 3m Reichweite beschwören. Das Objekt kann nicht größer als 90cm in jede Dimension und nicht mehr als 5kg wiegen. Es verschwindet nach 1 Stunde oder wenn es Schaden erleidet.',
'You can use your action to conjure an inanimate object in your hand or on the ground in an unoccupied space within 10 feet. The object disappears after 1 hour or if it takes damage.',
'action', 1, 'long_rest'),

-- Level 4, 8, 12, 16, 19
('wizard', 'Attributswerterhöhung', 'Ability Score Improvement', 4, NULL,
'Du kannst zwei Attributswerte deiner Wahl um jeweils 1 erhöhen, oder einen Attributswert um 2. Du kannst einen Wert nicht über 20 erhöhen. Alternativ kannst du ein Talent wählen.',
'You can increase one ability score by 2, or two ability scores by 1 each. Alternatively, you can take a feat.',
'passive', NULL, NULL),

-- Level 6 - Evocation
('wizard', 'Machtzauber', 'Potent Cantrip', 6, 'evocation',
'Deine schädigenden Zaubertricks beeinflussen sogar Kreaturen, die der vollen Kraft deiner Magie ausweichen. Wenn eine Kreatur bei einem Zaubertrick, der einen Rettungswurf erfordert, erfolgreich ist, erleidet sie halben Schaden, aber keine zusätzlichen Effekte.',
'Your damaging cantrips affect even creatures that avoid the brunt of the effect. When a creature succeeds on a saving throw against your cantrip, the creature takes half the cantrip\'s damage but suffers no additional effect.',
'passive', NULL, NULL),

-- Level 6 - Abjuration
('wizard', 'Projizierter Schild', 'Projected Ward', 6, 'abjuration,
'Als Reaktion kannst du, wenn eine Kreatur in 9m Reichweite Schaden erleidet, deinen Arkanen Schild nutzen, um den Schaden zu absorbieren. Wenn der Schild dadurch auf 0 TP reduziert wird, erleidet die geschützte Kreatur den restlichen Schaden.',
'When a creature within 30 feet takes damage, you can use your reaction to cause your Arcane Ward to absorb that damage.',
'reaction', NULL, NULL),

-- Level 6 - Conjuration
('wizard', 'Günstige Teleportation', 'Benign Transposition', 6, 'conjuration',
'Als Aktion kannst du mit einer willigen Kreatur in 9m Reichweite, die du sehen kannst, den Platz tauschen. Alternativ kannst du auf einen unbesetzten Bereich teleportieren. Du kannst diese Fähigkeit einmal nutzen und erhältst sie nach langer Rast oder nach dem Wirken eines Beschwörungszaubers der Stufe 1+ zurück.',
'You can use your action to teleport up to 30 feet to an unoccupied space you can see, or switch places with a willing creature.',
'action', 1, 'long_rest'),

-- Level 10 - Evocation
('wizard', 'Ermächtigter Hervorrufungszauber', 'Empowered Evocation', 10, 'evocation',
'Du kannst deinen Intelligenzmodifikator zu einem Schadenswurf eines Hervorrufungszaubers addieren, den du wirkst.',
'You can add your Intelligence modifier to one damage roll of any wizard evocation spell you cast.',
'passive', NULL, NULL),

-- Level 10 - Abjuration
('wizard', 'Verbesserter Bannzauber', 'Improved Abjuration', 10, 'abjuration',
'Wenn du einen Bannzauber wirkst, der einen Attributswurf erfordert, addierst du deinen Übungsbonus zu diesem Wurf.',
'When you cast an abjuration spell that requires an ability check as a part of casting that spell, you add your proficiency bonus to that ability check.',
'passive', NULL, NULL),

-- Level 10 - Conjuration
('wizard', 'Fokussierte Beschwörung', 'Focused Conjuration', 10, 'conjuration',
'Deine Konzentration auf Beschwörungszauber kann nicht durch Schaden gebrochen werden.',
'Your concentration on conjuration spells can\'t be broken as a result of taking damage.',
'passive', NULL, NULL),

-- Level 14 - Evocation
('wizard', 'Überlastung', 'Overchannel', 14, 'evocation',
'Wenn du einen Magierschaden-Zauber der Stufen 1-5 wirkst, kannst du maximalen Schaden verursachen. Das erste Mal erleidest du 2W12 nekrotischen Schaden. Jedes weitere Mal vor einer langen Rast steigt der Schaden um 1W12.',
'When you cast a wizard spell of 1st through 5th level that deals damage, you can deal maximum damage with that spell. The first time you do so, you suffer no adverse effect. Each time after, you take 2d12 necrotic damage per level of the spell.',
'special', 1, 'long_rest'),

-- Level 14 - Abjuration
('wizard', 'Widerstandsfähigkeit gegen Zauber', 'Spell Resistance', 14, 'abjuration',
'Du hast Vorteil auf Rettungswürfe gegen Zauber und Widerstand gegen Schaden von Zaubern.',
'You have advantage on saving throws against spells, and you have resistance to the damage of spells.',
'passive', NULL, NULL),

-- Level 14 - Conjuration
('wizard', 'Dauerhafte Beschwörung', 'Durable Summons', 14, 'conjuration',
'Jede Kreatur, die du mit einem Beschwörungszauber beschwörst, erhält 30 temporäre Trefferpunkte.',
'Any creature that you summon or create with a conjuration spell has 30 temporary hit points.',
'passive', NULL, NULL),

-- Level 18
('wizard', 'Zaubermeisterschaft', 'Spell Mastery', 18, NULL,
'Wähle einen Zauber der Stufe 1 und einen der Stufe 2 aus deinem Zauberbuch. Du kannst diese Zauber auf ihrer niedrigsten Stufe wirken, ohne einen Zauberplatz zu verbrauchen. Du kannst die Wahl nach 8 Stunden Studium ändern.',
'You have achieved such mastery over certain spells that you can cast them at will. Choose a 1st-level wizard spell and a 2nd-level wizard spell. You can cast those spells at their lowest level without expending a spell slot.',
'passive', NULL, NULL),

-- Level 20
('wizard', 'Signaturzauber', 'Signature Spells', 20, NULL,
'Wähle zwei Zauber der Stufe 3 aus deinem Zauberbuch als deine Signaturzauber. Du hast diese Zauber immer vorbereitet und kannst jeden einmal auf Stufe 3 wirken, ohne einen Zauberplatz zu verbrauchen. Du erhältst diese Verwendung nach kurzer oder langer Rast zurück.',
'Choose two 3rd-level wizard spells in your spellbook as your signature spells. You always have these spells prepared, and you can cast each once at 3rd level without expending a spell slot.',
'special', 2, 'short_rest');
