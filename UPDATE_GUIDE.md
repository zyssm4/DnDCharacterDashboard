# 🎲 D&D Character Tracker - Update Guide

## 📝 Overview
This guide covers all the new features implemented and steps needed to update your D&D tracker app.

---

## ✅ Features Implemented

### 1. 💰 **Currency Tracking System** (Gold/Silver/Copper)
**Files Modified:**
- `character.html` - Added currency controls with +/- buttons
- `dashboard.html` - Display currency in info panel

**Features:**
- Track Gold (GP), Silver (SP), and Copper (CP) separately
- +/- buttons to adjust each currency type
- Automatically loads and saves with character data
- Display on dashboard for quick reference

**Database Update Required:**
```sql
ALTER TABLE characters
ADD COLUMN gold INT DEFAULT 0,
ADD COLUMN silver INT DEFAULT 0,
ADD COLUMN copper INT DEFAULT 0;
```

---

### 2. 🗡️ **Equipment Database** (100+ Items)
**Files Modified:**
- `equipment.html`, `equipment-bard.html`, etc. - Already have search functionality

**What's New:**
- Comprehensive SQL file with 100+ D&D 5e items
- All weapons (simple & martial, melee & ranged)
- All armor types (light, medium, heavy)
- Shields
- Consumables (healing potions, antitoxin, etc.)
- Tools (thieves' tools, rope, torches, etc.)
- Spell foci (arcane, druidic, holy symbols)
- Spell components (diamonds, gemstones, reagents)

**Database Update:**
Run the INSERT statements from `database_migration.sql`

---

### 3. 🐺 **Wildshape Improvements**
**Files Modified:**
- `wildshape.html` - Auto-level detection + lock system

**Features:**
- ✅ **Auto-Level Detection**: Druid level is automatically loaded from character data
- 🔒 **Lock System**: Swimming and flying forms show lock icon until requirements met
  - Swimming forms: Unlocked at Level 4
  - Flying forms: Unlocked at Level 8
- 📖 **Senses Display**: Beast details modal now shows senses (Darkvision, Blindsight, etc.)
- 🛡️ **Readonly Level**: Level input is readonly - automatically synced with character

**Tooltips:**
- Locked badges show "🔒" with tooltip explaining unlock level
- Unlocked badges show ability icon with "verfügbar" tooltip
- Hover over badges to see requirements

**Database Update:**
```sql
ALTER TABLE beast_shapes
ADD COLUMN senses VARCHAR(500);

-- Example data:
UPDATE beast_shapes SET senses = 'Darkvision 60 ft., Passive Perception 12' WHERE name_de LIKE '%Wolf%';
```

---

### 4. ⚠️ **Spell Material Component Warnings**
**Files Modified:**
- `spells.html`, `spells-bard.html`, `spells-wizard.html`, `spells-paladin.html`

**Features:**
- Warning icon (⚠️) appears next to spells requiring materials you don't have
- Checks inventory for required components
- Checks gold amount for GP-cost components
- Hover tooltip shows exactly what's missing
- Supports 25+ common spell components (diamonds, sulfur, bat guano, etc.)

**How It Works:**
1. Loads character gold and inventory
2. Parses spell material components
3. Checks if you have required items/gold
4. Displays warning if missing anything

**Database Update:**
```sql
ALTER TABLE spells
ADD COLUMN material VARCHAR(500),
ADD COLUMN material_de VARCHAR(500);

-- Example:
UPDATE spells SET
    material_de = 'Fledermausguano und Schwefel',
    material = 'Bat guano and sulfur'
WHERE name_de = 'Feuerball';
```

---

### 5. ⚙️ **Proficiency Management UI**
**Files Modified:**
- `dashboard.html` - Added modal for managing proficiencies

**Features:**
- Click "⚙️ Bearbeiten" button next to Übungsbonus
- Modal opens with checkboxes for:
  - Saving Throw Proficiencies (all 6 abilities)
  - Skill Proficiencies (all 18 skills with ability indicators)
- Real-time updates to dashboard
- Saves to database

**Usage:**
1. Click gear icon (⚙️) next to proficiency bonus
2. Check/uncheck proficiencies
3. Click "💾 Speichern" to save
4. Changes immediately reflect on dashboard

---

### 6. 🆙 **Level-Up Guide System**
**Files Modified:**
- `character.html` - Added comprehensive level-up modal

**Features:**
- Automatically triggers when you increase character level
- Shows modal with:
  - New features gained
  - Spell slot progression
  - Cantrips/spells known
  - Ability score improvements (highlighted in gold)
  - Proficiency bonus increases
- Covers all 20 levels for Druids

---

### 7. ⬆️⬇️ **Item Quantity Controls**
**Files Modified:**
- `equipment.html`, `equipment-bard.html`, `equipment-rogue.html`, `equipment-wizard.html`, `equipment-paladin.html`

**Features:**
- +/- buttons for stackable items (consumables, tools, misc)
- Shows current quantity
- Confirmation when reducing to zero
- Auto-removes item if confirmed at zero
- Works for potions, rations, spell components, etc.

---

### 8. 🛏️ **Rest System Tooltips**
**Files Modified:**
- `dashboard.html`, `dashboard-bard.html`

**Features:**
- Hover over rest buttons for detailed tooltips
- Long Rest (🌙): Shows all benefits restored
- Short Rest (☀️): Shows quick recovery options
- Class-specific features highlighted (Wildshape for druids, Bardic Inspiration for bards)

---

## 🚀 Installation Steps

### Step 1: Backup Your Database
```bash
mysqldump -u your_user -p your_database > backup_$(date +%Y%m%d).sql
```

### Step 2: Run Database Migration
```bash
mysql -u your_user -p your_database < database_migration.sql
```

This will:
- ✅ Add currency columns (gold, silver, copper)
- ✅ Add senses column to beast_shapes
- ✅ Add material component columns to spells
- ✅ Insert 100+ equipment items
- ✅ Add sample spell components
- ✅ Add sample beast senses
- ✅ Set default currency for existing characters

### Step 3: Update Files
Replace the following files on your server:
```
character.html
dashboard.html
dashboard-bard.html
equipment.html
equipment-bard.html
equipment-rogue.html
equipment-wizard.html
equipment-paladin.html
spells.html
spells-bard.html
spells-wizard.html
spells-paladin.html
wildshape.html
```

### Step 4: Clear Browser Cache
- Press **Ctrl + Shift + Delete** (Chrome/Edge/Firefox)
- Select "Cached images and files"
- Click "Clear data"
- Or do a hard refresh: **Ctrl + F5**

### Step 5: Test Features
✅ **Currency System:**
1. Open character.html
2. Check currency controls appear below Druiden-Zirkel
3. Adjust gold/silver/copper with +/- buttons
4. Save and check dashboard shows currency

✅ **Equipment Database:**
1. Open equipment.html
2. Type "sword" in search box
3. Should see multiple sword results
4. Click to add to inventory

✅ **Wildshape Locks:**
1. Open wildshape.html with level 2 character
2. Swimming badge should show 🔒 and be grayed out
3. Flying badge should show 🔒 and be grayed out
4. Hover to see unlock level tooltips
5. Test with level 4+ character - swimming should unlock
6. Test with level 8+ character - flying should unlock

✅ **Material Warnings:**
1. Open spells.html
2. Look for spells with expensive components
3. Should see ⚠️ icon if you don't have materials
4. Hover to see what's missing

✅ **Proficiency Management:**
1. Open dashboard.html
2. Click ⚙️ button next to Übungsbonus
3. Toggle proficiencies
4. Save and verify changes reflect on dashboard

---

## 📊 Database Schema Changes

### Characters Table
```sql
+--------+---------+
| Column | Type    |
+--------+---------+
| gold   | INT     |
| silver | INT     |
| copper | INT     |
+--------+---------+
```

### Beast_Shapes Table
```sql
+--------+--------------+
| Column | Type         |
+--------+--------------+
| senses | VARCHAR(500) |
+--------+--------------+
```

### Spells Table
```sql
+--------------+--------------+
| Column       | Type         |
+--------------+--------------+
| material     | VARCHAR(500) |
| material_de  | VARCHAR(500) |
+--------------+--------------+
```

### Equipment Table (Already Exists)
Now populated with 100+ items including:
- 30+ Weapons
- 12 Armor pieces
- Shields
- 20+ Tools
- 10+ Consumables
- 40+ Spell components

---

## 🎯 Testing Checklist

- [ ] Currency displays on dashboard
- [ ] Currency can be adjusted in character page
- [ ] Equipment search returns results
- [ ] Can add equipment from database
- [ ] Wildshape level auto-detects from character
- [ ] Swimming badge locked at level 2-3
- [ ] Swimming badge unlocked at level 4+
- [ ] Flying badge locked at level 2-7
- [ ] Flying badge unlocked at level 8+
- [ ] Spell material warnings appear
- [ ] Material warning tooltips show missing items
- [ ] Proficiency modal opens and saves
- [ ] Level-up guide appears when increasing level
- [ ] Item quantity controls work for consumables
- [ ] Rest tooltips show on hover

---

## 🐛 Troubleshooting

### "Currency not showing on dashboard"
- Check database columns exist: `SHOW COLUMNS FROM characters LIKE '%gold%';`
- Check character has currency values: `SELECT gold, silver, copper FROM characters WHERE id = 1;`
- Clear browser cache

### "Equipment search returns no results"
- Check equipment table has items: `SELECT COUNT(*) FROM equipment;` (should be 100+)
- Run INSERT statements from migration file
- Check db_actions.php handles `action=equipment&search=...`

### "Wildshape badges not unlocking"
- Check character level is being loaded: Open browser console, check for errors
- Verify level in database: `SELECT level FROM characters WHERE id = 1;`
- Reload wildshape.html page

### "Material warnings not appearing"
- Check spells have material_de column: `SHOW COLUMNS FROM spells LIKE 'material%';`
- Check inventory is loading: Open browser console > Network tab
- Verify character has gold field: `SELECT gold FROM characters WHERE id = 1;`

---

## 📝 Notes

### Gold Conversion Formula
- 1 Gold (GP) = 10 Silver (SP)
- 1 Silver (SP) = 10 Copper (CP)
- 1 Gold (GP) = 100 Copper (CP)

The app currently tracks each currency separately. Future update could add automatic conversion.

### Wildshape Level Requirements
According to D&D 5e rules:
- **Level 2**: Wildshape unlocked (CR 1/4, no swim/fly)
- **Level 4**: Swim speed forms unlocked
- **Level 8**: Fly speed forms unlocked

### Material Component Checking
The system checks for 25+ common components:
- Gemstones: Diamant, Rubin, Smaragd, Saphir, Perle, Jade
- Reagents: Weihrauch, Schwefel, Phosphor, Fledermausguano
- Metals: Eisen, Silber, Gold, Kupfer
- Others: Kristall, Bernstein, Knochen, Haar, Feder, etc.

---

## 🎉 You're All Set!

Your D&D Character Tracker now has:
- ✅ Full currency management
- ✅ Comprehensive equipment database
- ✅ Smart wildshape restrictions
- ✅ Material component tracking
- ✅ Proficiency management
- ✅ Level-up guidance
- ✅ Quantity controls
- ✅ Rest system tooltips

Enjoy your enhanced D&D experience! 🎲🐉
