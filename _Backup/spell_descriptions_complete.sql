-- Vollständige deutsche Zauberbeschreibungen für alle 153 Druiden-Zauber
-- MIT SCHADENSWERTEN UND MECHANIKEN
-- Führe zuerst update_spells_add_descriptions.sql aus!

-- ============================================
-- ZAUBERTRICKS (LEVEL 0) - 18 Zauber
-- ============================================

UPDATE `spells` SET
    `description_de` = 'Du reparierst einen einzelnen Riss oder Bruch an einem Gegenstand, den du berührst, wie eine zerbrochene Kette, zwei Hälften eines gebrochenen Schlüssels, einen gerissenen Umhang oder einen undichten Weinschlauch. Solange der Riss oder Bruch nicht länger als 30 cm ist, fügst du ihn wieder zusammen. Dieser Zauber kann einen magischen Gegenstand oder ein Konstrukt physisch reparieren, stellt aber keine Magie wieder her.',
    `range_de` = 'Berührung',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 1; -- Ausbessern (Mending)

UPDATE `spells` SET
    `description_de` = 'Du beschwörst beißende, stechende Insekten, die eine Kreatur innerhalb der Reichweite plagen. Das Ziel muss einen Konstitutionsrettungswurf bestehen oder **1W6 Giftschaden** erleiden und sich 1,5 m in eine zufällige Richtung bewegen, falls es sich bewegen kann. Würfle einen W4 für die Richtung: 1 = Norden, 2 = Osten, 3 = Süden, 4 = Westen. Diese Bewegung provoziert keine Gelegenheitsangriffe. **Auf höheren Stufen:** Der Schaden erhöht sich um 1W6 auf Stufe 5 (2W6), Stufe 11 (3W6) und Stufe 17 (4W6).',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Beschwörung'
WHERE `id` = 2; -- Befall (Infestation)

UPDATE `spells` SET
    `description_de` = 'Du erzeugst einen donnernden Knall, der in einem Umkreis von 1,5 m um dich herum zu hören ist. Alle Kreaturen außer dir in diesem Bereich müssen einen Konstitutionsrettungswurf bestehen oder **1W6 Schallschaden** erleiden. **Auf höheren Stufen:** Der Schaden erhöht sich um 1W6 auf Stufe 5 (2W6), Stufe 11 (3W6) und Stufe 17 (4W6).',
    `range_de` = '1,5 m Radius',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Hervorrufung'
WHERE `id` = 3; -- Donnerschlag (Thunderclap)

UPDATE `spells` SET
    `description_de` = 'Du erschaffst eine lange, peitschen

artige Ranke voller Dornen, die nach deinem Befehl eine Kreatur in Reichweite angreift. Mache einen Nahkampf-Zauberangriff gegen das Ziel. Bei einem Treffer erleidet die Kreatur **1W6 Stichschaden**, und wenn sie von Größe Groß oder kleiner ist, ziehst du sie bis zu 3 m näher zu dir heran. **Auf höheren Stufen:** Der Schaden erhöht sich um 1W6 auf Stufe 5 (2W6), Stufe 11 (3W6) und Stufe 17 (4W6).',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 4; -- Dornenpeitsche (Thorn Whip)

UPDATE `spells` SET
    `description_de` = 'Du wirkst einen geringfügigen Wundereffekt der Natur innerhalb der Reichweite. Du kannst einen harmlosen sensorischen Wettereffekt wie fallende Blätter oder eine Windbö erschaffen, eine Blume zum Blühen oder Samen zum Keimen bringen, eine Kerzenflamme oder ein kleines Feuer unmittelbar zum Flackern, Hellwerden, Dunklerwerden oder Erlöschen bringen, oder das Wetter für die nächsten 24 Stunden am aktuellen Ort vorhersagen.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 5; -- Druidenkunst (Druidcraft)

UPDATE `spells` SET
    `description_de` = 'Du wählst einen Bereich aus Erde oder Stein, den du sehen kannst und der in einen 1,5-m-Würfel passt. Du manipulierst ihn auf eine der folgenden Weisen: Du machst das Gelände im Bereich zu schwierigem Gelände oder normalem Gelände (falls es bereits schwierig ist); Du gräbst ein Loch und Erde wird neben das Loch geschoben; Du formst die Erde zu groben Formen. Veränderungen halten entweder 1 Stunde lang an oder sind dauerhaft, wenn du dich für die Dauer auf den Zauber konzentrierst.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar oder 1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 6; -- Erde formen (Mold Earth)

UPDATE `spells` SET
    `description_de` = 'Du verursachst schmerzhaften Frost an einer Kreatur innerhalb der Reichweite, die du sehen kannst. Das Ziel muss einen Konstitutionsrettungswurf bestehen oder **1W6 Kälteschaden** erleiden und hat Nachteil auf den nächsten Waffenangriffswurf, den es vor dem Ende seines nächsten Zuges macht. **Auf höheren Stufen:** Der Schaden erhöht sich um 1W6 auf Stufe 5 (2W6), Stufe 11 (3W6) und Stufe 17 (4W6).',
    `range_de` = '18 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Hervorrufung'
WHERE `id` = 7; -- Erfrierung (Frostbite)

UPDATE `spells` SET
    `description_de` = 'Eine flackernde Flamme erscheint in deiner Hand. Sie bleibt dort für die Dauer und schadet weder dir noch deiner Ausrüstung. Die Flamme strahlt helles Licht in einem Radius von 3 m und dämmriges Licht für weitere 3 m aus. Der Zauber endet, wenn du ihn als Aktion beendest oder den Zauber erneut wirkst. Du kannst die Flamme auch als Aktion auf eine Kreatur innerhalb von 9 m werfen. Mache einen Fernkampf-Zauberangriff. Bei einem Treffer erleidet das Ziel **1W8 Feuerschaden**. **Auf höheren Stufen:** Der Schaden erhöht sich um 1W8 auf Stufe 5 (2W8), Stufe 11 (3W8) und Stufe 17 (4W8).',
    `range_de` = 'Selbst',
    `duration_de` = '10 Minuten',
    `school_de` = 'Beschwörung'
WHERE `id` = 8; -- Flammen erzeugen (Produce Flame)

UPDATE `spells` SET
    `description_de` = 'Du wählst ein nicht-magisches Feuer, das du sehen kannst und das in einen 1,5-m-Würfel passt. Du beeinflusst das Feuer auf eine der folgenden Weisen: Du vergrößerst oder verkleinerst das Feuer um bis zu 1,5 m; Du formst das Feuer in einfache Formen (Mauern, Schächte, Säulen); Du veränderst die Farbe oder Helligkeit; Veränderungen halten entweder 1 Stunde an oder sind dauerhaft bei Konzentration.',
    `range_de` = '18 m',
    `duration_de` = 'Unmittelbar oder 1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 9; -- Flammen kontrollieren (Control Flames)

UPDATE `spells` SET
    `description_de` = 'Du streckst deine Hand auf eine Kreatur aus, die du innerhalb der Reichweite sehen kannst, und projizierst einen Strahl giftigen Gases aus deiner Handfläche. Die Kreatur muss einen Konstitutionsrettungswurf bestehen oder **1W12 Giftschaden** erleiden. **Auf höheren Stufen:** Der Schaden erhöht sich um 1W12 auf Stufe 5 (2W12), Stufe 11 (3W12) und Stufe 17 (4W12).',
    `range_de` = '3 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Beschwörung'
WHERE `id` = 10; -- Gift versprühen (Poison Spray)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine willige Kreatur. Einmal vor Ende des Zaubers kann das Ziel einen W4 würfeln und das Ergebnis zu einem Attributswurf seiner Wahl addieren. Es kann diesen Wurf vor oder nach dem Attributswurf machen, aber bevor die Auswirkungen des Wurfs bekannt werden.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 11; -- Göttliche Führung (Guidance)

UPDATE `spells` SET
    `description_de` = 'Du erschaffst ein Lagerfeuer auf einem festen Untergrund an einem Punkt, den du in Reichweite sehen kannst. Bis der Zauber endet, füllt das magische Feuer einen Würfel von 1,5 m. Jede Kreatur, die ihren Zug im Feuer beginnt oder das Feuer zum ersten Mal in einem Zug betritt, muss einen Geschicklichkeitsrettungswurf bestehen oder **1W8 Feuerschaden** erleiden. **Auf höheren Stufen:** Der Schaden erhöht sich um 1W8 auf Stufe 5 (2W8), Stufe 11 (3W8) und Stufe 17 (4W8).',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Beschwörung'
WHERE `id` = 12; -- Lagerfeuer erschaffen (Create Bonfire)

UPDATE `spells` SET
    `description_de` = 'Du berührst ein bis drei Kieselsteine und verleihst ihnen Magie. Du oder jemand anderes kann mit einem der Steine einen Fernkampf-Zauberangriff machen, indem er ihn wirft oder mit einer Schleuder verschießt (normale Reichweite 18 m, maximale Reichweite 36 m). Bei einem Treffer verursacht der Stein **1W6 + dein Zauberwirken-Attributmodifikator Wuchtschaden** und der Zauber endet für diesen Stein. Danach wird er zu einem normalen Stein.',
    `range_de` = 'Berührung',
    `duration_de` = '1 Minute',
    `school_de` = 'Verwandlung'
WHERE `id` = 13; -- Magiestein (Magic Stone)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine willige Kreatur. Einmal vor Ende des Zaubers kann das Ziel einen W4 würfeln und das Ergebnis zu einem Rettungswurf seiner Wahl addieren. Es kann diesen Wurf vor oder nach dem Rettungswurf machen, aber bevor die Auswirkungen bekannt werden.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Bannzauber'
WHERE `id` = 14; -- Resistenz (Resistance)

UPDATE `spells` SET
    `description_de` = 'Das Holz eines Knüppels oder Stabes, den du hältst, wird mit der Kraft der Natur erfüllt. Für die Dauer des Zaubers kannst du deinen Zauberwirken-Attributmodifikator anstelle deines Stärke-Modifikators für Angriffs- und Schadenswürfe mit Nahkampfangriffen verwenden, die du mit dieser Waffe machst, und der Schadenswürfel der Waffe wird ein **W8**. Die Waffe wird außerdem magisch, falls sie es nicht bereits war. Der Zauber endet, wenn du ihn erneut wirkst oder die Waffe fallen lässt.',
    `range_de` = 'Berührung',
    `duration_de` = '1 Minute',
    `school_de` = 'Verwandlung'
WHERE `id` = 15; -- Shillelagh

UPDATE `spells` SET
    `description_de` = 'Du entfesselst urtümliche Magie, die deine Zähne oder Fingernägel vorübergehend scharf wie Rasiermesser werden lässt. Mache einen Nahkampf-Zauberangriff gegen eine Kreatur innerhalb von 1,5 m Entfernung von dir. Bei einem Treffer erleidet das Ziel **1W10 Säureschaden**. Nach dem Angriff kehren deine Waffen zur Normalität zurück. **Auf höheren Stufen:** Der Schaden erhöht sich um 1W10 auf Stufe 5 (2W10), Stufe 11 (3W10) und Stufe 17 (4W10).',
    `range_de` = 'Selbst',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 16; -- Urtümliche Wildheit (Primal Savagery)

UPDATE `spells` SET
    `description_de` = 'Du wählst einen Bereich mit Wasser, den du sehen kannst und der in einen 1,5-m-Würfel passt, innerhalb der Reichweite. Du manipulierst das Wasser auf eine der folgenden Weisen: Du bewegst das Wasser bis zu 1,5 m in jede Richtung; Du veränderst die Farbe oder Opazität des Wassers; Du formst das Wasser zu einfachen Formen; Du frierst das Wasser ein, vorausgesetzt es befindet sich keine Kreatur darin. Veränderungen halten entweder 1 Stunde an oder sind dauerhaft bei Konzentration.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar oder 1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 17; -- Wasser formen (Shape Water)

UPDATE `spells` SET
    `description_de` = 'Du erregst die Luft in einem 1,5-m-Würfel, ausgehend von dir. Jede Kreatur in diesem Bereich muss einen Stärkerettungswurf bestehen, oder sie wird bis zu 1,5 m von dir weggestoßen. Alternativ kannst du harmlose sensorische Effekte mit Wind erschaffen.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 18; -- Windbö (Gust)

-- ============================================
-- LEVEL 1 ZAUBER - 21 Zauber
-- ============================================

UPDATE `spells` SET
    `description_de` = 'Eine Donnerwelle geht von dir aus. Jede Kreatur in einem Würfel von 4,5 m Kantenlänge, der von dir ausgeht, muss einen Konstitutionsrettungswurf bestehen oder **2W8 Schallschaden** erleiden und 3 m von dir weggestoßen werden. Bei einem erfolgreichen Rettungswurf erleidet die Kreatur den halben Schaden und wird nicht weggestoßen. Zudem werden ungesicherte Gegenstände, die sich vollständig im Bereich befinden, automatisch 3 m vom Zauber wegbewegt, und der Zauber erzeugt einen donnernden Knall, der bis zu 90 m weit hörbar ist. **Auf höheren Stufen:** +1W8 Schaden pro Zaubergrad über 1.',
    `range_de` = 'Selbst (Würfel 4,5 m)',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Hervorrufung'
WHERE `id` = 19; -- Donnerwoge (Thunderwave)

UPDATE `spells` SET
    `description_de` = 'Du erschaffst eine Scherbe aus scharfem Eis und schießt sie auf eine Kreatur in Reichweite. Mache einen Fernkampf-Zauberangriff gegen das Ziel. Bei einem Treffer erleidet es **1W10 Stichschaden**. Treffer oder Fehltreffer: Die Scherbe explodiert dann. Das Ziel und alle Kreaturen innerhalb von 1,5 m vom Aufschlagpunkt müssen einen Geschicklichkeitsrettungswurf bestehen oder **2W6 Kälteschaden** erleiden. **Auf höheren Stufen:** +1W6 Kälteschaden pro Zaubergrad über 1.',
    `range_de` = '18 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Beschwörung'
WHERE `id` = 20; -- Eismesser (Ice Knife)

UPDATE `spells` SET
    `description_de` = 'Der Zauber fängt einen Teil der eingehenden Energie ab und reduziert ihre Wirkung auf dich, während er dich für deinen nächsten Nahkampfangriff auflädt. Du erhältst Resistenz gegen den auslösenden Schadenstyp bis zum Beginn deines nächsten Zuges. Außerdem verursacht das erste Mal, wenn du mit einem Nahkampfangriff in deinem nächsten Zug triffst, **zusätzlich 1W6 Schaden** des auslösenden Typs, und der Zauber endet. **Auf höheren Stufen:** +1W6 zusätzlicher Schaden pro Zaubergrad über 1.',
    `range_de` = 'Selbst',
    `duration_de` = '1 Runde',
    `school_de` = 'Bannzauber'
WHERE `id` = 21; -- Elemente absorbieren (Absorb Elements)

UPDATE `spells` SET
    `description_de` = 'Du verursachst ein lokal begrenztes Erdbeben auf festem Boden in einem Radius von 3 m um dich herum. Jede Kreatur außer dir in diesem Bereich muss einen Geschicklichkeitsrettungswurf bestehen oder **1W6 Wuchtschaden** erleiden und niedergeworfen werden. Falls der Boden locker ist (Erde, Sand), wird er zu schwierigem Gelände, bis jemand eine Aktion aufwendet, um ihn zu ebnen. **Auf höheren Stufen:** +1W6 Schaden pro Zaubergrad über 1.',
    `range_de` = 'Selbst (Radius 3 m)',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Hervorrufung'
WHERE `id` = 22; -- Erdrütteln (Earth Tremor)

UPDATE `spells` SET
    `description_de` = 'Während du diesen Zauber wirkst, benutzt du 7,5 m Seil, um einen Kreis mit einem Radius von 1,5 m auf dem Boden oder Fußboden zu legen. Wenn du fertig bist, wird das Seil unsichtbar und der Kreis wird zu einer magischen Falle. Die Falle ist fast unmöglich zu sehen ohne Magie. Eine Kreatur, die in den Bereich eintritt, muss einen Geschicklichkeitsrettungswurf bestehen oder wird magisch an die Stelle gefesselt, bis der Zauber endet. Eine gefesselte Kreatur kann eine Aktion aufwenden, um einen Stärke- oder Geschicklichkeitswurf gegen deinen Zauberrettungswurf-SG zu machen. Bei Erfolg ist sie nicht länger gefesselt.',
    `range_de` = 'Berührung',
    `duration_de` = '8 Stunden',
    `school_de` = 'Bannzauber'
WHERE `id` = 23; -- Fangschlinge (Snare)

UPDATE `spells` SET
    `description_de` = 'Jedes Objekt in einem Würfel von 6 m Kantenlänge innerhalb der Reichweite wird in blaues, grünes oder violettes Licht gehüllt (du wählst die Farbe). Jede Kreatur in diesem Bereich, wenn der Zauber gewirkt wird, wird ebenfalls in Licht gehüllt, falls sie einen Geschicklichkeitsrettungswurf nicht besteht. Für die Dauer strahlen Objekte und betroffene Kreaturen dämmriges Licht in einem Radius von 3 m aus. Alle Angriffswürfe gegen betroffene Kreaturen oder Objekte haben Vorteil, falls der Angreifer sie sehen kann. Betroffene Kreaturen oder Objekte können nicht vom Unsichtbar-Zustand profitieren.',
    `range_de` = '18 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Hervorrufung'
WHERE `id` = 24; -- Feenfeuer (Faerie Fire)

UPDATE `spells` SET
    `description_de` = 'Für die Dauer kannst du die Anwesenheit und Art von Giften, giftigen Kreaturen und Krankheiten innerhalb von 9 m Entfernung von dir wahrnehmen. Du identifizierst auch die Art des Gifts, der giftigen Kreatur oder der Krankheit. Der Zauber durchdringt die meisten Barrieren, wird aber blockiert von 30 cm Stein, 2,5 cm gewöhnlichem Metall, einer dünnen Bleischicht oder 90 cm Holz oder Erde.',
    `range_de` = 'Selbst',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 25; -- Gift und Krankheit entdecken (Detect Poison and Disease)

UPDATE `spells` SET
    `description_de` = 'Bis zu zehn Beeren erscheinen in deiner Hand und sind für die Dauer mit Magie erfüllt. Eine Kreatur kann als Aktion eine Beere essen. Das Essen einer Beere stellt **1 Trefferpunkt** wieder her, und die Beere liefert genug Nahrung, um eine Kreatur für einen Tag zu versorgen. Die Beeren verlieren ihre Wirkung, wenn sie nicht innerhalb von 24 Stunden nach dem Wirken dieses Zaubers verzehrt wurden.',
    `range_de` = 'Berührung',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 26; -- Gute Beeren (Goodberry)

UPDATE `spells` SET
    `description_de` = 'Eine Kreatur deiner Wahl, die du in Reichweite sehen kannst, erhält Trefferpunkte in Höhe von **1W4 + dein Zauberwirken-Attributmodifikator** zurück. Dieser Zauber hat keine Wirkung auf Untote oder Konstrukte. **Auf höheren Stufen:** Die Heilung erhöht sich um 1W4 pro Zaubergrad über 1.',
    `range_de` = '18 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Hervorrufung'
WHERE `id` = 27; -- Heilendes Wort (Healing Word)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine Kreatur. Die Bewegungsrate des Ziels erhöht sich für die Dauer um 3 m. **Auf höheren Stufen:** Du kannst mit einem Zauberplatz des 2. Grades oder höher eine zusätzliche Kreatur pro Grad über dem 1. als Ziel wählen.',
    `range_de` = 'Berührung',
    `duration_de` = '1 Stunde',
    `school_de` = 'Verwandlung'
WHERE `id` = 28; -- Lange Schritte (Longstrider)

UPDATE `spells` SET
    `description_de` = 'Für die Dauer spürst du die Anwesenheit von Magie im Umkreis von 9 m. Falls du Magie auf diese Weise spürst, kannst du deine Aktion einsetzen, um eine schwache Aura um jede sichtbare Kreatur oder jeden Gegenstand im Bereich, der von Magie erfüllt ist, wahrzunehmen und die Schule der Magie zu erfahren. Der Zauber kann die meisten Barrieren durchdringen, wird aber blockiert von 30 cm Stein, 2,5 cm gewöhnlichem Metall, einer dünnen Bleischicht oder 90 cm Holz oder Erde.',
    `range_de` = 'Selbst',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 29; -- Magie entdecken (Detect Magic)

UPDATE `spells` SET
    `description_de` = 'Du erhältst für die Dauer die Fähigkeit, mit Tieren zu kommunizieren und zu verstehen. Das Wissen und Bewusstsein vieler Tiere ist durch ihre Intelligenz begrenzt, aber sie können dir zumindest Informationen über nahegelegene Orte und Monster geben, einschließlich allem, was sie in den letzten 24 Stunden wahrnehmen konnten.',
    `range_de` = 'Selbst',
    `duration_de` = '10 Minuten',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 30; -- Mit Tieren sprechen (Speak with Animals)

UPDATE `spells` SET
    `description_de` = 'Alle nicht-magischen Nahrungsmittel und Getränke in einer Sphäre mit 1,5 m Radius, zentriert auf einem Punkt deiner Wahl innerhalb der Reichweite, werden gereinigt und von Giften und Krankheiten befreit.',
    `range_de` = '3 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 31; -- Nahrung und Wasser reinigen (Purify Food and Drink)

UPDATE `spells` SET
    `description_de` = 'Du erschaffst eine Sphäre aus Nebel mit einem Radius von 6 m, zentriert auf einem Punkt innerhalb der Reichweite. Die Sphäre breitet sich um Ecken herum aus, und ihr Bereich ist stark verschleiert. Sie hält für die Dauer an oder bis ein starker Wind (mindestens 30 km/h) sie zerstreut. **Auf höheren Stufen:** Der Radius erhöht sich um 6 m pro Zaubergrad über 1.',
    `range_de` = '36 m',
    `duration_de` = 'Konzentration, bis zu 1 Stunde',
    `school_de` = 'Beschwörung'
WHERE `id` = 32; -- Nebelwolke (Fog Cloud)

UPDATE `spells` SET
    `description_de` = 'Du versuchst, einen Humanoiden, den du in Reichweite sehen kannst, zu bezaubern. Er muss einen Weisheitsrettungswurf bestehen, und er macht dies mit Vorteil, falls du oder deine Gefährten ihn bekämpfen. Falls er den Rettungswurf nicht besteht, ist er von dir bezaubert, bis der Zauber endet oder bis du oder deine Gefährten ihm etwas Schädliches antun. Die bezauberte Kreatur betrachtet dich als freundlichen Bekannten. Wenn der Zauber endet, weiß die Kreatur, dass sie von dir bezaubert wurde. **Auf höheren Stufen:** Du kannst eine zusätzliche Kreatur pro Zaubergrad über 1 als Ziel wählen.',
    `range_de` = '9 m',
    `duration_de` = '1 Stunde',
    `school_de` = 'Verzauberung'
WHERE `id` = 33; -- Person bezaubern (Charm Person)

UPDATE `spells` SET
    `description_de` = 'Du berührst eine Kreatur. Die Sprungweite der Kreatur verdreifacht sich, bis der Zauber endet.',
    `range_de` = 'Berührung',
    `duration_de` = '1 Minute',
    `school_de` = 'Verwandlung'
WHERE `id` = 34; -- Springen (Jump)

UPDATE `spells` SET
    `description_de` = 'Du etablierst eine telepathische Verbindung mit einer Bestie, die du berührst, die freundlich dir gegenüber ist oder von dir bezaubert wurde. Der Zauber schlägt fehl, falls die Intelligenz der Bestie 4 oder höher ist. Bis der Zauber endet, ist die Verbindung aktiv, während du und die Bestie euch in Sichtweite voneinander befindet. Durch die Verbindung kann die Bestie deine telepathischen Nachrichten verstehen, und sie kann telepathisch einfache Emotionen und Konzepte an dich zurücksenden. Während die Verbindung aktiv ist, hat die Bestie Vorteil auf Angriffswürfe gegen jede Kreatur, die du sehen kannst und die sich innerhalb von 1,5 m von dir befindet.',
    `range_de` = 'Berührung',
    `duration_de` = 'Konzentration, bis zu 10 Minuten',
    `school_de` = 'Erkenntniszauber'
WHERE `id` = 35; -- Tierbindung (Beast Bond)

UPDATE `spells` SET
    `description_de` = 'Dieser Zauber lässt dich ein Tier davon überzeugen, dass du ihm keinen Schaden zufügen willst. Wähle eine Bestie, die du in Reichweite sehen kannst. Sie muss dich sehen und hören. Falls die Intelligenz der Bestie 4 oder höher ist, schlägt der Zauber fehl. Andernfalls muss die Bestie einen Weisheitsrettungswurf bestehen oder wird von dir für die Dauer des Zaubers bezaubert. Falls du oder einer deiner Gefährten die Bestie verletzt, endet der Zauber. **Auf höheren Stufen:** Du kannst eine zusätzliche Bestie pro Zaubergrad über 1 als Ziel wählen.',
    `range_de` = '9 m',
    `duration_de` = '24 Stunden',
    `school_de` = 'Verzauberung'
WHERE `id` = 36; -- Tierfreundschaft (Animal Friendship)

UPDATE `spells` SET
    `description_de` = 'Wuchernde Pflanzen und Ranken sprießen aus dem Boden in einem Quadrat von 6 m Seitenlänge, zentriert auf einem Punkt innerhalb der Reichweite. Für die Dauer werden diese Pflanzen den Boden im Bereich zu schwierigem Gelände machen. Eine Kreatur im Bereich, wenn du den Zauber wirkst, muss einen Stärkerettungswurf bestehen oder wird von den verschlungenen Pflanzen festgehalten, bis der Zauber endet. Eine festgehaltene Kreatur kann ihre Aktion einsetzen, um einen Stärkerettungswurf gegen deinen Zauberrettungswurf-SG zu machen. Bei Erfolg befreit sie sich. Wenn der Zauber endet, verwelken die beschworenen Pflanzen.',
    `range_de` = '27 m',
    `duration_de` = 'Konzentration, bis zu 1 Minute',
    `school_de` = 'Beschwörung'
WHERE `id` = 37; -- Verstricken (Entangle)

UPDATE `spells` SET
    `description_de` = 'Du erschaffst oder zerstörst Wasser. **Wasser erschaffen:** Du erschaffst bis zu 40 Liter sauberes Wasser innerhalb der Reichweite in einem offenen Behälter. Alternativ fällt das Wasser als Regen in einem Würfel von 9 m Kantenlänge, innerhalb der Reichweite, und löscht offene Flammen im Bereich. **Wasser zerstören:** Du zerstörst bis zu 40 Liter Wasser in einem offenen Behälter innerhalb der Reichweite. Alternativ zerstörst du Nebel in einem Würfel von 9 m Kantenlänge innerhalb der Reichweite. **Auf höheren Stufen:** Du erschaffst oder zerstörst zusätzlich 40 Liter Wasser oder die Würfelgröße erhöht sich um 1,5 m pro Zaubergrad über 1.',
    `range_de` = '9 m',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Verwandlung'
WHERE `id` = 38; -- Wasser erschaffen oder zerstören (Create or Destroy Water)

UPDATE `spells` SET
    `description_de` = 'Eine Kreatur, die du berührst, erhält **1W8 + dein Zauberwirken-Attributmodifikator** Trefferpunkte zurück. Dieser Zauber hat keine Wirkung auf Untote oder Konstrukte. **Auf höheren Stufen:** Die Heilung erhöht sich um 1W8 pro Zaubergrad über 1.',
    `range_de` = 'Berührung',
    `duration_de` = 'Unmittelbar',
    `school_de` = 'Hervorrufung'
WHERE `id` = 39; -- Wunden heilen (Cure Wounds)

-- ============================================
-- LEVEL 2 ZAUBER - 24 Zauber (Fortsetzung folgt...)
-- ============================================

-- Ich erstelle jetzt die restlichen Zauber. Aufgrund der Länge mache ich mehrere Teile...
