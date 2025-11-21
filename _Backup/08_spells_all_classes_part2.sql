-- ========================================
-- ZAUBER FÜR ALLE KLASSEN - TEIL 2
-- Level 2-5 Zauber mit deutschen Beschreibungen
-- ========================================

-- ========================================
-- LEVEL 2 ZAUBER
-- ========================================

INSERT INTO spells (name_de, name_en, level, school_de, school_en, casting_time_de, casting_time_en, range_de, range_en, components, duration_de, duration_en, concentration, ritual, description_de, description_en, class_list) VALUES

('Unsichtbarkeit', 'Invisibility', 2, 'Illusion', 'Illusion', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'Bis zu 1 Stunde (Konzentration)', 'Up to 1 hour (concentration)', TRUE, FALSE,
'Eine Kreatur, die du berührst, wird unsichtbar, bis der Zauber endet. Alles, was das Ziel trägt oder bei sich hat, ist ebenfalls unsichtbar, solange es am Ziel ist. Der Zauber endet für das Ziel, wenn es angreift oder einen Zauber wirkt. Höhere Stufen: +1 Ziel pro Stufe über 2.',
'A creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target. The spell ends if the target attacks or casts a spell.',
'["Barde", "Hexenmeister", "Magier"]'),

('Person festhalten', 'Hold Person', 2, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Wähle einen Humanoiden in Sicht. Ziel muss WEI-RW machen oder wird gelähmt. Am Ende jedes seiner Züge darf es erneut würfeln. Der Zauber endet bei Erfolg. Höhere Stufen: +1 Ziel pro Stufe über 2.',
'Choose a humanoid you can see. The target must succeed on a Wisdom saving throw or be paralyzed for the duration. At the end of each of its turns, the target can make another saving throw.',
'["Barde", "Druide", "Hexenmeister", "Magier", "Kleriker"]'),

('Spiegelbilder', 'Mirror Image', 2, 'Illusion', 'Illusion', '1 Aktion', '1 action', 'Selbst', 'Self', 'V, S',
'1 Minute', '1 minute', FALSE, FALSE,
'Drei illusionäre Duplikate von dir erscheinen in deinem Bereich. Wenn dich etwas angreift, würfle W20: Bei 6+, trifft der Angriff ein Duplikat statt dich. Ein Duplikat hat RK 10 + GES-Mod. Bei Treffer verschwindet es. Duplikate verschwinden, wenn du den Zauber erneut wirkst.',
'Three illusory duplicates of yourself appear in your space. When a creature attacks you, roll a d20 to determine if the attack targets you or one of the duplicates. A duplicate is destroyed when hit.',
'["Hexenmeister", "Magier"]'),

('Sengender Strahl', 'Scorching Ray', 2, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du erschaffst drei Strahlen aus Feuer und schleuderst sie auf Ziele in Reichweite. Mache einen Fernkampf-Zauberangriff für jeden Strahl. Bei Treffer: 2W6 Feuerschaden. Höhere Stufen: +1 Strahl pro Stufe über 2.',
'You create three rays of fire and hurl them at targets within range. Make a ranged spell attack for each ray. On a hit, the target takes 2d6 fire damage.',
'["Magier", "Hexenmeister"]'),

('Zerschmettern', 'Shatter', 2, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Ein plötzlich lauter, schmerzvoller Ton in einem 3m-Radius. Kreaturen im Bereich machen KON-RW oder erleiden 3W8 Schallschaden (Erfolg: halber Schaden). Kreaturen aus anorganischem Material (Stein, Kristall, Metall) haben Nachteil. Nicht-magische Objekte im Bereich erleiden ebenfalls Schaden. Höhere Stufen: +1W8 pro Stufe.',
'A sudden loud ringing noise erupts from a point of your choice. Each creature in a 10-foot-radius sphere must make a Constitution saving throw or take 3d8 thunder damage (half on success).',
'["Barde", "Hexenmeister", "Magier"]'),

('Levitation', 'Levitate', 2, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S, M',
'Bis zu 10 Minuten (Konzentration)', 'Up to 10 minutes (concentration)', TRUE, FALSE,
'Eine Kreatur oder loser Gegenstand deiner Wahl, den du sehen kannst, steigt vertikal bis zu 6m auf und schwebt für die Dauer. Kreaturen können KON-RW machen, um zu widerstehen. Du kannst das Ziel in deinem Zug als Aktion bis zu 6m nach oben oder unten bewegen.',
'One creature or loose object of your choice rises vertically up to 20 feet and remains suspended there for the duration. You can move the target up or down as an action.',
'["Hexenmeister", "Magier"]'),

('Stille', 'Silence', 2, 'Illusion', 'Illusion', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S',
'Bis zu 10 Minuten (Konzentration)', 'Up to 10 minutes (concentration)', TRUE, TRUE,
'Für die Dauer kann kein Geräusch in oder durch eine 6m-Radius-Sphäre erzeugt werden oder hindurchdringen. Kreaturen und Objekte darin sind immun gegen Schallschaden. Verbales Zauberwirken ist unmöglich.',
'For the duration, no sound can be created within or pass through a 20-foot-radius sphere centered on a point you choose. Creatures and objects entirely inside the sphere are immune to thunder damage.',
'["Barde", "Kleriker"]'),

('Suggestion', 'Suggestion', 2, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '9 m', '30 feet', 'V, M',
'Bis zu 8 Stunden (Konzentration)', 'Up to 8 hours (concentration)', TRUE, FALSE,
'Du schlägst einen Handlungsablauf (ein bis zwei Sätze) vor und magisch beeinflusst eine Kreatur in Sicht, die dich verstehen kann. Kreaturen immun gegen Bezauberung sind immun. Der Vorschlag muss vernünftig klingen. Ziel macht WEI-RW oder folgt dem Vorschlag.',
'You suggest a course of activity (limited to a sentence or two) and magically influence a creature you can see that can hear and understand you. The suggestion must be worded in such a manner as to make the course of action sound reasonable.',
'["Barde", "Hexenmeister", "Magier"]'),

('Tier finden', 'Find Steed', 2, 'Beschwörung', 'Conjuration', '10 Minuten', '10 minutes', '9 m', '30 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du beschwörst einen Geist, der die Form eines intelligenten, starken und loyalen Reittiers annimmt (Pferd, Pony, Kamel, Elch oder Mastiff). Es hat die Statistiken der gewählten Form, aber ist himmlisch, feenhaft oder höllisch. Du kannst telepathisch mit ihm kommunizieren, solange ihr auf derselben Ebene seid.',
'You summon a spirit that assumes the form of an intelligent, strong, and loyal steed, creating a long-lasting bond with it. It has the statistics of the chosen form but is a celestial, fey, or fiend.',
'["Paladin"]'),

('Segnung', 'Bless', 2, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '9 m', '30 feet', 'V, S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Du segnest bis zu drei Kreaturen deiner Wahl in Reichweite. Wann immer ein Ziel einen Angriffswurf oder Rettungswurf macht, kann es 1W4 würfeln und das Ergebnis zum Wurf addieren. Höhere Stufen: +1 Ziel pro Stufe über 1.',
'You bless up to three creatures of your choice. Whenever a target makes an attack roll or saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw.',
'["Kleriker", "Paladin"]'),

('Geringere Wiederherstellung', 'Lesser Restoration', 2, 'Bannzauber', 'Abjuration', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du berührst eine Kreatur und beendest eine Krankheit oder einen Zustand: blind, taub, gelähmt oder vergiftet.',
'You touch a creature and can end either one disease or one condition afflicting it. The condition can be blinded, deafened, paralyzed, or poisoned.',
'["Barde", "Druide", "Kleriker", "Paladin"]'),

('Spirituelle Waffe', 'Spiritual Weapon', 2, 'Hervorrufung', 'Evocation', '1 Bonusaktion', '1 bonus action', '18 m', '60 feet', 'V, S',
'1 Minute', '1 minute', FALSE, FALSE,
'Du erschaffst eine schwebende, geisterhafte Waffe in Reichweite für die Dauer. Wenn du den Zauber wirkst, mache einen Nahkampf-Zauberangriff gegen eine Kreatur in 1,5m der Waffe. Bei Treffer: Ziel erleidet Energieschaden gleich 1W8 + Zauberwirken-Mod. Als Bonusaktion kannst du die Waffe bis zu 6m bewegen und den Angriff wiederholen. Höhere Stufen: +1W8 pro 2 Stufen.',
'You create a floating, spectral weapon within range for the duration. When you cast the spell, you can make a melee spell attack against a creature within 5 feet of the weapon. On a hit, the target takes force damage equal to 1d8 + your spellcasting ability modifier.',
'["Kleriker"]'),

-- ========================================
-- LEVEL 3 ZAUBER
-- ========================================

('Feuerball', 'Fireball', 3, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '45 m', '150 feet', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Ein heller Streifen schießt aus deinem Finger zu einem Punkt in Reichweite und explodiert in einem 6m-Radius-Feuerball. Jede Kreatur im Bereich muss GES-RW machen oder 8W6 Feuerschaden erleiden (Erfolg: halber Schaden). Feuer breitet sich um Ecken und entzündet Objekte. Höhere Stufen: +1W6 pro Stufe über 3.',
'A bright streak flashes from your pointing finger to a point you choose within range and blossoms into a roar of flame. Each creature in a 20-foot radius sphere must make a Dexterity saving throw or take 8d6 fire damage (half on success).',
'["Magier", "Hexenmeister"]'),

('Hast', 'Haste', 3, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', '9 m', '30 feet', 'V, S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Wähle eine willige Kreatur in Sicht. Bis der Zauber endet: Geschwindigkeit verdoppelt, +2 RK, Vorteil auf GES-Rettungswürfe, zusätzliche Aktion in jedem Zug (nur für Angriff [eine Waffe], Spurt, Rückzug, Verstecken oder Gegenstand benutzen). Wenn der Zauber endet, kann das Ziel sich bis zu seinem nächsten Zug nicht bewegen oder Aktionen ausführen.',
'Choose a willing creature. Until the spell ends, the target\'s speed is doubled, it gains a +2 bonus to AC, has advantage on Dexterity saving throws, and gains an additional action on each of its turns. When the spell ends, the target can\'t move or take actions until after its next turn.',
'["Magier", "Hexenmeister"]'),

('Blitz', 'Lightning Bolt', 3, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', 'Selbst (30m Linie)', 'Self (100-foot line)', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Ein Blitz schießt in einer 30m langen, 1,5m breiten Linie von dir weg. Jede Kreatur in der Linie muss GES-RW machen oder 8W6 Blitzschaden erleiden (Erfolg: halber Schaden). Blitz entzündet brennbare Objekte. Höhere Stufen: +1W6 pro Stufe über 3.',
'A stroke of lightning forming a line 100 feet long and 5 feet wide blasts out from you. Each creature in the line must make a Dexterity saving throw or take 8d6 lightning damage (half on success).',
'["Magier", "Hexenmeister"]'),

('Fliegen', 'Fly', 3, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'Bis zu 10 Minuten (Konzentration)', 'Up to 10 minutes (concentration)', TRUE, FALSE,
'Du berührst eine willige Kreatur. Das Ziel erhält eine Fluggeschwindigkeit von 18m für die Dauer. Wenn das Ziel in der Luft ist, wenn der Zauber endet, fällt die Kreatur, es sei denn, sie kann den Sturz verhindern. Höhere Stufen: +1 Ziel pro Stufe über 3.',
'You touch a willing creature. The target gains a flying speed of 60 feet for the duration. When the spell ends, the target falls if it is still aloft, unless it can stop the fall.',
'["Hexenmeister", "Magier"]'),

('Gegenbannen', 'Counterspell', 3, 'Bannzauber', 'Abjuration', '1 Reaktion', '1 reaction', '18 m', '60 feet', 'S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Als Reaktion auf eine Kreatur in 18m, die einen Zauber wirkt, unterbrichst du den Zauber. Wenn die Kreatur einen Zauber der Stufe 3 oder niedriger wirkt, schlägt er fehl. Bei Stufe 4+, mache einen Attributswurf mit deinem Zauberattribut (SG = 10 + Zauberstufe). Bei Erfolg schlägt der Zauber fehl. Höhere Stufen: Automatisch bei Zauber-Stufe gleich der Slot-Stufe.',
'You attempt to interrupt a creature casting a spell. If the creature is casting a spell of 3rd level or lower, its spell fails. If it is casting a spell of 4th level or higher, make an ability check using your spellcasting ability. The DC equals 10 + the spell\'s level.',
'["Hexenmeister", "Magier"]'),

('Hypnotisches Muster', 'Hypnotic Pattern', 3, 'Illusion', 'Illusion', '1 Aktion', '1 action', '36 m', '120 feet', 'S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Ein wirbelndes Muster aus verwobenen Farben erscheint in einem 9m-Würfel in Reichweite. Kreaturen im Bereich, die das Muster sehen, machen WEI-RW oder werden bezaubert. Solange bezaubert, ist die Kreatur kampfunfähig und hat Geschwindigkeit 0. Der Zauber endet, wenn die Kreatur Schaden erleidet oder jemand eine Aktion nutzt, um sie zu schütteln.',
'You create a twisting pattern of colors in a 30-foot cube. Each creature in the area who sees the pattern must make a Wisdom saving throw or become charmed for the duration. While charmed, the creature is incapacitated and has a speed of 0.',
'["Barde", "Hexenmeister", "Magier"]'),

('Pflanzenwachstum', 'Plant Growth', 3, 'Verwandlung', 'Transmutation', '1 Aktion oder 8 Stunden', '1 action or 8 hours', '45 m', '150 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Dieser Zauber kanalisiert Vitalität in Pflanzen. Als Aktion: Pflanzen in 30m Radius werden überwuchert. Kreaturen brauchen 4 Fuß Bewegung für jeden Fuß Bewegung durch den Bereich. Als 8-Stunden-Ritual: Ernten in 800m Radius verdoppeln sich für 1 Jahr.',
'This spell channels vitality into plants. The spell has two possible uses. If you cast it using 1 action, all normal plants in a 100-foot radius become thick and overgrown. If you cast it over 8 hours, you enrich the land, and all plants yield double their normal yield for 1 year.',
'["Barde", "Druide"]'),

('Schutzkreis', 'Protection from Energy', 3, 'Bannzauber', 'Abjuration', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S',
'Bis zu 1 Stunde (Konzentration)', 'Up to 1 hour (concentration)', TRUE, FALSE,
'Für die Dauer hat die willige Kreatur, die du berührst, Widerstand gegen einen Schadenstyp deiner Wahl: Säure, Kälte, Feuer, Blitz oder Schall.',
'For the duration, the willing creature you touch has resistance to one damage type of your choice: acid, cold, fire, lightning, or thunder.',
'["Druide", "Kleriker", "Magier", "Paladin"]'),

('Wiederbelebung der Toten', 'Revivify', 3, 'Nekromantie', 'Necromancy', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du berührst eine Kreatur, die innerhalb der letzten Minute gestorben ist. Die Kreatur kehrt mit 1 Trefferpunkt zum Leben zurück. Dieser Zauber kann keine Kreaturen wiederbeleben, die an Altersschwäche gestorben sind, noch kann er fehlende Körperteile wiederherstellen. Material: Diamanten im Wert von mindestens 300 GM, die der Zauber verbraucht.',
'You touch a creature that has died within the last minute. That creature returns to life with 1 hit point. This spell can\'t return to life a creature that has died of old age, nor can it restore any missing body parts.',
'["Kleriker", "Paladin"]'),

('Geisterhafte Reittiere beschwören', 'Phantom Steed', 3, 'Illusion', 'Illusion', '1 Minute', '1 minute', '9 m', '30 feet', 'V, S',
'1 Stunde', '1 hour', FALSE, TRUE,
'Ein Large, quasi-echtes pferdeartiges Wesen erscheint am Boden in Reichweite. Du entscheidest über das Aussehen. Es hat Statistiken eines Reitpferdes, außer Geschwindigkeit 30m und kann 16 km/Std für max. 1 Stunde reisen (danach normale Geschwindigkeit). Der Zauber endet, wenn das Reittier Schaden erleidet.',
'A Large quasi-real, horselike creature appears on the ground in an unoccupied space of your choice. You decide the creature\'s appearance. It has the statistics of a riding horse, except it has a speed of 100 feet and can travel 10 miles per hour for up to 1 hour.',
'["Magier"]'),

('Sengende Kugel', 'Fireball', 3, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '45 m', '150 feet', 'V, S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Du erschaffst eine 1,5m große Flammenkugel, die in Reichweite schwebt. Sie hält für die Dauer. Wenn du den Zauber wirkst und als Aktion in deinen nachfolgenden Zügen, kannst du die Kugel bis zu 9m bewegen. Kreaturen in 1,5m am Ende der Bewegung machen GES-RW oder 2W6 Feuerschaden. Die Kugel entzündet Objekte. Höhere Stufen: +1W6 pro Stufe.',
'You create a 5-foot-diameter sphere of fire in an unoccupied space within range. The sphere remains for the duration. When you move the sphere, each creature in a 5-foot radius must make a Dexterity saving throw or take 2d6 fire damage.',
'["Druide", "Magier"]');
