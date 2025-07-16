# Xmartlabs' Flutter template

## Arch Overview

The project is divided into two main folders:

- The UI contains all app screens.
- The Core contains the models and the data layer.

The design system is located on a package called [design_system][design_system], 

### UI section

[Flutter Bloc][bloc] is used for state management, specifically, we use Cubit to manage the screen state.
Each app section is added in a project folder which contains three components, the Screen (a `StatelessWidget`, the UI), the Cubit and the state.

The `MainScreen` is the Widget that contains all screens. It defines the `MaterialApp` and provides the app router.
The router has two subgraphs, the `UnauthenticatedRouter` used for unauthenticated users and the `AuthenticatedRouter` used for authenticated users.

The [app router][app_router] is provided by [auto_route][auto_route], and contains the previous sections with some nested screens.

### Core section

The models are defined in the [models folder][models]. If you need to use different models for database or networking, you can create them in `db` and `service` folders respectively.

The repository pattern is used to manage the data layer.
A [repository][repository_folder] uses different [data sources][data_source_folder] (for example a local cache or a REST API).
These components are injected in the Cubits using [get_it][get_it].

## Project Overview

### Assets

The [`/assets/`](./assets) folder contains the assets used by the application, such as images, fonts, and other files.

### Environments

The environment variables are defined in the `default.env` file located in [`/environments/`](./environments) folder.
You can read more information about the environment variables in the [README.md](./environments/README.md) file.

### Testing

#### Mocks

For moking the projects uses [mocktail][mocktail], a library inspired on [mockito][mockito] which deletes the code generation part.

#### Integration test

The integration tests for the project are defined in [integration_test][integration_test]. Dart package integration_test is used for the implementation.

## Project Setup

The project setup is based on some plugins which generate the required native code.

You can use [project_setup.sh](scripts/project_setup.sh) to reload all project setups.

### Flavor setup: Project name, properties BundleId & Application id

This information is set using [flavorizr], a flutter utility to easily create flavors in your flutter application.
To change it go to `flavorizr` section in the [pubspec] file.

For example, to add a new flavour, you can do something like:

```yaml
flavorizr:
  flavors:
    qa:
      app:
        name: "My Project - QA"
      android:
        applicationId: "com.xmartlabs.myproject.qa"
      ios:
        bundleId: "com.xmartlabs.myproject.qa"
```

After a change is made, you need to regenerate your native files.
You can do that by executing `flutter pub run flutter_flavorizr`.

More information in [flavorizr] page.

### App icons

Icons are generated using [flutter_launcher_icons] plugin.
To change it go to `flutter_icons` section in the [pubspec] file.

After a change is made, you need to regenerate your native files.
You can do that by executing `flutter pub run flutter_launcher_icons:main`.

### Splash screen

Splash screen is generated using [flutter_native_splash].
To change it go to `flutter_native_splash` section in the [pubspec] file.

After a change is made, you need to regenerate your native files.
You can do that by executing `flutter pub run flutter_native_splash:create`.

Although you can setup a bunch of features in this library, it doesn't provide a way to display animations.
If you need a more personalized splash screen, you can edit the native code or just remove this library.

### Code generation

Code generation is created using `build_runner` package.\
To configure this package edit the `build.yaml`\
To add new files to watch for code generation add the following lines:

```
targets:
  $default:
    builders:
      # Previous configured builders
      ...
      builder_package_name:
        generate_for:
          # Example glob for only the Dart files under `lib/models`
          - lib/models/*.dart
```

To create generated code run `clean_up.sh` under [scripts] folder or the following command: `flutter pub run build_runner build --delete-conflicting-outputs`

### Pre Push config

In order to setup pre-push hook you need to go to the root of the project and run `git config core.hooksPath .github/hooks`

[design_system]: https://github.com/xmartlabs/flutter-template/tree/main/design_system
[flavorizr]: https://pub.dev/packages/flutter_flavorizr
[flutter_launcher_icons]: https://pub.dev/packages/flutter_launcher_icons
[flutter_native_splash]: https://pub.dev/packages/flutter_native_splash
[pubspec]: ./pubspec.yaml
[app_router]: https://github.com/xmartlabs/flutter-template/blob/main/lib/ui/app_router.dart
[bloc]: https://bloclibrary.dev
[auto_route]: https://pub.dev/packages/auto_route
[flutter_screenutil]: https://pub.dev/packages/flutter_screenutil
[models]: https://github.com/xmartlabs/flutter-template/tree/main/lib/core/model
[repository_folder]: https://github.com/xmartlabs/flutter-template/tree/main/lib/core/repository
[data_source_folder]: https://github.com/xmartlabs/flutter-template/tree/main/lib/core/source
[get_it]: https://pub.dev/packages/get_it
[scripts]: https://github.com/xmartlabs/flutter-template/tree/main/scripts
[integration_test]: https://github.com/xmartlabs/flutter-template/tree/main/intgration_test
[mocktail]: https://pub.dev/packages/mocktail
[mockito]: https://pub.dev/packages/mockito
