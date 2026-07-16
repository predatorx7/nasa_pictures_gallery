.PHONY: lint clean fmt test test-macos pub-update gen gen-new gen-serializable devel prod dev dev-windows dev-web dev-macos

lint:
	flutter analyze

clean:
	flutter clean

fmt:
	dart format .

pub-update:
	dart pub get

# Regenerates code from build_runner (drift tables/queries, freezed, json_serializable, etc)
gen: pub-update
	dart run build_runner build

gen-serializable:
	cat cache/x.json | dart run scripts/serializable.dart > cache/class.dart

test:
	flutter test test

test-macos:
	flutter test integration_test

# Runs with the DEMO_KEY NASA API key from development.env.
devel:
	flutter run --dart-define-from-file=development.env

# Runs with the real NASA API key from .env (gitignored).
prod:
	flutter run --dart-define-from-file=.env

dev:
	flutter run

dev-windows:
	flutter run -d windows

dev-web:
	flutter run -d web

dev-macos:
	flutter run -d macos
