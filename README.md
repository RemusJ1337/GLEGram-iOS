# GLEGram iOS

GLEGram — a privacy-focused Telegram iOS client based on [Swiftgram](https://github.com/nicegram/nicegram-ios).

## Features

- **Ghost Mode** — Hide online status, typing indicators, read receipts
- **Saved Deleted Messages** — Auto-save messages deleted by others
- **Content Protection Bypass** — Save protected media, disable screenshot detection
- **Font Replacement** — Custom fonts with size control
- **Fake Profile** — Local profile customization
- **Chat Export** — Export chats as HTML/JSON/TXT
- **Plugin System** — JS-based plugin infrastructure
- **And more** — See CHANGELOG_12.5_RU.md for full list

## Build

1. Install Xcode 26.2+ and JDK 21
2. Copy your configuration:
   ```bash
   cp build-system/ipa-build-configuration.json.example build-system/ipa-build-configuration.json
   # Edit with your API credentials from https://my.telegram.org/apps
   ```
3. Build:
   ```bash
   ./scripts/buildprod.sh
   ```

## License

Same as [Telegram iOS](https://github.com/nicegram/nicegram-ios) — GPLv2.
