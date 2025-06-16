// Instead of large oscillations, apply a tiny random offset for a shake effect.
x = start_x + random_range(-shake_amplitude, shake_amplitude);
y = start_y + random_range(-shake_amplitude, shake_amplitude);
// Slight random drift for a cosmic feel
x += random_range(-1, 1);
y += random_range(-1, 1);

