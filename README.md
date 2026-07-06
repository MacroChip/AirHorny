# 📢 AirHorny

Your keyboard, but every key is an air horn.

AirHorny is a single-page air horn soundboard. Every pad blasts the classic
meme air horn, synthesized live in the browser with the Web Audio API — no
audio files, no dependencies, no build step.

## Features

- **BWAAAH on demand** — click a pad or press its keyboard key (`1`–`0`, then
  `Q`–`M`) to blast a horn. Polyphonic, so mash away.
- **Add and remove horns** — build a board as big as your song needs.
- **Per-horn pitch** — every pad has a semitone slider (±2 octaves around A4)
  with a live note-name readout, so you can lay out a melody like a keyboard
  made entirely of air horns.
- **Persistent board** — your layout and tuning are saved to `localStorage`.
  The default board is tuned to play Hot Cross Buns (pads 1-2-3, 1-2-3…).

## Running it

It's one file. Open it:

```sh
open index.html        # macOS
xdg-open index.html    # Linux
```

Or serve it if you prefer:

```sh
python3 -m http.server
# then visit http://localhost:8000
```

## How the horn works

Each blast is five detuned sawtooth oscillators (the beating between them is
what makes it sound like a stack of real horns), pushed through a tanh
waveshaper for brassy saturation and a lowpass filter, with a pitch envelope
that scoops up at the attack and sags at the release — the signature
"BWAAAH" contour.
