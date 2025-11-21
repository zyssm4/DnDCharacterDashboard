-- Teil 2: Level 2-9 Zauber (Fortsetzung)
-- Führe dies nach spell_descriptions_complete.sql aus

-- ============================================
-- LEVEL 2 ZAUBER (Fortsetzung)
-- ============================================

UPDATE `spells` SET
    `description_de` = 'Du berührst eine Kreatur und verleihst ihr magische Verbesserung. Wähle einen der folgenden Effekte; das Ziel erhält ihn für die Dauer: **Bärenstärke:** Vorteil auf Stärkewürfe und doppelte Tragekapazität. **Stierfestigkeit:** Vorteil auf Konstitutionswürfe und 2W6 temporäre Trefferpunkte. **Katzengewandtheit:** Vorteil auf Geschicklichkeitswürfe, kein Schaden bei Sturz aus 6 m oder weniger. **Adlerglanz:** Vorteil auf Weisheitswürfe. **Fuchsschläue:** Vorteil auf Intelligenzwürfe. **Eulenweisheit:** Vorteil auf Charismawürfe. **Auf höheren Stufen:** Du kannst eine zusätzliche Kreatur pro Zaubergrad über 2 als Ziel wählen.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 40; -- Attribut verbessern (Enhance Ability)

UPDATE `spells` SET
    `description_de` = 'Der Boden in einem Radius von 6 m, zentriert auf einem Punkt innerhalb der Reichweite, wird zu scharf spitzen Dornen und Stacheln. Der Bereich wird zu schwierigem Gelände für die Dauer. Wenn eine Kreatur in den Bereich eindringt oder sich darin bewegt, erleidet sie **2W4 Stichschaden** pro 1,5 m, die sie zurücklegt. Die Verwandlung des Bodens wird so gut getarnt, dass sie schwer zu sehen ist. Eine Kreatur, die den Bereich nicht sehen kann, wenn der Zauber gewirkt wird, muss einen Weisheitswurf (Wahrnehmung) gegen deinen Zauberrettungswurf-SG bestehen, um zu bemerken, dass das Gelände gefährlich ist, bevor sie den Bereich betritt. **Auf höheren Stufen:** +1W4 Schaden pro Zaubergrad über 2.',
    `range_de` = '45 m',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Verwandlung'
WHERE `id` = 41; -- Dornenwuchs (Spike Growth)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine willige Kreatur, um ihr für die Dauer die Fähigkeit zu gewähren, im Dunkeln zu sehen. Für die Dauer hat diese Kreatur Dunkelsicht mit einer Reichweite von 18 m.',
    `range_de` = 'Berührung',
    `duration_de` = '8 Stunden',
    `school_de` = 'Verwandlung'
WHERE `id` = 42; -- Dunkelsicht (Darkvision)

UPDATE `spells` SET
    `description_de` = 'Wähle eine Kreatur, die du in Reichweite sehen kannst. Gelbe Bänder aus magischer Energie schlängeln sich um die Kreatur. Das Ziel muss einen Stärkerettungswurf bestehen, oder seine Fluggeschwindigkeit (falls vorhanden) wird auf 0 Fuß für die Dauer des Zaubers reduziert. Eine fliegende Kreatur, die vom Zauber betroffen ist, sinkt mit einer Rate von 18 m pro Runde, bis sie auf dem Boden landet oder der Zauber endet.',
    `range_de` = '90 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Verwandlung'
WHERE `id` = 43; -- Erdbindung (Earthbind)

UPDATE `spells` SET
    `description_de` = 'Du spürst die Anwesenheit jeder Falle innerhalb der Sichtlinie, die sich innerhalb von 36 m befindet. Eine Falle im Sinne dieses Zaubers umfasst alles, was einen plötzlichen oder unerwarteten Effekt verursachen würde, den du als schädlich oder unerwünscht betrachtest und der speziell von seinem Schöpfer zu diesem Zweck entworfen wurde. Der Zauber würde eine Falle offenbaren, würde aber keine natürliche Schwäche im Boden, eine instabile Decke oder eine versteckte Grube enthüllen. Dieser Zauber zeigt lediglich an, dass eine Falle vorhanden ist. Du erfährst nicht den Standort jeder Falle, aber du lernst die allgemeine Natur der Gefahr kennen, die die von dir wahrgenommene Falle darstellt.',
    `range_de` = '36 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 44; -- Fallen finden (Find Traps)

UPDATE `spells` SET
    `description_de` = 'Du beschwörst eine flammenähnliche Klinge in deiner freien Hand. Die Klinge ist ähnlich groß und Form wie ein Krummsäbel, und sie hält für die Dauer an. Falls du die Klinge fallen lässt oder wirfst, verschwindet sie, und sie erscheint wieder in deiner Hand, wenn du den Zauber erneut als Bonusaktion wirkst. Du kannst deine Aktion einsetzen, um einen Nahkampf-Zauberangriff mit der feurigen Klinge zu machen. Bei einem Treffer erleidet das Ziel **3W6 Feuerschaden**. Die flammende Klinge strahlt helles Licht in einem Radius von 3 m und dämmriges Licht für weitere 3 m aus. **Auf höheren Stufen:** +1W6 Schaden pro Zaubergrad über 2.',
    `range_de` = 'Selbst',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Hervorrufung'
WHERE `id` = 45; -- Flammenklinge (Flame Blade)

UPDATE `spells` SET
    `description_de` = 'Eine 1,5 m große Kugel aus Feuer erscheint in einem freien Raum deiner Wahl innerhalb der Reichweite und hält für die Dauer an. Jede Kreatur, die ihren Zug innerhalb von 1,5 m von der Kugel beendet, muss einen Geschicklichkeitsrettungswurf bestehen oder **2W6 Feuerschaden** erleiden. Die Kugel entzündet brennbare Objekte, die nicht getragen oder gehalten werden. Du kannst die Kugel als Bonusaktion bis zu 9 m weit bewegen. Wenn du die Kugel in eine Kreatur rammst, muss diese Kreatur den Rettungswurf machen, und die Kugel stoppt ihre Bewegung für diese Runde. **Auf höheren Stufen:** +1W6 Schaden pro Zaubergrad über 2.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Beschwörung'
WHERE `id` = 46; -- Flammenkugel (Flaming Sphere)

UPDATE `spells` SET
    `description_de` = 'Beschreibe oder benenne einen Gegenstand, der dir vertraut ist. Du spürst die Richtung zum Standort des Gegenstands, solange er sich innerhalb von 300 m von dir befindet. Falls der Gegenstand bewegt wird, kennst du die Richtung seiner Bewegung. Der Zauber kann einen spezifischen Gegenstand lokalisieren, den du kennst, solange du ihn mindestens einmal aus der Nähe gesehen hast. Alternativ kann der Zauber den nächsten Gegenstand einer bestimmten Art lokalisieren. Der Zauber kann den Gegenstand nicht finden, falls eine direkte Linie zwischen dir und dem Gegenstand durch Blei blockiert ist.',
    `range_de` = 'Selbst',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 47; -- Gegenstand aufspüren (Locate Object)

UPDATE `spells` SET
    `description_de` = 'Du rufst einen heilenden Naturgeist herbei, der in einem Würfel von 1,5 m an einem Punkt erscheint, den du in Reichweite sehen kannst. Der Geist sieht aus wie ein transparentes Tier oder Feenwesen (deine Wahl). Bis der Zauber endet, belegt der Geist seinen Raum, und wenn du oder eine Kreatur, die du sehen kannst, zum ersten Mal in einem Zug den Raum des Geistes betritt oder dort beginnt, kannst du dem Geist befehlen, die Kreatur wiederherzustellen. Die Kreatur erhält **1W6** Trefferpunkte zurück. Der Geist kann als Bonusaktion bis zu 9 m weit zu einem Punkt bewegt werden, den du sehen kannst. **Auf höheren Stufen:** +1W6 Heilung pro Zaubergrad über 2.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Beschwörung'
WHERE `id` = 48; -- Heilungsgeist (Healing Spirit)

UPDATE `spells` SET
    `description_de` = 'Du schreibst Worte in den Himmel, die aus Wolken bestehen und für die Dauer an Ort und Stelle bleiben. Die Worte erscheinen aus deiner Sicht seitenrichtig zu sein. Sie können in jeder Sprache geschrieben werden, die du kennst, und sind sichtbar bis zu 3 km entfernt. Ein starker Wind (mindestens 30 km/h) kann die Wolken zerstreuen und den Zauber vorzeitig beenden.',
    `range_de` = 'Sichtweite',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 49; -- Himmelschreiben (Skywrite)

UPDATE `spells` SET
    `description_de` = 'Wähle einen hergestellten Metallgegenstand, wie eine Metallwaffe oder eine schwere oder mittelschwere Metallrüstung, den du in Reichweite sehen kannst. Du verursachst, dass der Gegenstand rot-heiß glüht. Jede Kreatur, die in physischem Kontakt mit dem Gegenstand ist, erleidet **2W8 Feuerschaden**, wenn du den Zauber wirkst. Bis der Zauber endet, kannst du in jedem deiner folgenden Züge eine Bonusaktion verwenden, um diesen Schaden erneut zu verursachen. Falls eine Kreatur den Gegenstand hält oder trägt und den Schaden erleidet, muss sie einen Konstitutionsrettungswurf bestehen, oder sie lässt den Gegenstand fallen. Falls sie ihn nicht fallen lässt, hat sie Nachteil auf Angriffs- und Attributswürfe, bis der Beginn deines nächsten Zuges. **Auf höheren Stufen:** +1W8 Schaden pro Zaubergrad über 2.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Verwandlung'
WHERE `id` = 50; -- Metall erhitzen (Heat Metal)

UPDATE `spells` SET
    `description_de` = 'Ein silberner Lichtstrahl strahlt in einem Zylinder mit 1,5 m Radius und 12 m Höhe, zentriert auf einem Punkt innerhalb der Reichweite. Bis der Zauber endet, erfüllt dämmriges Licht den Zylinder. Wenn eine Kreatur zum ersten Mal in einem Zug den Bereich des Zaubers betritt oder dort ihren Zug beginnt, wird sie in gespenstisches Licht gehüllt und muss einen Konstitutionsrettungswurf bestehen oder **2W10 gleißenden Schaden** erleiden. Ein Gestaltwandler macht diesen Rettungswurf mit Nachteil. Falls es ihm misslingt, nimmt es sofort seine ursprüngliche Form an und kann seine Form nicht mehr ändern, bis es den Bereich des Zaubers verlässt. Als Aktion in deinem Zug kannst du den Zylinder bis zu 18 m bewegen. **Auf höheren Stufen:** +1W10 Schaden pro Zaubergrad über 2.',
    `range_de` = '36 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Hervorrufung'
WHERE `id` = 51; -- Mondstrahl (Moonbeam)

UPDATE `spells` SET
    `description_de` = 'Wähle einen Humanoiden, den du in Reichweite sehen kannst. Das Ziel muss einen Weisheitsrettungswurf bestehen oder wird für die Dauer gelähmt. Am Ende jedes seiner Züge kann das Ziel einen weiteren Weisheitsrettungswurf machen. Bei Erfolg endet der Zauber für diese Kreatur. **Auf höheren Stufen:** Du kannst einen zusätzlichen Humanoiden pro Zaubergrad über 2 als Ziel wählen.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Verzauberung'
WHERE `id` = 52; -- Person festhalten (Hold Person)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine willige Kreatur. Bis der Zauber endet, wird die Haut des Ziels eine raue, rindenartige Erscheinung haben, und seine Rüstungsklasse kann nicht weniger als 16 sein, unabhängig davon, welche Art von Rüstung es trägt.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 53; -- Rindenhaut (Barkskin)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine Kreatur. Falls sie vergiftet ist, neutralisierst du das Gift. Falls mehr als ein Gift die Kreatur befällt, neutralisierst du ein Gift, von dem du weißt, dass es vorhanden ist, oder ein zufälliges Gift. Für die Dauer hat das Ziel Vorteil auf Rettungswürfe gegen Vergiftung, und es hat Resistenz gegen Giftschaden.',
    `range_de` = 'Berührung',
    `duration_de` = '1 Stunde',
    `school_de` = 'Bannzauber'
WHERE `id` = 54; -- Schutz vor Gift (Protection from Poison)

UPDATE `spells` SET
    `description_de` = 'Ein starker Wind (30 km/h) weht um dich herum in einem Radius von 3 m und bewegt sich mit dir, zentriert auf dir. Der Wind hält für die Dauer an. Der Wind hat die folgenden Effekte: Er zerstreut Gas oder Dampf, und er löscht Kerzen, Fackeln und ähnliche ungeschützte Flammen im Bereich. Er macht den Bereich zu schwierigem Gelände für Kreaturen außer dir. Der Angriffswurf einer Fernkampfwaffe hat Nachteil, falls die Waffe durch den Bereich fliegt.',
    `range_de` = 'Selbst',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Hervorrufung'
WHERE `id` = 55; -- Schutzwind (Warding Wind)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine Kreatur und kannst entweder eine Krankheit beenden oder einen Zustand, der sie befällt. Der Zustand kann taub, blind, gelähmt oder vergiftet sein.',
    `range_de` = 'Berührung',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Bannzauber'
WHERE `id` = 56; -- Schwache Genesung (Lesser Restoration)

UPDATE `spells` SET
    `description_de` = 'Eine Schleier aus Schatten und Stille strahlt von dir aus und maskiert dich und deine Gefährten vor Entdeckung. Für die Dauer hat jede Kreatur deiner Wahl innerhalb von 9 m von dir (einschließlich dir) einen Bonus von +10 auf Geschicklichkeitswürfe (Heimlichkeit) und kann nicht verfolgt werden, außer durch magische Mittel. Eine Kreatur, die diesen Bonus erhält, hinterlässt weder Spuren noch andere Zeichen ihrer Passage.',
    `range_de` = 'Selbst',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Bannzauber'
WHERE `id` = 57; -- Spurloses gehen (Pass without Trace)

UPDATE `spells` SET
    `description_de` = 'Wähle einen freien Raum mit 1,5 m Durchmesser, den du in Reichweite sehen kannst. Ein mittelgroßer Hand-förmiger Wirbelsturm bildet sich an diesem Ort für die Dauer. Der Wirbelsturm bewegt sich mit einer Geschwindigkeit von 9 m entlang des Bodens in zufällige Richtungen (würfle einen W4 am Ende jedes deiner Züge: 1 = Norden, 2 = Süden, 3 = Osten, 4 = Westen). Jede mittelgroße oder kleinere Kreatur, die mit dem Wirbelsturm kollidiert, muss einen Stärkerettungswurf bestehen oder **1W8 Wuchtschaden** erleiden und 3 m in die Luft geschleudert werden. **Auf höheren Stufen:** +1W8 Schaden pro Zaubergrad über 2.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Beschwörung'
WHERE `id` = 58; -- Staubteufel (Dust Devil)

UPDATE `spells` SET
    `description_de` = 'Du rufst ein tierisches Tiergeistwesen herbei. Es manifestiert sich in einem freien Raum, den du in Reichweite sehen kannst. Diese körperliche Form hält für die Dauer an. Wenn du den Zauber wirkst, wählst du eine Tierart: Luft, Land oder Wasser. Die Kreatur ähnelt einem Tier deiner Wahl, das für die gewählte Art repräsentativ ist. Die Kreatur verschwindet, wenn ihre Trefferpunkte auf 0 sinken oder der Zauber endet. Die Kreatur ist freundlich dir und deinen Gefährten gegenüber. Würfle Initiative für die Kreatur, die ihre eigenen Züge hat. Sie befolgt alle verbalen Befehle, die du ihr gibst (keine Aktion erforderlich). Falls du ihr keinen Befehl gibst, verteidigt sie sich, unternimmt aber sonst keine Aktionen. **Auf höheren Stufen:** +1 Stufe des Zauberplatzes erhöht alle Schadenswürfel der Kreatur um 1.',
    `range_de` = '27 m',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Beschwörung'
WHERE `id` = 59; -- Tier beschwören (Summon Beast)

UPDATE `spells` SET
    `description_de` = 'Beschreibe oder benenne ein spezifisches Tier oder eine spezifische Pflanze. Du konzentrierst dich auf die nächste Kreatur oder Pflanze dieser Art innerhalb von 8 km und spürst ihre Richtung und ungefähre Entfernung. Falls die Kreatur oder Pflanze sich bewegt, kennst du die Richtung ihrer Bewegung.',
    `range_de` = 'Selbst',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 60; -- Tier oder Pflanze aufspüren (Locate Animals or Plants)

UPDATE `spells` SET
    `description_de` = 'Du benutzt ein Tier, um eine Botschaft zu überbringen. Wähle eine Winzige Bestie, die du sehen kannst, wie einen Eichhörnchen, einen Blauhäher oder eine Fledermaus. Du gibst eine Nachricht von bis zu fünfundzwanzig Wörtern an. Das Ziel-Tier reist für die Dauer des Zaubers zu einem Ort, den du kennst, und legt 75 km pro 24 Stunden für einen fliegenden Boten oder 37,5 km für andere Tiere zurück. Wenn der Bote ankommt, überbringt er deine Nachricht an die Kreatur, die du beschrieben hast.',
    `range_de` = '9 m',
    `duration_de` = '24 Stunden',
    `school_de` = 'Verzauberung'
WHERE `id` = 61; -- Tierbote (Animal Messenger)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine willige Bestie. Für die Dauer des Zaubers kannst du deine Aktion einsetzen, um durch die Sinne der Bestie zu sehen und zu hören, bis zu deinem nächsten Zug, wodurch du die Vorteile aller Spezialsinne der Bestie erhältst. Während dieser Zeit bist du gegenüber deinen eigenen Sinnen taub und blind.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 62; -- Tiersinn (Beast Sense)

UPDATE `spells` SET
    `description_de` = 'Eine Linie aus starkem Wind mit einer Länge von 18 m und einer Breite von 3 m strömt von dir in eine Richtung deiner Wahl für die Dauer des Zaubers. Jede Kreatur, die ihren Zug in der Linie beginnt, muss einen Stärkerettungswurf bestehen oder 4,5 m in die Richtung weggestoßen werden, in die der Wind weht. Jede Kreatur in der Linie muss 3 m Bewegung für jeden 1,5 m aufwenden, den sie sich dem Wind entgegen bewegt. Die Windbö zerstreut Gas oder Dampf und löscht Kerzen, Fackeln und ähnliche Flammen. Sie verursacht, dass geschützte Flammen wild flackern (50%ige Chance zu erlöschen). Als Bonusaktion in jedem deiner Züge, bevor der Zauber endet, kannst du die Richtung ändern, in die die Linie von dir wegströmt.',
    `range_de` = 'Selbst (Linie 18 m)',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Hervorrufung'
WHERE `id` = 63; -- Windstoss (Gust of Wind)

-- ============================================
-- LEVEL 3 ZAUBER - 18 Zauber
-- ============================================

UPDATE `spells` SET
    `description_de` = 'Dieser Zauber gewährt bis zu zehn willigen Kreaturen, die du sehen kannst, die Fähigkeit, auf Wasser zu gehen, als wäre es fester Boden. Falls du eine eingetauchte Kreatur als Ziel wählst, bewegt sich die Kreatur mit einer Rate von 18 m pro Runde zur Oberfläche des Wassers.',
    `range_de` = '9 m',
    `duration_de` = '1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 64; -- Auf Wasser gehen (Water Walk)

UPDATE `spells` SET
    `description_de` = 'Wähle einen Punkt, den du auf dem Boden in Reichweite sehen kannst. Ein Springbrunnen aus aufgewirbelter Erde und Stein bricht in einem Würfel von 6 m Kantenlänge hervor, zentriert auf diesem Punkt. Jede Kreatur in diesem Bereich muss einen Geschicklichkeitsrettungswurf bestehen oder **3W12 Wuchtschaden** erleiden. Zusätzlich wird der Boden im Bereich zu schwierigem Gelände, bis er geräumt wird (jeder 1,5-m-Quadrat-Teil benötigt mindestens 1 Minute zum Räumen von Hand). **Auf höheren Stufen:** +1W12 Schaden pro Zaubergrad über 3.',
    `range_de` = '36 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 65; -- Ausbrechende Erde (Erupting Earth)

UPDATE `spells` SET
    `description_de` = 'Eine brüllende Wolke erscheint oben in einem 18 m hohen Zylinder mit einem Radius von 18 m, zentriert auf einem Punkt, den du sehen kannst, 30 m direkt über dir. Der Zauber schlägt fehl, falls du keinen Himmel über dir sehen kannst. Wenn du den Zauber wirkst, wähle einen Punkt, den du unter der Wolke sehen kannst. Ein Blitz schlägt aus der Wolke in diesen Punkt ein. Jede Kreatur innerhalb von 1,5 m von diesem Punkt muss einen Geschicklichkeitsrettungswurf bestehen oder **3W10 Blitzschaden** erleiden, oder halb so viel bei Erfolg. In jedem deiner Züge, bis der Zauber endet, kannst du deine Aktion einsetzen, um erneut einen Blitz auf diese Weise auf denselben oder einen anderen Punkt unter der Wolke einschlagen zu lassen. Falls du draußen in einem Sturm bist, wenn du diesen Zauber wirkst, gibt dir der Zauber die Kontrolle über den existierenden Sturm, anstatt eine neue Wolke zu erschaffen, und der Schaden des Zaubers erhöht sich um 1W10. **Auf höheren Stufen:** +1W10 Schaden pro Zaubergrad über 3.',
    `range_de` = '36 m',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Beschwörung'
WHERE `id` = 66; -- Blitze herbeirufen (Call Lightning)

UPDATE `spells` SET
    `description_de` = 'Du rufst ein Feengeistwesen herbei. Es erscheint in einem freien Raum, den du in Reichweite sehen kannst. Dieser körperliche Geist hält für die Dauer an. Wenn du den Zauber wirkst, wählst du eine Stimmung: Fröhlich, Verstimmt oder Trickreich. Die Kreatur ähnelt einem Feenwesen deiner Wahl, das von der gewählten Stimmung geprägt ist. Die Kreatur verschwindet, wenn ihre Trefferpunkte auf 0 sinken oder der Zauber endet. Die Kreatur ist freundlich dir und deinen Gefährten gegenüber. Würfle Initiative für die Kreatur, die ihre eigenen Züge hat. **Auf höheren Stufen:** +2 Stufen des Zauberplatzes erhöhen alle Schadenswürfel der Kreatur um 1.',
    `range_de` = '27 m',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Beschwörung'
WHERE `id` = 67; -- Feenwesen beschwören (Summon Fey)

UPDATE `spells` SET
    `description_de` = 'Du berührst ein Köcher mit Pfeilen oder Bolzen. Wenn ein Ziel von einer dieser Munitionsarten getroffen wird, bevor der Zauber endet, erleidet das Ziel zusätzlich **1W6 Feuerschaden**. Die Munition brennt aus, wenn der Zauber endet. **Auf höheren Stufen:** Die Anzahl der Munition, die du mit Magie berühren kannst, erhöht sich um zwei für jeden Zaubergrad über 3.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 68; -- Flammenpfeile (Flame Arrows)

UPDATE `spells` SET
    `description_de` = 'Du beschwörst eine Wand aus Wasser auf dem Boden an einem Punkt, den du in Reichweite sehen kannst. Du kannst die Wand bis zu 9 m lang, 9 m hoch und 1,5 m dick machen. Die Wand hält für die Dauer an. Wenn die Wand zum ersten Mal in einem Zug an jedem Punkt erscheint, muss jede Kreatur innerhalb ihres Bereichs einen Geschicklichkeitsrettungswurf bestehen oder **6W10 Wuchtschaden** erleiden, oder halb so viel bei Erfolg. Am Anfang jedes deiner Züge, nach dem Erscheinen der Wand, bewegt sich die Wand 15 m von dir weg. Jede Kreatur von Größe Riesig oder kleiner innerhalb der Wand oder deren Raum von ihr belegt wird, wird mit ihr mitgezogen. Eine Kreatur von Größe Riesig oder kleiner, die versucht, gegen die Bewegung der Wand einzutreten oder sie zu kreuzen, muss einen Stärkerettungswurf bestehen oder wird von der Welle mitgezogen. **Auf höheren Stufen:** +1W10 Schaden pro Zaubergrad über 3.',
    `range_de` = '36 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Beschwörung'
WHERE `id` = 69; -- Flutwelle (Tidal Wave)

UPDATE `spells` SET
    `description_de` = 'Wähle eine Kreatur, ein Objekt oder einen magischen Effekt innerhalb der Reichweite. Jeder Zauber des 3. Grades oder niedriger auf dem Ziel endet. Für jeden Zauber des 4. Grades oder höher auf dem Ziel, mache einen Attributswurf mit deinem Zauberwirken-Attribut. Der SG entspricht 10 + Grad des Zaubers. Bei einem erfolgreichen Wurf endet der Zauber. **Auf höheren Stufen:** Du beendest automatisch die Effekte eines Zaubers auf dem Ziel, falls der Grad des Zaubers gleich oder niedriger als der Grad des Zauberplatzes ist, den du benutzt hast.',
    `range_de` = '36 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Bannzauber'
WHERE `id` = 70; -- Magie bannen (Dispel Magic)

UPDATE `spells` SET
    `description_de` = 'Du verleihst Pflanzen in einem 9-m-Radius, zentriert auf einem Punkt in Reichweite, die Fähigkeit zu sprechen und sich zu bewegen. Bis der Zauber endet können diese Pflanzen mit dir kommunizieren und deine Befehle befolgen. Wenn immer eine freundliche Kreatur, die nicht du ist, sich den Pflanzen nähert, können die Pflanzen dir Informationen darüber geben, was in den letzten 24 Stunden in deiner Umgebung passiert ist. Du kannst auch Pflanzen zu einem anderen Effekt nutzen: Wuchernde Pflanzen werden im Radius zu schwierigem Gelände. Pflanzen in diesem Bereich wachsen, um Wege zu öffnen (normale Bewegungsrate für 1 Jahr).',
    `range_de` = 'Selbst (Radius 9 m)',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 71; -- Mit Pflanzen sprechen (Speak with Plants)

UPDATE `spells` SET
    `description_de` = 'Du schreitest in einen Stein, der groß genug ist, um deinen Körper aufzunehmen, und verschmilzt mit ihm und all deiner Ausrüstung für die Dauer. Du verwendest deine Bewegung, um in den Stein an einem Punkt zu treten, den du berühren kannst. Nichts von deiner Anwesenheit bleibt sichtbar oder anderweitig durch nicht-magische Sinne nachweisbar. Während du mit dem Stein verschmolzen bist, kannst du nicht sehen, was draußen passiert, und alle Weisheitswürfe (Wahrnehmung), die du machst, um Geräusche draußen zu hören, werden mit Nachteil gemacht. Du bleibst dir der Passage der Zeit bewusst. Du kannst als deine Bewegung aus dem Stein heraustreten, wo du hineingetreten bist, was den Zauber beendet. Andernfalls kannst du dich nicht bewegen.',
    `range_de` = 'Berührung',
    `duration_de` = '8 Stunden',
    `school_de` = 'Verwandlung'
WHERE `id` = 72; -- Mit Stein verschmelzen (Meld into Stone)

UPDATE `spells` SET
    `description_de` = 'Dieser Zauber channelt Vitalität in Pflanzen innerhalb eines bestimmten Bereichs. Es gibt zwei mögliche Verwendungen für den Zauber: **Pflanzen fördern (8 Stunden Wirkzeit):** Alle Pflanzen in einem Radius von 800 m, zentriert auf diesem Punkt, werden für 1 Jahr mit reicher Vitalität erfüllt. Pflanzen produzieren doppelt so viel Nahrung. **Pflanzen überwuchern (1 Aktion Wirkzeit):** Alle normale Pflanzen in einem Radius von 30 m, zentriert auf diesem Punkt, werden dick und überwuchert. Eine Kreatur, die sich durch den Bereich bewegt, muss 12 m Bewegung für jeden 1,5 m aufwenden, den sie zurücklegt.',
    `range_de` = '45 m oder 150 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 73; -- Pflanzenwachstum (Plant Growth)

UPDATE `spells` SET
    `description_de` = 'Bis der Zauber endet, fällt gefrierender Regen und hagelnder Schneeregen in einem Zylinder mit 12 m Höhe und 6 m Radius, zentriert auf einem Punkt, den du wählst, innerhalb der Reichweite. Der Bereich ist stark verschleiert, und offene Flammen im Bereich werden gelöscht. Der Boden im Bereich ist mit rutschigem Eis bedeckt und gilt als schwieriges Gelände. Wenn eine Kreatur zum ersten Mal in einem Zug den Bereich des Zaubers betritt oder dort ihren Zug beginnt, muss sie einen Geschicklichkeitsrettungswurf bestehen oder hinfallen. Falls eine Kreatur sich im Bereich konzentriert, muss sie einen erfolgreichen Konstitutionsrettungswurf gegen deinen Zauberrettungswurf-SG machen, oder sie verliert die Konzentration.',
    `range_de` = '45 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Beschwörung'
WHERE `id` = 74; -- Schneesturm (Sleet Storm)

UPDATE `spells` SET
    `description_de` = 'Für die Dauer hat eine willige Kreatur, die du berührst, Resistenz gegen eine Schadensart deiner Wahl: Säure, Kälte, Feuer, Blitz oder Schall.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Bannzauber'
WHERE `id` = 75; -- Schutz vor Energie (Protection from Energy)

UPDATE `spells` SET
    `description_de` = 'Eine Sphäre aus Licht mit 18 m Radius strahlt von einem Punkt aus, den du innerhalb der Reichweite wählst. Die Sphäre ist helles Licht und strahlt dämmriges Licht für weitere 18 m aus. Falls der Punkt, den du wählst, sich auf einem Objekt befindet, das du hältst, oder einem, das nicht getragen oder gehalten wird, strömt das Licht aus dem Objekt und bewegt sich mit ihm. Das vollständige Abdecken der Quelle des Lichts mit einem undurchsichtigen Gegenstand blockiert das Licht. Falls irgendein Teil dieses Zaubers sich mit einem Bereich von Dunkelheit überschneidet, der durch einen Zauber des 3. Grades oder niedriger erschaffen wurde, wird der Zauber, der die Dunkelheit erschaffen hat, aufgehoben.',
    `range_de` = '18 m',
    `duration_de` = '1 Stunde',
    `school_de` = 'Hervorrufung'
WHERE `id` = 76; -- Tageslicht (Daylight)

UPDATE `spells` SET
    `description_de` = 'Du beschwörst Feengeister, die die Form von Tieren annehmen und an freien Orten erscheinen, die du in Reichweite sehen kannst. Wähle eine der folgenden Optionen für das Erscheinen: **Eine Bestie mit HG 2 oder niedriger, zwei Bestien mit HG 1 oder niedriger, vier Bestien mit HG 1/2 oder niedriger, acht Bestien mit HG 1/4 oder niedriger**. Jede Bestie wird auch als Feenwesen betrachtet und verschwindet, wenn sie auf 0 Trefferpunkte fällt oder wenn der Zauber endet. Die beschworenen Kreaturen sind freundlich dir und deinen Gefährten gegenüber. Würfle Initiative für die beschworenen Kreaturen als Gruppe. Sie befolgen alle verbalen Befehle, die du ihnen gibst (keine Aktion erforderlich). **Auf höheren Stufen:** Wähle eine der Beschwörungsoptionen oben, aber jedes Mal, wenn du den Zauber mit einem Zauberplatz des 5. Grades oder höher wirkst, verdoppelt sich die Anzahl.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Beschwörung'
WHERE `id` = 77; -- Tiere beschwören (Conjure Animals)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine willige Kreatur und versetzt sie in einen kataleptischen Zustand, der nicht von ihrem Tod zu unterscheiden ist. Für die Dauer oder bis du die Kreatur als Aktion berührst und den Zauber beendest, erscheint die Kreatur tot für alle äußerlichen Untersuchungen und Zauber, die verwendet werden, um den Status der Kreatur zu bestimmen. Die Kreatur ist geblendet und handlungsunfähig, und ihre Bewegungsrate fällt auf 0. Die Kreatur hat Resistenz gegen allen Schaden außer psychischem Schaden. Falls die Kreatur krank ist oder vergiftet ist, wenn du den Zauber wirkst, oder während der Zauber in Kraft ist krank oder vergiftet wird, haben die Krankheit und das Gift keine Wirkung, bis der Zauber endet.',
    `range_de` = 'Berührung',
    `duration_de` = '1 Stunde',
    `school_de` = 'Nekromantie'
WHERE `id` = 78; -- Totstellen (Feign Death)

UPDATE `spells` SET
    `description_de` = 'Dieser Zauber gewährt bis zu zehn willigen Kreaturen, die du in Reichweite sehen kannst, die Fähigkeit, unter Wasser zu atmen, bis der Zauber endet. Betroffene Kreaturen behalten auch ihre normale Atemmethode.',
    `range_de` = '9 m',
    `duration_de` = '24 Stunden',
    `school_de` = 'Verwandlung'
WHERE `id` = 79; -- Wasser atmen (Water Breathing)

UPDATE `spells` SET
    `description_de` = 'Du beschwörst eine Wand aus Wasser auf dem Boden an einem Punkt, den du in Reichweite sehen kannst. Du kannst die Wand bis zu 9 m lang, 9 m hoch und 30 cm dick machen, oder du kannst eine ringartige Wand mit bis zu 6 m Durchmesser, 6 m Höhe und 30 cm Dicke formen. Die Wand verschwindet, wenn der Zauber endet. Der Bereich der Wand ist schwieriges Gelände. Jeder Fernkampf-Waffenangriff, der in die Wand eintritt oder durch sie hindurchgeht, hat Nachteil. Zauber, die Feuer- oder Blitzschaden verursachen und durch die Wand gehen, werden blockiert (die Wand gewährt totale Deckung für den Zweck dieser Zauber), und die Wand nimmt doppelten Schaden von solchen Zaubern. **Auf höheren Stufen:** +1,5 m Länge, +1,5 m Höhe und +15 cm Dicke pro Zaubergrad über 3.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Hervorrufung'
WHERE `id` = 80; -- Wasserwand (Wall of Water)

UPDATE `spells` SET
    `description_de` = 'Eine Wand aus starkem Wind erhebt sich vom Boden an einem Punkt, den du innerhalb der Reichweite wählst. Du kannst die Wand bis zu 15 m lang, 4,5 m hoch und 30 cm dick machen. Du kannst die Wand in jede Form formen, die du möchtest, solange sie einen durchgehenden Pfad entlang des Bodens bildet. Die Wand hält für die Dauer an. Wenn die Wand erscheint, muss jede Kreatur innerhalb ihres Bereichs einen Stärkerettungswurf bestehen oder **3W8 Wuchtschaden** erleiden, oder halb so viel bei Erfolg. Der starke Wind hält Gas oder Dampf fern und zerstreut Nebel. Kleine oder kleinere fliegende Kreaturen oder Objekte können die Wand nicht passieren. Lose, leichte Materialien, die von der Wand mitgebracht werden, fliegen nach oben. Pfeile, Bolzen und andere gewöhnliche Projektile, die auf Ziele hinter der Wand abgefeuert werden, werden abgelenkt und verfehlen automatisch. Große oder größere Kreaturen können sich mit Kraft durch die Wand bewegen und erleiden **5W8 Wuchtschaden** dabei. **Auf höheren Stufen:** +1W8 Schaden pro Zaubergrad über 3.',
    `range_de` = '36 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Hervorrufung'
WHERE `id` = 81; -- Windwall (Wind Wall)

-- Das ist Teil 2. Ich erstelle nun Teil 3 mit Level 4-9 Zaubern...
