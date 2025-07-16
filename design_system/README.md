# Design system' Flutter template

Design system is a Flutter package that provides a base implementation for UX/UI components based on the [design template of Xmartlabs][figma].
It aims to simplify and expedite the development process for Flutter projects, ensuring a consistent and visually appealing user interface.

## Features

- Ready-to-use main UI components inspired by Xmartlabs design principles.
- Customizable components to fit your project's specific requirements.

## Getting started

### Installation

Integrate the package in your project, adding the following line to your `pubspec.yaml` file:

```yaml
dependencies flutter:
    design_system:
        path: ../
```

## Arch Overview

The design system project is organized into a singular folder named 'Theme.' 
Within the [theme folder][theme], various files contribute to the overall theme definition:

- App Theme:
This file outlines the app's styles, encompassing elements such as the app bar, dialogs, radio buttons, and other components.

- App Buttons:
Styles for the default buttons of the app are defined within this file.

- App Color Scheme:
Default color schemes for the app are established in this file.

- Custom Colors:
As a Theme Extension, this file incorporates custom colors specific to the app.

- App Dimensions:
Default dimensions for various elements within the app are specified in this file.

- App Text Styles:
Default text styles across the app are defined in this file.

- Custom Text Styles:
As another Theme Extension, this file articulates the custom text styles unique to the app.

This organized structure within the 'Theme' folder ensures a systematic approach to managing and defining the visual aspects of the app.

### Contributing
We welcome contributions! If you find a bug or have a feature request, please open an [issue].

[issue]: https://github.com/xmartlabs/flutter-template/issues
[theme]: https://github.com/xmartlabs/flutter-template/tree/main/lib/ui/theme
[figma]: https://www.figma.com/file/OWDUY4WaDjyfiOE6Z8mfsC/XL---Tourmaline?node-id=0%3A1&mode=dev