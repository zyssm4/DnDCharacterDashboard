-- ========================================
-- HINTERGRÜNDE FÜR ALLE KLASSEN
-- Druide, Schurke, Barde, Magier, Paladin
-- ========================================

INSERT INTO backgrounds (name_de, name_en, description_de, skill_proficiencies, tool_proficiencies, languages, equipment, feature_name_de, feature_description_de) VALUES

-- ========================================
-- DRUIDEN-HINTERGRÜNDE
-- ========================================

('Einsiedler', 'Hermit',
'Du hast in Abgeschiedenheit in der Wildnis gelebt, im Einklang mit der Natur. Deine Zeit in der Einsamkeit hat dir Weisheit und eine tiefe Verbindung zur natürlichen Welt gegeben.',
'["medicine", "religion"]',
'["herbalism_kit"]',
1,
'[{"item": "Schriftrolle mit Gebeten", "quantity": 1}, {"item": "Wolldecke", "quantity": 1}, {"item": "Kräuterkundler-Set", "quantity": 1}, {"item": "Normale Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 5}]',
'Entdeckung',
'Die ruhige Abgeschiedenheit deines Rückzugsortes in der Natur gab dir Zugang zu einer einzigartigen und mächtigen Entdeckung. Du kennst ein Geheimnis der Natur, das dir auf deinem Weg helfen wird.'),

('Volksheld', 'Folk Hero',
'Du stammst aus den einfachen Leuten und hast dein Dorf oder deine Siedlung vor einer Naturkatastrophe oder einem Monster beschützt. Die Menschen sehen in dir ihren Verfechter und Beschützer.',
'["animal_handling", "survival"]',
'["artisan_tools", "vehicles_land"]',
0,
'[{"item": "Handwerkzeug", "quantity": 1}, {"item": "Schaufel", "quantity": 1}, {"item": "Eisentopf", "quantity": 1}, {"item": "Normale Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 10}]',
'Rustikale Gastfreundschaft',
'Einfache Leute, besonders Bauern und Landbewohner, helfen dir wo sie können. Sie verstecken dich vor dem Gesetz, heilen deine Wunden oder teilen ihr bescheidenes Mahl mit dir.'),

('Ausgestoßener', 'Outlander',
'Du bist in der Wildnis aufgewachsen, fernab der Zivilisation. Die Natur ist dein Zuhause und du kennst ihre Geheimnisse besser als jeder andere.',
'["athletics", "survival"]',
'["musical_instrument"]',
1,
'[{"item": "Wanderstab", "quantity": 1}, {"item": "Jagdfalle", "quantity": 1}, {"item": "Trophäe eines erlegten Tieres", "quantity": 1}, {"item": "Reisekleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 10}]',
'Wanderer',
'Du besitzt ein exzellentes Gedächtnis für Karten und Geografie. Du kannst dich immer an das allgemeine Layout von Gelände, Siedlungen und anderen Merkmalen in deiner Umgebung erinnern. Außerdem kannst du täglich Nahrung und frisches Wasser für bis zu sechs Personen finden, solange das Land Beeren, Kleinwild, Wasser usw. bietet.'),

-- ========================================
-- SCHURKEN-HINTERGRÜNDE
-- ========================================

('Gauner', 'Criminal',
'Du hast dein Leben im Schatten der Gesellschaft verbracht, Gesetze gebrochen und von kriminellen Aktivitäten gelebt. Du kennst die Unterwelt und ihre Regeln.',
'["deception", "stealth"]',
'["thieves_tools", "gaming_set"]',
0,
'[{"item": "Brecheisen", "quantity": 1}, {"item": "Dunkle Kleidung mit Kapuze", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 15}]',
'Kriminelle Kontakte',
'Du hast einen zuverlässigen Kontakt, der als Verbindung zu einem Netzwerk anderer Krimineller dient. Du weißt, wie man Nachrichten über große Entfernungen an deinen Kontakt übermittelt und versteckte Unterschlüpfe findet.'),

('Pirat', 'Pirate',
'Du hast dein Leben auf den Meeren verbracht, Schiffe überfallen und Schätze geplündert. Du kennst die Gesetze der See und die Freiheit des Piratenlebens.',
'["athletics", "perception"]',
'["navigators_tools", "vehicles_water"]',
0,
'[{"item": "Enterhaken", "quantity": 1}, {"item": "Seil (15m)", "quantity": 1}, {"item": "Glücksbringer", "quantity": 1}, {"item": "Normale Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 10}]',
'Schlechter Ruf',
'Egal wo du hinkommst, die Leute fürchten dich aufgrund deines Rufs. In zivilisierten Siedlungen kannst du mit kleinen Vergehen davonkommen, da die Leute dich nicht verärgern wollen. In Hafenstädten findest du immer Kontakte zur Unterwelt.'),

('Straßenkind', 'Urchin',
'Du bist in den Straßen einer großen Stadt aufgewachsen und musstest ums Überleben kämpfen. Du kennst die dunklen Gassen und Schlupfwinkel wie deine Westentasche.',
'["sleight_of_hand", "stealth"]',
'["disguise_kit", "thieves_tools"]',
0,
'[{"item": "Kleines Messer", "quantity": 1}, {"item": "Stadtplan", "quantity": 1}, {"item": "Zahme Maus", "quantity": 1}, {"item": "Erinnerungsstück von Eltern", "quantity": 1}, {"item": "Normale Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 10}]',
'Stadtgeheimnisse',
'Du kennst die geheimen Muster der Straßen und kannst doppelt so schnell durch Städte reisen als andere. Außerdem kannst du versteckte Durchgänge und Unterschlüpfe finden, wo andere nur Wände sehen.'),

-- ========================================
-- BARDEN-HINTERGRÜNDE
-- ========================================

('Unterhalter', 'Entertainer',
'Du bist es gewohnt, vor einem Publikum aufzutreten, sei es als Musiker, Schauspieler, Tänzer oder Geschichtenerzähler. Die Bühne ist dein Zuhause.',
'["acrobatics", "performance"]',
'["disguise_kit", "musical_instrument"]',
0,
'[{"item": "Musikinstrument", "quantity": 1}, {"item": "Liebesbriefe von Bewunderern", "quantity": 1}, {"item": "Kostüm", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 15}]',
'Bei Beliebtheit',
'Du kannst immer einen Ort finden, an dem du auftreten kannst (Tavernen, Theater, Zirkus). An solchen Orten erhältst du kostenlose Unterkunft und Verpflegung. Deine Auftritte machen dich lokal zu einer kleinen Berühmtheit.'),

('Gildenmitglied', 'Guild Artisan',
'Du bist Mitglied einer Künstlergilde oder Handwerksgilde. Dein Handwerk ist deine Kunst und deine Kunst ist dein Handwerk.',
'["insight", "persuasion"]',
'["artisan_tools"]',
1,
'[{"item": "Gildenausweis", "quantity": 1}, {"item": "Handwerkzeug", "quantity": 1}, {"item": "Reisekleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 15}]',
'Gildenmitgliedschaft',
'Du hast Zugang zu Gildenhallen und kannst dort Unterkunft und Verpflegung erhalten. Die Gilde bietet dir Unterstützung im Falle von Verfolgung oder bei rechtlichen Problemen. Du kannst auch auf das Netzwerk der Gilde zurückgreifen.'),

('Hofintrigant', 'Courtier',
'Du kennst die höfischen Sitten und die Kunst der Diplomatie. Du hast Zeit an Adelshöfen verbracht und verstehst die subtilen Spiele der Macht.',
'["insight", "persuasion"]',
'[]',
2,
'[{"item": "Feine Kleidung", "quantity": 1}, {"item": "Parfüm", "quantity": 1}, {"item": "Versiegelte Briefe", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 20}]',
'Höfische Manieren',
'Dein Wissen über höfische Etikette verschafft dir Zugang zu Adelshöfen. Du weißt, wie man sich in höchsten Kreisen bewegt und kannst Audienz bei lokalen Herrschern arrangieren.'),

-- ========================================
-- MAGIER-HINTERGRÜNDE
-- ========================================

('Gelehrter', 'Sage',
'Du hast Jahre damit verbracht, die Geheimnisse des Multiversums zu erforschen. Du hast an uralten Schriftrollen studiert und verbotenes Wissen gesucht.',
'["arcana", "history"]',
'[]',
2,
'[{"item": "Tintenflasche", "quantity": 1}, {"item": "Federkiel", "quantity": 1}, {"item": "Kleines Messer", "quantity": 1}, {"item": "Brief eines verstorbenen Kollegen", "quantity": 1}, {"item": "Normale Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 10}]',
'Forscher',
'Wenn du versuchst, etwas zu lernen oder dich an ein Stück Wissen zu erinnern, kennst du normalerweise einen Ort oder eine Person, die die Antwort haben könnte (Bibliothek, Weiser, Kloster). Du kannst Zugang zu großen Bibliotheken und Gelehrtenzirkeln erhalten.'),

('Adliger', 'Noble',
'Du verstehst Reichtum, Macht und Privilegien. Du trägst einen Adelstitel und deine Familie besitzt Land, erhebt Steuern und übt politischen Einfluss aus.',
'["history", "persuasion"]',
'["gaming_set"]',
1,
'[{"item": "Feine Kleidung", "quantity": 1}, {"item": "Siegelring", "quantity": 1}, {"item": "Pergamentrolle mit Stammbaum", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 25}]',
'Privilegposition',
'Dank deiner adligen Geburt werden dich die Leute der gehobenen Gesellschaft respektieren. Du kannst eine Audienz bei einem lokalen Adligen sichern und hast Zugang zu exklusiven magischen Schulen und Bibliotheken.'),

('Klausner', 'Cloistered Scholar',
'Du hast den Großteil deines Lebens in einer Bibliothek, einem Kloster oder einer Universität verbracht und dich dem Studium der arkanen Künste gewidmet.',
'["arcana", "history"]',
'[]',
2,
'[{"item": "Gelehrtenroben", "quantity": 1}, {"item": "Schreibset", "quantity": 1}, {"item": "Geliehenes Buch", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 10}]',
'Bibliothekszugang',
'Du hast Zugang zu den meisten Bibliotheken und Zentren des Wissens. Du weißt, wie man seltene Texte und arkane Schriften findet, und Bibliothekare unterstützen dich bei deiner Forschung.'),

-- ========================================
-- PALADIN-HINTERGRÜNDE
-- ========================================

('Akolyth', 'Acolyte',
'Du hast dein Leben im Dienst eines Tempels für einen bestimmten Gott oder ein Pantheon verbracht. Dein Glaube ist stark und deine göttliche Mission klar.',
'["insight", "religion"]',
'[]',
2,
'[{"item": "Heiliges Symbol", "quantity": 1}, {"item": "Gebetbuch", "quantity": 1}, {"item": "Weihrauch", "quantity": 5}, {"item": "Priestergewand", "quantity": 1}, {"item": "Normale Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 15}]',
'Zuflucht der Gläubigen',
'Du kannst magische Dienste für dich und deine Gefährten von einem Priester deines Glaubens kostenlos erhalten (nicht gold-kosten-intensiv). Tempel deiner Religion bieten dir Unterkunft und Unterstützung.'),

('Soldat', 'Soldier',
'Du hast als Teil einer Armee trainiert und gekämpft. Krieg ist dein Handwerk und du kennst die Realität des Schlachtfelds. Nun dienst du einer höheren Macht.',
'["athletics", "intimidation"]',
'["gaming_set", "vehicles_land"]',
0,
'[{"item": "Rangabzeichen", "quantity": 1}, {"item": "Trophäe eines gefallenen Feindes", "quantity": 1}, {"item": "Würfelset oder Kartendeck", "quantity": 1}, {"item": "Normale Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 10}]',
'Militärischer Rang',
'Du hast einen militärischen Rang von deiner Karriere als Soldat. Soldaten, die loyal zu deiner ehemaligen Armee sind, erkennen deine Autorität an. Du kannst Einfluss auf Soldaten und Offiziere ausüben.'),

('Ritter', 'Knight',
'Du wurdest zum Ritter geschlagen und hast einem Orden oder einem Lord gedient. Du folgst einem strengen Ehrenkodex und verteidigst die Schwachen.',
'["history", "persuasion"]',
'[]',
1,
'[{"item": "Ritterliche Banner", "quantity": 1}, {"item": "Siegelring", "quantity": 1}, {"item": "Feine Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 25}]',
'Ritterliche Stellung',
'Du wirst als Teil der niederen Aristokratie anerkannt. Gewöhnliche Leute bemühen sich, dir zu gefallen, und andere Ritter erkennen deine Stellung an. Du kannst Audienz bei lokalen Herrschern sichern.'),

-- ========================================
-- UNIVERSELLE HINTERGRÜNDE (Für alle Klassen passend)
-- ========================================

('Fremder', 'Far Traveler',
'Du kommst aus einer fernen, exotischen Gegend. Deine Kleidung, deine Sitten und deine Perspektive unterscheiden dich von den Einheimischen.',
'["insight", "perception"]',
'["musical_instrument", "gaming_set"]',
1,
'[{"item": "Reisekleidung", "quantity": 1}, {"item": "Schmuckstück oder Werkzeug", "quantity": 1}, {"item": "Stadtführer oder Karte", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 10}]',
'Alles ist neu',
'Dein fremdes Aussehen und deine ungewöhnlichen Geschichten ziehen die Aufmerksamkeit auf dich. Die Leute sind neugierig auf deine Heimat und behandeln dich oft als Kuriosität oder Gast.'),

('Waisenkind', 'Orphan',
'Du wuchst ohne Eltern auf und musstest früh lernen, für dich selbst zu sorgen. Diese harte Erfahrung hat dich zäh und einfallsreich gemacht.',
'["investigation", "survival"]',
'["thieves_tools"]',
0,
'[{"item": "Kleines Messer", "quantity": 1}, {"item": "Erinnerungsstück", "quantity": 1}, {"item": "Decke", "quantity": 1}, {"item": "Normale Kleidung", "quantity": 1}, {"item": "Geldbeutel", "quantity": 1, "gold": 5}]',
'Niemals allein',
'Du findest leicht Kontakt zu anderen Außenseitern und Benachteiligten. Waisenhäuser, Obdachlosenunterkünfte und ähnliche Einrichtungen bieten dir Zuflucht und Hilfe.');
