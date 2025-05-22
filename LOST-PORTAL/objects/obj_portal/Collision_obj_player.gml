if (global.crystal_count >= 5) {
    if (room == room_level1) {
        room_goto(room_level2);
    } else if (room == room_level2) {
        room_goto(room_level3);
    } else if (room == room_level3) {
        room_goto(room_level4);
    } else if (room == room_level4) {
        room_goto(room_taptoplay); // End screen
    }
}



