#!/bin/bash

# Function to create character page
create_character_page() {
    local class=$1
    local title=$2
    local bg_grad=$3
    local col_prim=$4
    local col_sec=$5
    local col_text=$6
    local field=$7
    local label=$8
    local options=$9
    local placeholder=${10}
    
    cp character.html "character-$class.html"
    
    # Replace title
    sed -i "s/Druiden Tracker/$title/g" "character-$class.html"
    
    # Replace background gradient
    sed -i "s|linear-gradient(135deg, #2d5016 0%, #1a2f0d 100%)|$bg_grad|g" "character-$class.html"
    
    # Replace colors
    sed -i "s/#a5d6a7/$col_prim/g" "character-$class.html"
    sed -i "s/#c8e6c9/$col_sec/g" "character-$class.html"
    sed -i "s/#e8f5e9/$col_text/g" "character-$class.html"
    sed -i "s/#4caf50/$col_prim/g" "character-$class.html"
    sed -i "s/#66bb6a/$col_sec/g" "character-$class.html"
    sed -i "s/#81c784/$col_sec/g" "character-$class.html"
    
    # Replace navigation links
    sed -i "s/dashboard\.html/dashboard-$class.html/g" "character-$class.html"
    sed -i "s/character\.html/character-$class.html/g" "character-$class.html"
    sed -i "s/spells\.html/spells-$class.html/g" "character-$class.html"
    sed -i "s/equipment\.html/equipment-$class.html/g" "character-$class.html"
    
    # Replace class-specific fields
    sed -i "s/druidCircle/$field/g" "character-$class.html"
    sed -i "s/Druiden-Zirkel/$label/g" "character-$class.html"
    sed -i "s/Name des Druiden/$placeholder/g" "character-$class.html"
    sed -i "s/Unbenannter Druide/Unbenannter $title/g" "character-$class.html"
    
    echo "Created character-$class.html"
}

echo "Script ready"
