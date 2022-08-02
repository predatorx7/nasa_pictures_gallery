# NASA Pictures App

## Frontend designs

- As a file in [this repository](https://github.com/predatorx7/)
- [Online at Excalidraw](https://excalidraw.com/#json=)

## Flutter application

- The main flutter code resides at [`/flutter`.](https://github.com/predatorx7/-/tree/main/flutter).
- yarn can optionally be used with `flutter/package.json` for managing the project, for ex., `yarn dev` runs the app in debug mode.

#### Structure

```
.
├── gen
│   └── assets.gen.dart
├── l10n
│   ├── arb
│   │   ├── app_ar.arb
│   │   ├── app_en.arb
│   │   └── app_hi.arb
│   └── l10n.dart
├── main.dart
├── main_devel.dart
├── main_stag.dart
└── src
    ├── commons
    │   ├── dependencies.dart
    │   ├── settings.dart
    │   └── theme.dart
    ├── config
    │   ├── bootstrap.dart
    │   ├── build_options.dart
    │   ├── firebase
    │   │   ├── firebase_options.dart
    │   │   ├── firebase_options_dev.dart
    │   │   └── firebase_options_stg.dart
    │   └── under_construction.dart
    ├── data
    ├── di
    ├── modules
    ├── navigation
    │   └── router.dart
    ├── repo
    ├── services
    ├── storage
    ├── ui
    │   ├── components
    │   ├── main
    │   │   ├── app.dart
    │   │   └── launch.dart
    │   └── screens
    │       ├── browsing.dart
    │       ├── checkout.dart
    │       ├── home.dart
    │       └── my_stuff.dart
    └── utils
```

1. `gen/`

Contains generated code for assets

2. `l10n/`

Translation related arb files, and localization controller

3. main files

The main entry point files for development, staging & production.

4. `common`

Contains app dependencies, settings, themes, etc

5. `config`

App configurations for firebase, startup, etc

6. `data`

Collection of data classes for json serializable, forms, plain models, etc

7. `di` & `modules`

Commonly used providers, notifiers, di modules, controllers, etc

8. `navigation`

Contains routes, and router configurations

9. `repo` & `services`

Contains services, and repositories for http, local storage, etc.

10. `storage`

Code related to local data persistence, migrations, database, etc.

11. `ui`

Code related to the UI resides here.

12. `utils`

Contains commonly used utility classes, and functions.

#### Screenshots
