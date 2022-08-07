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

#### Structure

```
.
├── app
│   ├── app.dart
│   ├── gallery
│   │   ├── conrollers.dart
│   │   └── items.dart
│   ├── home.dart
│   ├── launch_screen.dart
│   ├── pictures.dart
│   └── widgets
├── commons
│   └── theme.dart
├── configs
│   ├── bootstrap.dart
│   ├── config.dart
│   └── logging.dart
├── data
│   ├── pagination.dart
│   ├── picture.dart
├── gen
│   └── assets.gen.dart
├── generated_plugin_registrant.dart
├── l10n
│   ├── arb
│   │   ├── app_ar.arb
│   │   ├── app_en.arb
│   │   └── app_hi.arb
│   └── l10n.dart
├── main.dart
├── modules
├── navigation
│   ├── router.dart
│   └── routes.dart
├── repo
├── service
├── storage
└── utils
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


<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/4f12aa29e647c1c70d5c13a00d541da44bfe7c44/screenshots/flutter_01.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/4f12aa29e647c1c70d5c13a00d541da44bfe7c44/screenshots/flutter_02.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/4f12aa29e647c1c70d5c13a00d541da44bfe7c44/screenshots/flutter_03.png" width="400" />

<img src="https://github.com/predatorx7/nasa_pictures_gallery/raw/4f12aa29e647c1c70d5c13a00d541da44bfe7c44/screenshots/flutter_04.png" width="400" />
