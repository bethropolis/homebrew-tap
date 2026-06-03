# homebrew-tap

[![Tap](https://img.shields.io/badge/tap-bethropolis%2Ftap-blue)](https://github.com/bethropolis/homebrew-tap)
[![Version](https://img.shields.io/github/v/tag/bethropolis/homebrew-tap)](https://github.com/bethropolis/homebrew-tap/releases/latest)
[![CI](https://github.com/bethropolis/homebrew-tap/actions/workflows/ci.yml/badge.svg)](https://github.com/bethropolis/homebrew-tap/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/bethropolis/homebrew-tap)](LICENSE)

My personal [Homebrew](https://brew.sh) tap containing custom formulae.

## How to use

Add the tap:

```sh
brew tap bethropolis/tap
```

Install a formula:

```sh
brew install bethropolis/tap/localgo
```

<!-- FORMULA_SECTION_START -->
<!-- FORMULA_SECTION_END -->

## Available casks

<!-- CASK_TABLE_START -->
| Cask | Description | Platform | Install |
| ---- | ----------- | -------- | ------- |
| [`bgrun`](https://github.com/bethropolis/bgrun) | Background process manager for development workflows | 🐧 | `brew install --cask bethropolis/tap/bgrun` |
| [`kcd`](https://github.com/bethropolis/kcd) | Lightweight, headless implementation of the KDE Connect protocol (v8) written in Go | 🐧 | `brew install --cask bethropolis/tap/kcd` |
| [`localgo`](https://github.com/bethropolis/localgo) | LocalSend v2.1 protocol implementation — LAN file transfer CLI | 🍎 🐧 | `brew install --cask bethropolis/tap/localgo` |
| [`podbox`](https://github.com/bethropolis/podbox) | Podman-native container environment manager | 🐧 | `brew install --cask bethropolis/tap/podbox` |
<!-- CASK_TABLE_END -->

## License

[MIT](LICENSE)
