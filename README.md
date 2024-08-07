# NASA Pictures App

A simple app to browse nasa astronomy pictures from Astronomy Picture of the Day (December 2019)

## Frontend designs

- As a file in [this repository](https://github.com/predatorx7/nasa_pictures_gallery)
- [Online at Excalidraw](https://excalidraw.com/#json=RCjrsEFVFtGSXsBdyp-li,2-Vcqcb9-sQ1nP9X1rgR7Q)

## Flutter application

- Following the rules of the assignment, the app can be run by just a simple `flutter run` command.
- The required JSON file is located at `assets/data/data.json` as is available to the app as an asset.
- yarn (or npm) can optionally be used with `package.json` for managing the project, for ex., `yarn dev` runs the app in debug mode.
- All tests are located in the `test` folder and they can be run by executing the `flutter test` command.
- https://pub.dev/packages/logging package is used to handle logs in the app.
- https://pub.dev/packages/flutter_riverpod package is used for di & state management.
- https://pub.dev/packages/go_router package is used for navigation.

### Tests

- Tests for Widgets, Services, Repos, Controllers, etc can be found in the `test/` directory.
- Integration test code runner is located in `integration_test/` directory.

Tests atleast verifies the following goals:
1. [x] - Homescreen shows a scrollable grid of pictures starting with the latest images first.
2. [x] - When the user taps on an image that should open the image detail screen.
3. [x] - The pictures screen displays the full size image along with the metadata like title, description, date, etc.
4. [x] - The user should also be able to swipe through images.

#### How to run tests?

1. Run tests _headlessly_ by running `flutter test`
2. Run integration tests on a device by running `flutter test ./integration_test/app_test.dart`.
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

Collection of model data classes for json serializable, forms, plain models, etc

7. `modules`

Commonly used modules, notifiers, etc

8. `navigation`

Contains routes, and router configurations

9. `repo`

Contains repositories provides data from different sources like http, local storage, in-memory caching, etc.

10. `services`

Contains services which provide data using http, local storage, etc.

11. `storage`

Code related to local data persistence, migrations, database, etc.

12. `app`

Code related to the UI resides here.

13. `utils`

Contains commonly used utility classes, and functions.

#### Screenshots


<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/fbe669ef0d4b0c42dc7cc513811473e53d72c7b1/screenshots/flutter_01.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/fbe669ef0d4b0c42dc7cc513811473e53d72c7b1/screenshots/flutter_02.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/fbe669ef0d4b0c42dc7cc513811473e53d72c7b1/screenshots/flutter_03.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/fbe669ef0d4b0c42dc7cc513811473e53d72c7b1/screenshots/flutter_04.png" width="400" />
