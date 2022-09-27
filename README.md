# Xmartlabs' Flutter template

## Arch Overview 

The project is divided into two main folders:
- The UI contains all app screens.
- The Core contains the models and the data layer.

### UI section

[Flutter Bloc][bloc] is used for state management, specifically, we use Cubit to manage the screen state.
Each app section is added in a project folder which contains three components, the Screen (a `StatelessWidget`, the UI), the Cubit and the state.

The `MainScreen` is the Widget that contains all screens. It defines the `MaterialApp` and provides the app router.
The router has two subgraphs, the `UnauthenticatedRouter` used for unauthenticated users and the `AuthenticatedRouter` used for authenticated users.

The [app router][app_router] is provided by [auto_route][auto_route], and contains the previous sections with some nested screens.

The [theme folder][theme] contains the theme definitions, for example colors, styles and dimensions. 
Another important plugin related to the UI is [flutter_screenutil][flutter_screenutil], used for adapting screen and font size.

### Core section

The models are defined in the [models folder][models]. If you need to use different models for database or networking, you can create them in `db` and `service` folders respectively.

The repository pattern is used to manage the data layer.
A [repository][repository_folder] uses different [data sources][data_source_folder] (for example a local cache or a REST API).
These components are injected in the Cubits using [get_it][get_it].

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
        name: 'My Project - QA'
      android:
        applicationId: 'com.xmartlabs.myproject.qa'
      ios:
        bundleId: 'com.xmartlabs.myproject.qa'
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

### Pre Push config

In order to setup pre-push hook you need to go to the root of the project and run `git config core.hooksPath .github/hooks`

[flavorizr]: https://pub.dev/packages/flutter_flavorizr
[flutter_launcher_icons]: https://pub.dev/packages/flutter_launcher_icons
[flutter_native_splash]: https://pub.dev/packages/flutter_native_splash
[pubspec]: ./pubspec.yaml
[app_router]: https://github.com/xmartlabs/flutter-template/blob/main/lib/ui/app_router.dart
[bloc]: https://bloclibrary.dev
[auto_route]: https://pub.dev/packages/auto_route
[theme]: https://github.com/xmartlabs/flutter-template/tree/main/lib/ui/theme
[flutter_screenutil]: https://pub.dev/packages/flutter_screenutil
[models]: https://github.com/xmartlabs/flutter-template/tree/main/lib/core/model
[repository_folder]: https://github.com/xmartlabs/flutter-template/tree/main/lib/core/repository
[data_source_folder]: https://github.com/xmartlabs/flutter-template/tree/main/lib/core/source
[get_it]: https://pub.dev/packages/get_it
