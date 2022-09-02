# flutter-template

## Project Setup

The project setup is based on some of plugins which generates the required native code.

You can use [project_setup.sh](scripts/project_setup.sh) to reload all project setups.

### Flavor setup: Project name, properties BundleId & Application id
This information is set using [flavorizr], a flutter utility to easily create flavors in your flutter application. 
To change it go to flavorizr section in the [pubspec](./pubspec.yaml) file.

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
To change it go to flutter_icons section in the [pubspec](./pubspec.yaml) file.

After a change is made, you need to regenerate your native files.
You can do that by executing `flutter pub run flutter_launcher_icons:main`.


### Splash screen

Splash screen is generated using [flutter_native_splash].
To change it go to flutter_native_splash section in the [pubspec](./pubspec.yaml) file.

After a change is made, you need to regenerate your native files.
You can do that by executing `flutter pub run flutter_native_splash:create`.

Although you can setup a bunch of features in this library, it doesn't provide a way to display animations.
If you need a more personalized splash screen, you can edit the native code or just remove this library. 

### Pre Push config

In order to setup pre-push hook you need to go to the root of the project and run `git config core.hooksPath .github/hooks`

[flavorizr]: https://pub.dev/packages/flutter_flavorizr
[flutter_launcher_icons]: https://pub.dev/packages/flutter_launcher_icons
[flutter_native_splash]: https://pub.dev/packages/flutter_native_splash
