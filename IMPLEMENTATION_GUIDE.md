# Multi-Klassen D&D Webapp - Implementierungsanleitung

## 📋 Überblick

Diese Anleitung beschreibt die Erweiterung der Druiden-Webapp für alle 5 Spielerklassen:
1. **Druide** (bereits vorhanden) ✅
2. **Schurke** (Rogue) mit Piraten-Hintergrund 🏴‍☠️
3. **Barde** (Bard) 🎵
4. **Magier** (Wizard) 🔮
5. **Paladin** (Paladin) ⚔️

## 🗄️ Datenbank-Struktur

### 1. Migration ausführen

```bash
# In MySQL/MariaDB importieren:
mysql -u root -p dnd < migrations/01_multi_class_system.sql
mysql -u root -p dnd < migrations/02_equipment_database.sql
mysql -u root -p dnd < migrations/03_backgrounds.sql
mysql -u root -p dnd < beast_shapes_migration.sql
```

### 2. Neue Tabellen

- **class_resources**: Klassenspezifische Ressourcen (Sneak Attack, Bardic Inspiration, Spell Slots, etc.)
- **class_features**: Alle Klassenfähigkeiten mit deutschen Beschreibungen
- **backgrounds**: Hintergründe mit Fähigkeiten und Ausrüstung
- **equipment**: Erweitert mit hunderten Items

## 🎭 Klassen-Übersicht

### Druide (Circle of the Moon) ✅
- **Hauptattribut**: Weisheit
- **Rettungswürfe**: Intelligenz, Weisheit
- **Fertigkeiten**: 2 aus Arkane Kunde, Naturkunde, Religion, Heilkunde, Wahrnehmung, Überlebenskunst, Tierführung, Motiv erkennen
- **Besonderheit**: Wild Shape, Zauber bis Stufe 9
- **Status**: VOLLSTÄNDIG IMPLEMENTIERT

### Schurke (Pirate Background) 🏴‍☠️
- **Hauptattribut**: Geschicklichkeit
- **Rettungswürfe**: Geschicklichkeit, Intelligenz
- **Fertigkeiten**: 4 aus Akrobatik, Athletik, Täuschung, Motiv erkennen, Einschüchtern, Nachforschung, Wahrnehmung, Auftreten, Überzeugen, Fingerfertigkeit, Heimlichkeit
- **Besonderheit**: Sneak Attack, Cunning Action, Evasion
- **Expertise**: Doppelter Übungsbonus auf 2 (später 4) Fertigkeiten

### Barde 🎵
- **Hauptattribut**: Charisma
- **Rettungswürfe**: Geschicklichkeit, Charisma
- **Fertigkeiten**: 3 beliebige
- **Besonderheit**: Bardic Inspiration, Jack of All Trades, Zauber bis Stufe 9
- **Spezial**: Kann Zauber von ALLEN Klassen lernen (Magical Secrets)

### Magier 🔮
- **Hauptattribut**: Intelligenz
- **Rettungswürfe**: Intelligenz, Weisheit
- **Fertigkeiten**: 2 aus Arkane Kunde, Geschichte, Motiv erkennen, Nachforschung, Heilkunde, Religion
- **Besonderheit**: Zauberbuch, Ritual Casting, Arcane Recovery, Zauber bis Stufe 9
- **Spezial**: Größte Zauberliste, kann Zauber ins Zauberbuch schreiben

### Paladin ⚔️
- **Hauptattribut**: Stärke und Charisma
- **Rettungswürfe**: Weisheit, Charisma
- **Fertigkeiten**: 2 aus Athletik, Motiv erkennen, Einschüchtern, Heilkunde, Überzeugen, Religion
- **Besonderheit**: Lay on Hands, Divine Smite, Aura of Protection, Zauber bis Stufe 5
- **Spezial**: Kombination aus Kämpfer und Zauberw irker

## 📁 Dateistruktur

```
dnd/
├── index.html (Klassenauswahl)
├── character-creation.html (Charaktererstellungs-Wizard)
├── dashboard.html (Druide - bereits vorhanden)
├── dashboard-rogue.html (Schurke)
├── dashboard-bard.html (Barde)
├── dashboard-wizard.html (Magier)
├── dashboard-paladin.html (Paladin)
├── equipment.html (Ausrüstungsbrowser - erweitert)
├── spells.html (Zauberverwaltung - erweitert)
├── character.html (Charaktereditor - erweitert)
├── db_actions.php (API - erweitert)
├── migrations/
│   ├── 01_multi_class_system.sql
│   ├── 02_equipment_database.sql
│   ├── 03_backgrounds.sql
│   ├── 04_rogue_features.sql
│   ├── 05_bard_features.sql
│   ├── 06_wizard_features.sql
│   ├── 07_paladin_features.sql
│   ├── 08_spells_all_classes.sql
│   └── beast_shapes_migration.sql
└── ConfigFile/
    └── dbconfig.php
```

## 🎯 Implementierungs-Prioritäten

### Phase 1: Basis-Infrastruktur ✅
- [x] Datenbank-Schema erweitern
- [x] Ausrüstungsdatenbank
- [x] Hintergründe-Datenbank

### Phase 2: Klassenauswahl & Charaktererstellung
- [ ] index.html: Klassenauswahl-Screen
- [ ] character-creation.html: Wizard für neue Charaktere
- [ ] Charakterprüfung: Beim Dashboard-Laden prüfen ob Charakter existiert

### Phase 3: Klassen-Dashboards
- [ ] Schurken-Dashboard (Priorität 1)
- [ ] Barden-Dashboard
- [ ] Magier-Dashboard
- [ ] Paladin-Dashboard

### Phase 4: Features & Polish
- [ ] Equipment-Browser mit Suchfunktion
- [ ] Klassenspezifische Ressourcen-Tracking
- [ ] Levelup-System
- [ ] Spellbook für Magier

## 🔧 Technische Details

### API-Endpunkte (db_actions.php)

Neue Endpunkte hinzufügen:
- `GET /class_features?class=rogue&level=1`
- `GET /backgrounds`
- `GET /equipment/search?query=sword&category=weapon`
- `POST /create_character` (erweitert für alle Klassen)
- `GET /class_resources?char_id=1`
- `POST /use_resource` (z.B. Bardic Inspiration verbrauchen)

### Datenstruktur Beispiel: Schurke

```javascript
{
  "class": "rogue",
  "level": 3,
  "subclass": "swashbuckler", // Piratenthema
  "background": "pirate",
  "resources": {
    "sneak_attack": "2d6",
    "cunning_action": true
  },
  "expertise": ["stealth", "sleight_of_hand"],
  "proficiencies": {
    "armor": ["light"],
    "weapons": ["simple", "hand_crossbow", "longsword", "rapier", "shortsword"],
    "tools": ["thieves_tools", "navigators_tools", "vehicles_water"],
    "saves": ["dexterity", "intelligence"],
    "skills": ["acrobatics", "athletics", "perception", "stealth"]
  }
}
```

## 🎨 UI-Komponenten

### Klassenspezifische Farben

```css
/* Druide */
--druid-primary: #2d5016;
--druid-secondary: #66bb6a;

/* Schurke */
--rogue-primary: #1a1a2e;
--rogue-secondary: #c8102e;

/* Barde */
--bard-primary: #6a1b9a;
--bard-secondary: #ab47bc;

/* Magier */
--wizard-primary: #0d47a1;
--wizard-secondary: #42a5f5;

/* Paladin */
--paladin-primary: #f57c00;
--paladin-secondary: #ffd54f;
```

### Ressourcen-Tracking Komponente

Beispiel für Bardic Inspiration (wiederverwenden für alle Klassen):

```html
<div class="resource-tracker">
  <h3>Bardic Inspiration</h3>
  <div class="resource-dice">1d8</div>
  <div class="resource-uses">
    <div class="use-circle"></div>
    <div class="use-circle"></div>
    <div class="use-circle used"></div>
  </div>
  <div class="resource-recovery">Wiederherstellung: Kurze Rast</div>
</div>
```

## 📊 Klassenfähigkeiten-Struktur

### Beispiel: Schurke Stufe 1-3

| Stufe | Fähigkeit | Beschreibung |
|-------|-----------|--------------|
| 1 | Expertise | Doppelter Übungsbonus auf 2 Fertigkeiten |
| 1 | Sneak Attack | +1d6 Schaden bei Vorteil oder Verbündeten nahe dem Ziel |
| 1 | Thieves' Cant | Geheimsprache der Diebe |
| 2 | Cunning Action | Bonusaktion: Dash, Disengage oder Hide |
| 3 | Roguish Archetype | Wahl eines Archetyps (z.B. Swashbuckler für Piraten) |
| 3 | Sneak Attack | +2d6 |

## 🗺️ Nächste Schritte

1. **Sofort**: Klassenfähigkeiten SQL erstellen für Schurke
2. **Dann**: Charaktererstellungs-Wizard implementieren
3. **Dann**: Schurken-Dashboard erstellen (als Template für andere)
4. **Später**: Weitere Klassen-Dashboards
5. **Zuletzt**: Equipment-Browser mit Suche

## 💡 Hinweise

- Zaubersprüche mit Beschreibungen sind eine RIESIGE Aufgabe (400+ Zauber)
- Ich erstelle Beispiele und Templates, die du erweitern kannst
- Fokus auf spielbare Basis-Funktionalität zuerst
- Details können schrittweise ergänzt werden

## 🚀 Los geht's!

Die Grundlagen sind gelegt. Jetzt erstelle ich:
1. Klassenauswahl-Screen
2. Charaktererstellungs-Wizard
3. Schurken-Dashboard (als Vorlage)
