# livestream-recorder
*A bash livestream recorder based on ffmpeg, with Telegram notifications.*

## Quickstart
All streams are saved inside the `archive` directory, in `.ts` format and can be converted to `.mkv` by running `archive/convert.sh`.

Start by running `bin/start.sh`
Stop by running `bin/stop.sh`

**NOTE: make sure to replace the default YouTube channel ID, the Telegram user ID and the Telegram bot key inside the `bin/streamgrab.sh` script.**

