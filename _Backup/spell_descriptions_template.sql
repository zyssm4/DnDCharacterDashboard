-- Template für deutsche Zauberbeschreibungen
-- HINWEIS: Diese Kurzbeschreibungen müssen mit den vollständigen Texten aus dem
-- deutschen D&D 5e Spielerhandbuch ersetzt werden

-- ZAUBERTRICKS (Level 0)

UPDATE `spells` SET
    `description_de` = 'Du reparierst einen einzelnen Riss oder Bruch an einem Gegenstand. Der Riss oder Bruch darf nicht länger als 30 cm sein.',
    `range_de` = 'Berührung',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 1; -- Ausbessern

UPDATE `spells` SET
    `description_de` = 'Du beschwörst Ungeziefer, das eine Kreatur innerhalb der Reichweite beißt und sticht. Das Ziel muss einen KON-Rettungswurf bestehen oder 1W6 Giftschaden erleiden und sich 1,5 m in eine zufällige Richtung bewegen.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 2; -- Befall

UPDATE `spells` SET
    `description_de` = 'Du erzeugst einen donnernden Knall, der in einem Umkreis von 1,5 m um dich herum zu hören ist. Alle Kreaturen außer dir in diesem Bereich müssen einen KON-Rettungswurf bestehen oder 1W6 Schallschaden erleiden.',
    `range_de` = '1,5 m',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 3; -- Donnerschlag

UPDATE `spells` SET
    `description_de` = 'Du erschaffst eine lange, peitschen

artige Ranke voller Dornen, die nach deinem Befehl eine Kreatur in Reichweite angreift. Mache einen Nahkampf-Zauberangriff. Bei einem Treffer erleidet das Ziel 1W6 Stichschaden, und wenn es von Größe Groß oder kleiner ist, ziehst du es bis zu 3 m näher zu dir heran.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 4; -- Dornenpeitsche

UPDATE `spells` SET
    `description_de` = 'Du wirkst einen geringfügigen Wundereffekt der Natur innerhalb der Reichweite. Du kannst ein harmloses sensorisches Wetterphänomen erschaffen, eine Blume zum Blühen bringen, eine Flamme flackern lassen oder sofort sprießen, das Wetter für die nächsten 24 Stunden vorhersagen.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 5; -- Druidenkunst

UPDATE `spells` SET
    `description_de` = 'Du wählst einen Bereich aus Erde oder Stein, der in einen 1,5-m-Würfel passt. Du kannst die Erde zu schwierigem Gelände machen, ein Loch graben, Erdklumpen formen oder einfache Formen aus Erde erschaffen.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar oder 1 Stunde'
WHERE `id` = 6; -- Erde formen

UPDATE `spells` SET
    `description_de` = 'Du verursachst schmerzhaften Frost an einer Kreatur in Reichweite. Das Ziel muss einen KON-Rettungswurf bestehen oder 1W6 Kälteschaden erleiden und hat Nachteil auf den nächsten Waffenangriffswurf vor dem Ende deines nächsten Zuges.',
    `range_de` = '18 m',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 7; -- Erfrierung

UPDATE `spells` SET
    `description_de` = 'Eine flackernde Flamme erscheint in deiner Hand und bleibt für die Dauer dort. Die Flamme schadet weder dir noch deiner Ausrüstung. Sie strahlt helles Licht in einem Radius von 3 m und dämmriges Licht für weitere 3 m aus. Du kannst die Flamme als Aktion auf eine Kreatur innerhalb von 9 m werfen. Mache einen Fernkampf-Zauberangriff. Bei einem Treffer erleidet das Ziel 1W8 Feuerschaden.',
    `range_de` = 'Selbst',
    `duration_de` = '10 Minuten'
WHERE `id` = 8; -- Flammen erzeugen

UPDATE `spells` SET
    `description_de` = 'Du wählst ein nicht-magisches Feuer, das in einen 1,5-m-Würfel passt. Du beeinflusst das Feuer auf eine der folgenden Weisen: Du erweiterst oder verkleinerst das Feuer, änderst seine Farbe oder Helligkeit, formst einfache Formen.',
    `range_de` = '18 m',
    `duration_de` = 'Unmittelbar oder 1 Stunde'
WHERE `id` = 9; -- Flammen kontrollieren

UPDATE `spells` SET
    `description_de` = 'Du streckst deine Hand auf eine Kreatur aus, die du innerhalb der Reichweite sehen kannst, und projizierst einen Strahl giftigen Gases aus deiner Handfläche. Das Ziel muss einen KON-Rettungswurf bestehen oder 1W12 Giftschaden erleiden.',
    `range_de` = '3 m',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 10; -- Gift versprühen

UPDATE `spells` SET
    `description_de` = 'Du berührst eine willige Kreatur. Einmal vor Ende des Zaubers kann das Ziel einen W4 würfeln und das Ergebnis zu einem Attributswurf seiner Wahl addieren.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Minute'
WHERE `id` = 11; -- Göttliche Führung

UPDATE `spells` SET
    `description_de` = 'Du erschaffst ein Lagerfeuer am Boden an einem Punkt, den du in Reichweite sehen kannst. Bis der Zauber endet, erfüllt das Feuer einen Würfel von 1,5 m. Jede Kreatur, die ihren Zug in dem Feuer beginnt, muss einen GES-Rettungswurf bestehen oder 1W8 Feuerschaden erleiden.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute'
WHERE `id` = 12; -- Lagerfeuer erschaffen

UPDATE `spells` SET
    `description_de` = 'Du berührst ein bis drei Kieselsteine und verleihst ihnen Magie. Du oder jemand anderes kann einen Nahkampf-Zauberangriff mit einem der Steine machen, indem er ihn wirft oder mit einer Schleuder verschießt. Bei einem Treffer verursacht der Stein 1W6 + dein Zauberwirken-Attributmodifikator Wuchtschaden.',
    `range_de` = 'Berührung',
    `duration_de` = '1 Minute'
WHERE `id` = 13; -- Magiestein

UPDATE `spells` SET
    `description_de` = 'Du berührst eine willige Kreatur. Einmal vor Ende des Zaubers kann das Ziel einen W4 würfeln und das Ergebnis zu einem Rettungswurf seiner Wahl addieren.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Minute'
WHERE `id` = 14; -- Resistenz

UPDATE `spells` SET
    `description_de` = 'Das Holz eines Knüppels oder Stabes, den du hältst, wird mit der Kraft der Natur erfüllt. Für die Dauer des Zaubers kannst du deinen Zauberwirken-Attributmodifikator anstelle deines STÄ-Modifikators für Angriffs- und Schadenswürfe mit dieser Waffe verwenden, und der Schadenswürfel wird zu einem W8. Die Waffe wird magisch.',
    `range_de` = 'Berührung',
    `duration_de` = '1 Minute'
WHERE `id` = 15; -- Shillelagh

UPDATE `spells` SET
    `description_de` = 'Du entfesselst urtümliche Magie, die deine Zähne oder Fingernägel vorübergehend scharf und hart werden lässt. Mache einen Nahkampf-Zauberangriff gegen eine Kreatur in Reichweite. Bei einem Treffer erleidet das Ziel 1W10 Säureschaden.',
    `range_de` = 'Selbst',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 16; -- Urtümliche Wildheit

UPDATE `spells` SET
    `description_de` = 'Du wählst einen Bereich mit Wasser, der in einen 1,5-m-Würfel passt und den du in Reichweite sehen kannst. Du manipulierst das Wasser auf eine der folgenden Weisen: Du bewegst es, änderst seine Farbe oder Opazität, formst einfache Formen oder frierst es ein.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar oder 1 Stunde'
WHERE `id` = 17; -- Wasser formen

UPDATE `spells` SET
    `description_de` = 'Du erregst die Luft in einem 1,5-m-Würfel, ausgehend von dir. Jede Kreatur in diesem Bereich muss einen STÄ-Rettungswurf bestehen oder bis zu 1,5 m in eine Richtung gestoßen werden, die du wählst. Alternativ kannst du harmlose sensorische Effekte mit Wind erschaffen.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 18; -- Windbö

-- LEVEL 1 ZAUBER (Beispiele - du musst alle 153 ergänzen)

UPDATE `spells` SET
    `description_de` = 'Eine Donnerwelle geht von dir aus. Jede Kreatur in einem Würfel von 4,5 m Kantenlänge, der von dir ausgeht, muss einen KON-Rettungswurf bestehen oder 2W8 Schallschaden erleiden und 3 m von dir weggestoßen werden. Bei einem erfolgreichen Rettungswurf erleidet die Kreatur den halben Schaden und wird nicht weggestoßen.',
    `range_de` = 'Selbst (Würfel von 4,5 m)',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 19; -- Donnerwoge

UPDATE `spells` SET
    `description_de` = 'Du erschaffst eine Scherbe aus scharfem Eis und schießt sie auf eine Kreatur in Reichweite. Mache einen Fernkampf-Zauberangriff. Bei einem Treffer erleidet das Ziel 1W10 Stichschaden. Treffer oder Fehltreffer: Die Scherbe explodiert dann. Das Ziel und alle Kreaturen innerhalb von 1,5 m müssen einen GES-Rettungswurf bestehen oder 2W6 Kälteschaden erleiden.',
    `range_de` = '18 m',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 20; -- Eismesser

UPDATE `spells` SET
    `description_de` = 'Du mit Tieren sprechen für die Dauer des Zaubers. Du kannst einfache Ideen mit Tieren kommunizieren, obwohl sie möglicherweise nicht intelligent genug sind, um komplexe Konzepte zu verstehen.',
    `range_de` = 'Selbst',
    `duration_de` = '10 Minuten'
WHERE `id` = 30; -- Mit Tieren sprechen

UPDATE `spells` SET
    `description_de` = 'Du heilst die Wunden einer Kreatur, die du berührst. Die Kreatur erhält 1W8 + dein Zauberwirken-Attributmodifikator Trefferpunkte zurück. Dieser Zauber hat keine Wirkung auf Untote oder Konstrukte.',
    `range_de` = 'Berührung',
    `duration_de` = 'Unmittelbar'
WHERE `id` = 39; -- Wunden heilen

-- HINWEIS: Füge hier die restlichen 135 Zauberbeschreibungen hinzu
-- Kopiere die vollständigen deutschen Texte aus dem Spielerhandbuch

-- Die Beschreibungen sollten folgende Informationen enthalten:
-- 1. Wirkungsbeschreibung
-- 2. Rettungswurf (falls vorhanden)
-- 3. Schaden/Heilung mit Würfeln
-- 4. Auf höheren Stufen (falls relevant)
-- 5. Besondere Bedingungen oder Einschränkungen
