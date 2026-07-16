gen:
	dart run build_runner build
devel:
	flutter run --dart-define-from-file=development.env
prod:
	flutter run --dart-define-from-file=.env
