default: install-flutter get-deps gen-code gen-l10n

set windows-shell := ["pwsh.exe", "-NoProfile", "-c"]

##
# Basic commands
##

install-flutter:
  fvm install -s --skip-pub-get

get-deps:
  fvm flutter pub get

gen-code:
  fvm dart run build_runner build --delete-conflicting-outputs

gen-l10n:
  fvm flutter gen-l10n

##
# Watching
##

watch-bridge:
  flutter_rust_bridge_codegen generate --watch

watch-code:
  fvm dart run build_runner watch --delete-conflicting-outputs

##
# Building
##

[windows]
build-release:
  fvm flutter build windows --release

[linux]
build-release:
  fvm flutter build linux --release

[macos]
build-release:
  fvm flutter build macos --release

build:
  fvm flutter build web

test:
  fvm flutter test

##
# Other commands
##

lint:
  fvm flutter analyze

show-outdated:
  fvm flutter pub outdated
  cd rust && cargo update -n

upgrade-deps:
  fvm flutter pub upgrade
  cd rust && cargo update
