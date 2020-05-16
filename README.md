# RGB Pong

Pong videogame with color mechanics. Made for [the first #RetoGamedev](https://itch.io/jam/1-retogamedev).

Project boilerplate generated from [godot-game-boilerplate](https://github.com/moisesjbc/godot-game-boilerplate).

# Third-party work used

- [Godot Engine](https://godotengine.org/)
- [Ubuntu Font](https://design.ubuntu.com/font/)

## Exporting (Linux only)

1. Set the environment variable to a path pointing to Godot Engine executable. ie.

        export GODOT_EXECUTABLE=<path-to-godot-engine>

    For example:

        export GODOT_EXECUTABLE=/opt/godot-engine/Godot_v3.0.6-stable_x11.64

2. Run the export script. Packages will be generated in `export/` and `export/zip` directories.

        bash export.sh <game-name> <version>

    For example:

        bash export.sh awesome-game v1.0
