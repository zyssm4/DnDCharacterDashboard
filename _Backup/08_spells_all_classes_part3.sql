-- ========================================
-- ZAUBER FÜR ALLE KLASSEN - TEIL 3
-- Level 4-9 Zauber mit deutschen Beschreibungen
-- ========================================

-- ========================================
-- LEVEL 4 ZAUBER
-- ========================================

INSERT INTO spells (name_de, name_en, level, school_de, school_en, casting_time_de, casting_time_en, range_de, range_en, components, duration_de, duration_en, concentration, ritual, description_de, description_en, class_list) VALUES

('Polymorph', 'Polymorph', 4, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S, M',
'Bis zu 1 Stunde (Konzentration)', 'Up to 1 hour (concentration)', TRUE, FALSE,
'Verwandle eine Kreatur in Sicht in eine neue Form (Tier). Unwillige Kreatur macht WEI-RW. Gestaltenwandler haben Vorteil. Ziel übernimmt Spielwerte des neuen Tieres (außer Gesinnung und Persönlichkeit). Ziel erhält die TP der neuen Form. Wenn diese auf 0 fallen, verwandelt sich die Kreatur zurück mit ihren vorherigen TP. Der Zauber endet vorzeitig, wenn die Kreatur stirbt.',
'This spell transforms a creature into a new form. An unwilling creature must make a Wisdom saving throw to avoid the effect. The target\'s game statistics are replaced by the statistics of the chosen beast.',
'["Barde", "Druide", "Hexenmeister", "Magier"]'),

('Verbannung', 'Banishment', 4, 'Bannzauber', 'Abjuration', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Du versuchst, eine Kreatur in Sicht auf eine andere Daseinsebene zu schicken. Ziel macht CHA-RW. Bei Misserfolg wird die Kreatur verbannt. Wenn das Ziel von dieser Ebene stammt, wird es in einen harmlosen Halbr aum verbannt. Ist das Ziel fremd, wird es auf seine Heimatebene verbannt. Wenn Konzentration 1 volle Minute gehalten wird, bleibt das Ziel dort. Höhere Stufen: +1 Ziel pro Stufe.',
'You attempt to send one creature that you can see within range to another plane of existence. The target must succeed on a Charisma saving throw or be banished.',
'["Kleriker", "Hexenmeister', "Magier", "Paladin"]'),

('Eiswand', 'Wall of Fire', 4, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Du erschaffst eine Feuerwand auf einer festen Oberfläche in Reichweite. Die Wand kann bis zu 18m lang, 6m hoch und 30cm dick sein, oder eine ringed Form mit 6m Durchmesser, 6m hoch und 30cm dick. Kreaturen in oder hinter der Wand (gewählte Seite) nehmen 5W8 Feuerschaden (GES-RW halber Schaden). Kreaturen, die in die Wand eintreten oder dort ihren Zug beenden: 5W8 Feuerschaden. Höhere Stufen: +1W8 pro Stufe.',
'You create a wall of fire on a solid surface within range. The wall is opaque and lasts for the duration. When the wall appears, each creature within its area must make a Dexterity saving throw or take 5d8 fire damage (half on success).',
'["Druide", "Magier"]'),

('Dimensionstür', 'Dimension Door', 4, 'Beschwörung', 'Conjuration', '1 Aktion', '1 action', '150 m', '500 feet', 'V',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du teleportierst dich von deiner aktuellen Position an einen Ort in Reichweite. Du kommst genau an dem Ort an, den du visualisierst. Du kannst Objekte mitbringen, solange ihr Gewicht deine Traglast nicht überschreitet. Du kannst auch eine willige Kreatur deiner Größe oder kleiner mitbringen. Wenn der Zielort besetzt ist, erleiden du und mitgebrachte Kreaturen 4W6 Energieschaden und der Zauber schlägt fehl.',
'You teleport yourself from your current location to any other spot within range. You arrive at exactly the spot desired. You can bring along objects and one willing creature.',
'["Hexenmeister", "Magier"]'),

('Großes Unsichtbarkeit', 'Greater Invisibility', 4, 'Illusion', 'Illusion', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Du oder eine Kreatur, die du berührst, wird unsichtbar bis der Zauber endet. Alles, was das Ziel trägt, wird ebenfalls unsichtbar. Im Gegensatz zu normaler Unsichtbarkeit endet dieser Zauber nicht, wenn das Ziel angreift oder Zauber wirkt.',
'You or a creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target. Unlike regular invisibility, this spell doesn\'t end when the target attacks or casts a spell.',
'["Barde", "Hexenmeister", "Magier"]'),

('Steinhaut', 'Stoneskin', 4, 'Bannzauber', 'Abjuration', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'Bis zu 1 Stunde (Konzentration)', 'Up to 1 hour (concentration)', TRUE, FALSE,
'Die Haut der Kreatur, die du berührst, wird hart wie Stein. Bis der Zauber endet, hat das Ziel Widerstand gegen nicht-magischen Hieb-, Stich- und Wuchtschaden. Material: Diamantstaub im Wert von 100 GM, den der Zauber verbraucht.',
'This spell turns the flesh of a willing creature you touch as hard as stone. Until the spell ends, the target has resistance to nonmagical bludgeoning, piercing, and slashing damage.',
'["Druide", "Magier"]'),

('Bewegungsfreiheit', 'Freedom of Movement', 4, 'Bannzauber', 'Abjuration', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'1 Stunde', '1 hour', FALSE, FALSE,
'Du berührst eine willige Kreatur. Für die Dauer wird die Bewegung des Ziels nicht durch schwieriges Gelände eingeschränkt, und Zauber und andere magische Effekte können weder die Geschwindigkeit des Ziels reduzieren noch das Ziel gelähmt oder festgehalten machen. Das Ziel kann 1,5m Bewegung ausgeben, um aus nicht-magischen Fesseln zu entkommen.',
'You touch a willing creature. For the duration, the target\'s movement is unaffected by difficult terrain, and spells and other magical effects can neither reduce the target\'s speed nor cause it to be paralyzed or restrained.',
'["Barde", "Druide", "Kleriker"]'),

('Verwirren', 'Confusion', 4, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '27 m', '90 feet', 'V, S, M',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Kreaturen in einem 3m-Radius müssen WEI-RW machen oder sind verwirrt. Betroffene Kreatur kann keine Reaktionen nutzen und würfelt zu Beginn jedes Zuges W10: 1: bewegt sich zufällig, 2-6: tut nichts, 7-8: Nahkampfangriff auf zufällige Kreatur, 9-10: normal. Am Ende jedes Zuges RW wiederholen.',
'This spell assaults and twists creatures\' minds. Each creature in a 10-foot-radius sphere must make a Wisdom saving throw or be confused. An affected target can\'t take reactions and must roll a d10 at the start of each of its turns to determine behavior.',
'["Barde", "Druide", "Hexenmeister", "Magier"]'),

-- ========================================
-- LEVEL 5 ZAUBER
-- ========================================

('Kegel der Kälte', 'Cone of Cold', 5, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', 'Selbst (18m Kegel)', 'Self (60-foot cone)', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Eine Explosion eisiger Luft bricht aus deinen Händen hervor. Jede Kreatur im 18m-Kegel muss KON-RW machen oder 8W8 Kälteschaden erleiden (Erfolg: halber Schaden). Getötete Kreaturen werden zu gefrorenen Statuen. Höhere Stufen: +1W8 pro Stufe über 5.',
'A blast of cold air erupts from your hands. Each creature in a 60-foot cone must make a Constitution saving throw or take 8d8 cold damage (half on success). A creature killed by this spell becomes a frozen statue.',
'["Magier", "Hexenmeister"]'),

('Flammenschlag', 'Flame Strike', 5, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Eine vertikale Säule göttlichen Feuers schießt von oben herab. Jede Kreatur in einem 3m-Radius, 12m hohen Zylinder muss GES-RW machen oder 4W6 Feuerschaden und 4W6 gleißenden Schaden erleiden (Erfolg: halber Schaden). Höhere Stufen: +1W6 Feuer oder gleißend pro Stufe über 5.',
'A vertical column of divine fire roars down from the heavens. Each creature in a 10-foot-radius, 40-foot-high cylinder must make a Dexterity saving throw or take 4d6 fire damage and 4d6 radiant damage (half on success).',
'["Kleriker"]'),

('Person beherrschen', 'Dominate Person', 5, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S',
'Bis zu 1 Minute (Konzentration)', 'Up to 1 minute (concentration)', TRUE, FALSE,
'Du versuchst, einen Humanoiden in Sicht zu bezaubern. Er muss WEI-RW machen oder wird von dir bezaubert. Wenn du oder deine Gefährten gegen ihn kämpfen, hat er Vorteil. Während bezaubert, habt ihr eine telepathische Verbindung. Du kannst diese nutzen, um der Kreatur Befehle zu erteilen (keine Aktion), denen sie nach besten Kräften folgt. Am Ende jedes Zuges des Ziels kann es WEI-RW wiederholen. Höhere Stufen: Dauer steigt (6: 10 Min, 7: 1 Std, 8: 8 Std, 9: 24 Std).',
'You attempt to beguile a humanoid you can see. It must succeed on a Wisdom saving throw or be charmed for the duration. While charmed, you have a telepathic link with it and can issue commands that it does its best to obey.',
'["Barde", "Hexenmeister", "Magier"]'),

('Teleportationskreis', 'Teleportation Circle', 5, 'Beschwörung', 'Conjuration', '1 Minute', '1 minute', '3 m', '10 feet', 'V, M',
'1 Runde', '1 round', FALSE, FALSE,
'Du erschaffst einen 3m Durchmesser-Kreis auf dem Boden. Der Kreis enthält eine Sigelsequenz, die zu einem permanenten Teleportationskreis gehört. Kreaturen, die in den Kreis treten, werden sofort zu dem Zielkreis teleportiert. Wenn du diesen Zauber jeden Tag für 1 Jahr am selben Ort wirkst, wird der Kreis permanent. Material: seltene Kreide und Tinte mit Edelsteinen im Wert von 50 GM, die der Zauber verbraucht.',
'You create a 10-foot-diameter circle on the ground inscribed with sigils that link your location to a permanent teleportation circle of your choice. A shimmering portal opens and creatures that enter the circle are instantly teleported.',
'["Barde", "Hexenmeister", "Magier"]'),

('Toter erwecken', 'Raise Dead', 5, 'Nekromantie', 'Necromancy', '1 Stunde', '1 hour', 'Berührung', 'Touch', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du kehrst eine tote Kreatur ins Leben zurück, die nicht länger als 10 Tage tot war. Die Seele der Kreatur muss frei und willig sein. Die Kreatur kehrt mit 1 TP zurück. Dieser Zauber neutralisiert Gifte und heilt normale Krankheiten, aber nicht magische Krankheiten oder Flüche. Der Zauber schließt tödliche Wunden, stellt aber fehlende Körperteile nicht wieder her. Das Zurückkehren wirft der Kreatur einen Malus auf (-4 auf Würfe, mindert sich bei langer Rast um 1). Material: Diamant im Wert von 500 GM, den der Zauber verbraucht.',
'You return a dead creature to life, provided it has been dead no longer than 10 days. The creature returns to life with 1 hit point. This spell neutralizes poisons and cures normal diseases, but doesn\'t remove magical diseases or curses.',
'["Barde", "Kleriker", "Paladin"]'),

('Mauer aus Stein', 'Wall of Stone', 5, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '36 m', '120 feet', 'V, S, M',
'Bis zu 10 Minuten (Konzentration)', 'Up to 10 minutes (concentration)', TRUE, FALSE,
'Eine nicht-magische Steinmauer erscheint an einer Stelle deiner Wahl. Die Wand ist 15cm dick und besteht aus zehn 3m × 3m Paneelen. Jedes Paneel muss an mindestens ein anderes angrenzen. Wenn die Wand Konzentration übersteht, wird sie permanent. Jedes Paneel hat RK 15 und 30 TP pro 2,5cm Dicke.',
'A nonmagical wall of solid stone springs into existence at a point you choose. The wall is 6 inches thick and is composed of ten 10-foot-by-10-foot panels. If the wall cuts through a creature\'s space, the creature is pushed to one side. If the wall remains when you lose concentration, it becomes permanent.',
'["Druide", "Magier"]'),

('Traumahandlung', 'Dream', 5, 'Illusion', 'Illusion', '1 Minute', '1 minute', 'Spezial', 'Special', 'V, S, M',
'8 Stunden', '8 hours', FALSE, FALSE,
'Du oder eine willige Kreatur, die du berührst, tritt in einen Trancezustand ein und sendet eine Botschaft in den Traum einer anderen Kreatur, die du kennst. Du kannst die Kreatur als Boten formen oder als Albtraum erscheinen. Wenn Albtraum, kann das Ziel keinen Nutzen von der Rast haben und erleidet 3W6 psychischen Schaden beim Erwachen. Wenn das Ziel wach ist, weiß der Bote und kann entweder die Trance beenden oder weiterwarten.',
'You, or a willing creature you touch, enters a trance state and sends a message into the dreams of another creature you know. You can shape yourself as a messenger or a nightmare. If a nightmare, the target gains no benefit from its rest and takes 3d6 psychic damage when it wakes up.',
'["Barde", "Hexenmeister", "Magier"]'),

('Wahrnehmung', 'Scrying', 5, 'Erkenntnismagie', 'Divination', '10 Minuten', '10 minutes', 'Selbst', 'Self', 'V, S, M',
'Bis zu 10 Minuten (Konzentration)', 'Up to 10 minutes (concentration)', TRUE, FALSE,
'Du kannst eine Kreatur sehen und hören, die du wählst und die sich auf derselben Daseinsebene befindet. Das Ziel macht WEI-RW, mit Modifikatoren basierend auf deinem Wissen: +5 (Hörensagen), 0 (aus zweiter Hand), -5 (aus erster Hand), -10 (Besitz/Körperteil). Bei Erfolg wird das Ziel immun für 24 Std. Bei Misserfolg erscheint ein unsichtbarer Sensor 3m vom Ziel entfernt. Material: ein Fokus im Wert von mindestens 1.000 GM (Kristallkugel, silberner Spiegel, etc.).',
'You can see and hear a particular creature you choose that is on the same plane of existence as you. The target must make a Wisdom saving throw modified by how well you know the target. On a successful save, the target is immune for 24 hours. On a failed save, the spell creates an invisible sensor within 10 feet of the target.',
'["Barde", "Druide", "Hexenmeister", "Magier", "Kleriker"]'),

-- ========================================
-- LEVEL 6 ZAUBER
-- ========================================

('Kettenblitz', 'Chain Lightning', 6, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '45 m', '150 feet', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du erschaffst einen Blitzschlag, der auf ein Ziel deiner Wahl springt. Mache einen Fernkampf-Zauberangriff auf das Ziel. Bei Treffer erleidet es 10W8 Blitzschaden. Dann springt der Blitz zu bis zu drei weiteren Zielen (jedes 9m vom vorherigen entfernt, kein Ziel zweimal). Jedes zusätzliche Ziel ist Ziel desselben Angriffs. Höhere Stufen: +1 Blitz pro Stufe über 6.',
'You create a bolt of lightning that arcs toward a target. Make a ranged spell attack against that target. On a hit, the target takes 10d8 lightning damage. The lightning then leaps to up to three other targets within 30 feet of the original target, dealing the same damage.',
'["Magier", "Hexenmeister"]'),

('Desintegration', 'Disintegrate', 6, 'Verwandlung', 'Transmutation', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Ein grüner Strahl schießt aus deinem Finger. Wähle eine Kreatur, ein Objekt oder eine magische Krafterscheinung (z.B. Kraftwand) in Reichweite. Eine Kreatur muss GES-RW machen oder 10W6+40 Energieschaden erleiden. Fällt die Kreatur dadurch auf 0 TP, wird sie desintegriert (zu feinem grauen Staub). Nur Wunsch kann sie wiederbeleben. Ein Objekt wird automatisch desintegriert, wenn es Large oder kleiner ist und nicht gehalten/getragen wird. Höhere Stufen: +3W6 pro Stufe.',
'A thin green ray springs from your pointing finger to a target. The target takes 10d6 + 40 force damage. If reduced to 0 hit points by this spell, the target is disintegrated into a pile of fine gray dust. A disintegrated creature can be restored to life only by a true resurrection or wish spell.',
'["Magier", "Hexenmeister"]'),

('Massen-Suggestion', 'Mass Suggestion', 6, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '18 m', '60 feet', 'V, M',
'24 Stunden', '24 hours', FALSE, FALSE,
'Du schlägst einen Handlungsablauf vor und magisch beeinflusst bis zu zwölf Kreaturen in 9m Reichweite, die dich hören und verstehen können. Kreaturen, die nicht bezaubert werden können, sind immun. Der Vorschlag muss vernünftig klingen. Jede Kreatur muss WEI-RW machen oder folgt dem Vorschlag für die Dauer. Höhere Stufen: Dauer steigt (7: 10 Tage, 8: 30 Tage, 9: 1 Jahr und 1 Tag).',
'You suggest a course of activity (limited to a sentence or two) and magically influence up to twelve creatures of your choice that you can see within range and that can hear and understand you. The suggestion must be worded in a manner to make it sound reasonable.',
'["Barde", "Hexenmeister", "Magier"]'),

('Echtseher', 'True Seeing', 6, 'Erkenntnismagie', 'Divination', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'1 Stunde', '1 hour', FALSE, FALSE,
'Eine willige Kreatur, die du berührst, kann wahre Formen sehen. Für die Dauer hat die Kreatur Blindsicht 36m, kann unsichtbare Kreaturen und Objekte sehen, automatisch visuelle Illusionen durchschauen, die wahre Form von Gestaltenwandlern oder Kreaturen unter Verwandlungsmagie sehen, und in die Astralebene sehen. Material: Salbe für die Augen im Wert von 25 GM, die der Zauber verbraucht.',
'A willing creature you touch gains the ability to see things as they actually are. For the duration, the creature has truesight out to 120 feet, can see invisible creatures and objects, automatically detects visual illusions, and can see the true form of shapechangers.',
'["Barde", "Hexenmeister", "Magier", "Kleriker"]'),

('Heilkreis', 'Circle of Death', 6, 'Nekromantie', 'Necromancy', '1 Aktion', '1 action', '45 m', '150 feet', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Eine Sphäre negative Energie breitet sich in einem 18m-Radius von einem Punkt in Reichweite aus. Jede Kreatur im Bereich muss KON-RW machen oder 8W6 nekrotischen Schaden erleiden (Erfolg: halber Schaden). Höhere Stufen: +2W6 pro Stufe über 6.',
'A sphere of negative energy ripples out in a 60-foot-radius sphere from a point within range. Each creature in that area must make a Constitution saving throw or take 8d6 necrotic damage (half on success).',
'["Hexenmeister", "Magier"]'),

-- ========================================
-- LEVEL 7+ ZAUBER (Auswahl der wichtigsten)
-- ========================================

('Fingertod', 'Finger of Death', 7, 'Nekromantie', 'Necromancy', '1 Aktion', '1 action', '18 m', '60 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du sendest negative Energie durch eine Kreatur in Sicht. Ziel muss KON-RW machen oder 7W8+30 nekrotischen Schaden erleiden (Erfolg: halber Schaden). Ein von diesem Zauber getöteter Humanoider erhebt sich zu Beginn deines nächsten Zuges als Zombie unter deiner Kontrolle.',
'You send negative energy coursing through a creature that you can see within range, causing it searing pain. The target must make a Constitution saving throw or take 7d8 + 30 necrotic damage (half on success). A humanoid killed by this spell rises as a zombie under your control.',
'["Hexenmeister", "Magier"]'),

('Auferstehung', 'Resurrection', 7, 'Nekromantie', 'Necromancy', '1 Stunde', '1 hour', 'Berührung', 'Touch', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du berührst eine tote Kreatur, die nicht länger als ein Jahrhundert tot war, nicht an Altersschwäche gestorben ist und kein Untot ist. Die Kreatur kehrt mit allen TP zurück. Der Zauber heilt alle Wunden, neutralisiert Gifte, heilt Krankheiten und schließt Flüche. Der Zauber ersetzt beschädigte oder fehlende Organe und Gliedmaßen. Material: Diamant im Wert von mindestens 1.000 GM, den der Zauber verbraucht.',
'You touch a dead creature that has been dead for no more than a century, that didn\'t die of old age, and that isn\'t undead. The creature returns to life with all its hit points. This spell neutralizes any poisons and cures normal diseases, closes all mortal wounds, and restores any missing body parts.',
'["Barde", "Kleriker"]'),

('Ebenenwechsel', 'Plane Shift', 7, 'Beschwörung', 'Conjuration', '1 Aktion', '1 action', 'Berührung', 'Touch', 'V, S, M',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du und bis zu acht willige Kreaturen, die du an den Händen hältst, werdet auf eine andere Daseinsebene transportiert. Alternativ kannst du den Zauber nutzen, um eine unwillige Kreatur auf eine andere Ebene zu schicken (muss CHA-RW machen). Material: eine abgestimmte Metallstange im Wert von mindestens 250 GM für die Zielebene.',
'You and up to eight willing creatures who link hands in a circle are transported to a different plane of existence. Alternatively, you can use the spell to send an unwilling creature to another plane (it must make a Charisma saving throw).',
'["Hexenmeister", "Magier", "Kleriker"]'),

('Feuersturm', 'Fire Storm', 7, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '45 m', '150 feet', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Ein Sturm aus wirbelnden Flammen erscheint an einem Ort deiner Wahl. Der Bereich besteht aus bis zu zehn 3m-Würfeln, die du anordnen kannst. Jeder Würfel muss mindestens eine Fläche mit einem anderen Würfel teilen. Jede Kreatur im Bereich muss GES-RW machen oder 7W10 Feuerschaden erleiden (Erfolg: halber Schaden). Pflanzen im Bereich erleiden maximalen Schaden.',
'A storm made up of sheets of roaring flame appears in a location you choose within range. The area of the storm consists of up to ten 10-foot cubes, which you can arrange as you wish. Each creature in the area must make a Dexterity saving throw or take 7d10 fire damage (half on success).',
'["Druide", "Kleriker"]'),

('Teleporation', 'Teleport', 7, 'Beschwörung', 'Conjuration', '1 Aktion', '1 action', '3 m', '10 feet', 'V',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du teleportierst dich und bis zu acht willige Kreaturen deiner Wahl in 3m Reichweite an ein Ziel deiner Wahl. Das Ziel kann ein Ort sein, den du kennst, visualisieren kannst oder durch Richtung und Entfernung beschreiben kannst. Genauigkeit basiert auf deiner Vertrautheit: Permanenter Kreis (100%), Verknüpftes Objekt (100%), Sehr vertraut (fehlerfrei), Gelegentlich gesehen (Katastrophe möglich), Einmal gesehen (50% Katastrophe), Vom Hörensagen (43% Fehler).',
'You and up to eight willing creatures who link hands in a circle teleport to a destination you select. The destination you choose must be known to you. Your familiarity with the destination determines whether you arrive there successfully.',
'["Barde", "Hexenmeister", "Magier"]'),

('Meteoritenschwarm', 'Meteor Swarm', 9, 'Hervorrufung', 'Evocation', '1 Aktion', '1 action', '1,6 km', '1 mile', 'V, S',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Flammende Kugeln stürzen auf den Boden an vier Punkten deiner Wahl in Reichweite. Jede Kreatur in einem 12m-Radius einer Kugel muss GES-RW machen oder 20W6 Feuerschaden und 20W6 Wuchtschaden erleiden (Erfolg: halber Schaden). Eine Kreatur im Überlappungsbereich ist nur einmal betroffen. Der Zauber beschädigt und entzündet Objekte im Bereich.',
'Blazing orbs of fire plummet to the ground at four different points you can see within range. Each creature in a 40-foot-radius sphere centered on each point must make a Dexterity saving throw or take 20d6 fire damage and 20d6 bludgeoning damage (half on success).',
'["Magier"]'),

('Machtwort Töten', 'Power Word Kill', 9, 'Verzauberung', 'Enchantment', '1 Aktion', '1 action', '18 m', '60 feet', 'V',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Du sprichst ein Wort der Macht aus, das eine Kreatur, die du sehen kannst, zwingen kann zu sterben. Wenn die Kreatur 100 oder weniger Trefferpunkte hat, stirbt sie. Andernfalls hat der Zauber keinen Effekt.',
'You utter a word of power that can compel one creature you can see within range to die instantly. If the creature you choose has 100 hit points or fewer, it dies. Otherwise, the spell has no effect.',
'["Barde", "Hexenmeister", "Magier"]'),

('Wunsch', 'Wish', 9, 'Beschwörung', 'Conjuration', '1 Aktion', '1 action', 'Selbst', 'Self', 'V',
'Unmittelbar', 'Instantaneous', FALSE, FALSE,
'Wunsch ist der mächtigste Zauber. Du kannst die Grundlagen der Realität nach deinen Wünschen verändern. Die einfachste Verwendung ist das Duplizieren eines Zaubers der Stufe 8 oder niedriger (keine Komponenten nötig). Du kannst auch einen der folgenden Effekte erschaffen: 20 Kreaturen vollständig heilen, 10 Kreaturen wiederbeleben (tot bis 1 Jahr), Widerstand/Immunität gegen einen Zauber für 8 Std, Rückgängigmachen eines Ereignisses der letzten Runde. Kreativere Verwendungen möglich (nach DM-Ermessen). WARNUNG: Andere Verwendungen als Zauberduplikation haben 33% Chance, nie wieder Wunsch wirken zu können.',
'Wish is the mightiest spell a mortal can cast. You can alter the very foundations of reality. The most basic use is duplicating any spell of 8th level or lower. You can also create one of several effects, or DM may allow more creative uses. Stress of casting wish for anything other than duplicating a spell has a 33% chance you can never cast wish again.',
'["Magier"]');
