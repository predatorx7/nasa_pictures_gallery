# NASA Pictures App

A simple app to browse NASA's Astronomy Picture of the Day (APOD).

## Frontend designs

- As a file in [this repository](https://github.com/predatorx7/nasa_pictures_gallery)
- [Online at Excalidraw](https://excalidraw.com/#json=RCjrsEFVFtGSXsBdyp-li,2-Vcqcb9-sQ1nP9X1rgR7Q)

## Flutter application

- The app fetches pictures live from [NASA's APOD API](https://api.nasa.gov/), caching fetched date ranges in a local SQLite database (via [drift](https://pub.dev/packages/drift)) so repeat visits to the same dates don't re-hit the network.
- https://pub.dev/packages/logging package is used to handle logs in the app.
- https://pub.dev/packages/flutter_riverpod package is used for di & state management.
- https://pub.dev/packages/go_router package is used for navigation.
- https://pub.dev/packages/drift package is used for local caching/persistence (see [Local database](#local-database) below).
- https://pub.dev/packages/freezed package is used for immutable data/model classes.

### Setup

1. Get a free NASA API key at https://api.nasa.gov/ (optional — the app falls back to NASA's rate-limited `DEMO_KEY` if none is provided).
2. Create a `.env` file at the repo root with your key:
   ```
   NASA_API_KEY=your_key_here
   ```
   A `development.env` file (using `DEMO_KEY`) is provided for local development without a personal key.
3. Run code generation once (and after changing any `.drift`, `.dart` model, or `@JsonSerializable`/`@freezed` annotated file):
   ```
   make gen
   ```
4. Run the app:
   ```
   make prod    # uses .env
   make devel   # uses development.env / DEMO_KEY
   make dev     # plain `flutter run`, no dart-define env file
   ```

### Local database

- `lib/storage/sql/*.drift` files contain the SQL table definitions and queries (e.g. `apod_entries.drift`, `bookmarks.drift`, `tables.drift`). Drift's code generator (`build_runner`, via `make gen`) turns these into type-safe Dart query methods on the generated `AppDatabase` class in `lib/storage/db.g.dart` — write/modify SQL there rather than hand-writing Dart query code.
- `lib/storage/db.dart` declares the `AppDatabase` and wires up the included `.drift` files.
- `lib/storage/apod/` maps between drift row types and the app's plain data models.

### Project management via Makefile

All common commands are defined in the `Makefile` (run with `make <target>`):

| Target | Description |
| --- | --- |
| `make dev` | `flutter run` |
| `make dev-web` / `make dev-windows` / `make dev-macos` | `flutter run` targeting a specific platform |
| `make devel` | `flutter run` using `development.env` (`DEMO_KEY`) |
| `make prod` | `flutter run` using `.env` (your personal API key) |
| `make gen` | `dart pub get` + `dart run build_runner build --delete-conflicting-outputs` |
| `make gen-new` | Same as `gen`, without deleting conflicting outputs |
| `make lint` | `flutter analyze` |
| `make fmt` | `dart format .` |
| `make clean` | `flutter clean` |
| `make test` | `flutter test test` |
| `make test-macos` | `flutter test integration_test` |

### Tests

- Tests for Widgets, Services, Repos, Controllers, etc can be found in the `test/` directory.
- Integration test code runner is located in `integration_test/` directory.

Tests atleast verifies the following goals:
1. [x] - Homescreen shows a scrollable grid of pictures starting with the latest images first.
2. [x] - When the user taps on an image that should open the image detail screen.
3. [x] - The pictures screen displays the full size image along with the metadata like title, description, date, etc.
4. [x] - The user should also be able to swipe through images.

#### How to run tests?

1. Run tests _headlessly_ by running `make test` (or `flutter test`)
2. Run integration tests on a device by running `make test-macos` (or `flutter test ./integration_test/app_test.dart`).
3. Learn more about integration testing at https://docs.flutter.dev/testing/integration-tests#run-integration-tests. 

#### Structure

```
.
├───app
│   ├───home
│   ├───pictures
│   └───widgets
├───commons
│   └── theme.dart
├───configs
│   ├── bootstrap.dart
│   ├── config.dart
│   └── logging.dart
├───data
├───gen
├───l10n
│   ├── arb
│   │   ├── app_ar.arb
│   │   ├── app_en.arb
│   │   └── app_hi.arb
│   └── l10n.dart
├── main.dart
├───modules
├───navigation
│   ├── router.dart
│   └── routes.dart
├───repo
├───service
├───storage
│   ├── apod
│   ├── sql
│   ├── db.dart
│   └── provider/
└───utils
```

1. `gen/`

Contains generated code for assets

2. `l10n/`

Translation related arb files, and localization controller

3. the `main.dart`

The main entry point file for the application.

4. `common`

Contains common app settings like themes, etc

5. `configs`

App configurations for startup, logging, (firebase if added) etc

6. `data`

Collection of model data classes for json serializable, freezed, forms, plain models, etc

7. `modules`

Commonly used modules, notifiers, etc

8. `navigation`

Contains routes, and router configurations

9. `repo`

Contains repositories provides data from different sources like http, local storage, in-memory caching, etc.

10. `services`

Contains services which provide data using http, local storage, etc.

11. `storage`

Code related to local data persistence, migrations, database, etc. `storage/sql/*.drift` files hold the raw SQL schema/queries that drift's code generator turns into type-safe Dart; `storage/apod/` maps DB rows to app models; `storage/provider/` selects the right platform-specific database connection (native/web).

12. `app`

Code related to the UI resides here.

13. `utils`

Contains commonly used utility classes, and functions.

#### Screenshots


<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/fbe669ef0d4b0c42dc7cc513811473e53d72c7b1/screenshots/flutter_01.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/fbe669ef0d4b0c42dc7cc513811473e53d72c7b1/screenshots/flutter_02.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/fbe669ef0d4b0c42dc7cc513811473e53d72c7b1/screenshots/flutter_03.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/fbe669ef0d4b0c42dc7cc513811473e53d72c7b1/screenshots/flutter_04.png" width="400" />
