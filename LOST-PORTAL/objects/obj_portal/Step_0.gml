if (global.crystalCount >= global.requiredCrystals) {
    // Move to the next level.
    global.currentLevelIndex++;
    
    // Check if there are more levels.
    if (global.currentLevelIndex < array_length(global.levels)) {
        // Optionally reset the crystal count for the new level.
        global.crystalCount = 0;
        room_goto(global.levels[global.currentLevelIndex]);
    } else {
        // No more levels—go to the tap-to-play (or win) screen.
        room_goto(room_taptoplay);
    }
}
