if (isOpen) {
    // Level progression based on the current room.
    if (room == room_level1) {
        room_goto(room_level2);
    } else if (room == room_level2) {
        room_goto(room_level3);
    } else if (room == room_level3) {
        room_goto(room_level4);
    } else if (room == room_level4) {
        // When finished with level 4, go to a win or restart screen.
        room_goto(room_taptoplay);
    }
}


