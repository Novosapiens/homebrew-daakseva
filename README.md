# Daakseva for Homebrew

Daakseva is a menu-bar email client for macOS, built on [Mailspring](https://github.com/Foundry376/Mailspring). It needs a Mac with Apple Silicon (M1 or later) and macOS 13 Ventura or later.

## Install

```bash
brew tap novosapiens/daakseva
brew trust novosapiens/daakseva
brew install --cask daakseva
```

`brew trust` is Homebrew's step for any tap outside its own; you only do it once. Then open Daakseva from Applications: it appears in the menu bar, not the Dock.

Without Homebrew: download the DMG from [the releases](https://github.com/yashsaxena/daakseva-releases/releases/latest) and drag Daakseva to Applications.

## Updates

Daakseva updates itself: when a new version is ready, the menu-bar menu shows "Install Update". There is no need for `brew upgrade`.

## Uninstall

Use **Uninstall Daakseva…** in its menu-bar menu, or:

```bash
brew uninstall --zap --cask daakseva
```

Both remove the app and everything it stored on this Mac (settings, mail cache, logs, its Keychain item). A cloud backup, if you turned it on, is not deleted.

## License and source code

Daakseva is free software under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html), like Mailspring, which it is built on. To get the source code, email team@novosapiens.com.
