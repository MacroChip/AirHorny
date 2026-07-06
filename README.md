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

## Deploying with Docker

The included Dockerfile serves the site with nginx on port **6969**:

```sh
docker compose up -d --build
# or, without compose:
docker build -t airhorny .
docker run -d --name airhorny --restart unless-stopped -p 6969:6969 airhorny
```

Then visit `http://<your-droplet-ip>:6969`.

On a fresh droplet, the short version is: install Docker
(`curl -fsSL https://get.docker.com | sh`), clone this repo,
`docker compose up -d --build`, and open port 6969 in the firewall
(`ufw allow 6969/tcp` if you use ufw; on DigitalOcean also allow it in the
cloud firewall if the droplet has one attached). Plain HTTP is fine — the
Web Audio API doesn't require a secure context, so the horns honk over
http:// without any TLS setup.

## How the horn works

Each blast is five detuned sawtooth oscillators (the beating between them is
what makes it sound like a stack of real horns), pushed through a tanh
waveshaper for brassy saturation and a lowpass filter, with a pitch envelope
that scoops up at the attack and sags at the release — the signature
"BWAAAH" contour.
