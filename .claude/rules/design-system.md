---
paths:
  - "design_system/**"
---

# `design_system` package

## What it is

`design_system` is a local Flutter package (referenced from the root app's
`pubspec.yaml` via `design_system: path: ./design_system`) that provides the
base UI theme and reusable UX/UI components based on Xmartlabs' design
template. It is consumed by the root app (e.g.
`lib/ui/welcome/welcome_screen.dart`, `lib/ui/main/main_screen.dart` import
`package:design_system/design_system.dart`) and has its own standalone example
app under `design_system/design_system_gallery/`.

What belongs here vs. the main app:
- **In `design_system`**: theme definitions (colors, text styles, dimensions,
  button styles), generic/reusable widgets (dropdowns, checkboxes, dialogs,
  radio buttons, text fields), and cross-cutting extensions (`BuildContext`,
  `Color`) that only depend on Flutter/theme concepts — nothing app-specific
  (no business logic, no networking, no app-specific screens/routes).
- **In the main app (`lib/`)**: screens, navigation/routing, state
  management, and anything that composes design-system widgets/theme for a
  specific feature.

## Package layout (`design_system/lib/`)

```
lib/
  design_system.dart        # barrel file (see below)
  common/helper.dart        # small shared helpers (e.g. getMaterialStatesColors)
  extensions/
    color_extensions.dart   # Color.getShade(int) -> generates/reads MaterialColor shades
    context_extensions.dart # BuildContext.theme -> Theme.of(this)
  theme/
    app_theme.dart          # AppTheme.provideAppTheme(context) builds the ThemeData
    app_color_scheme.dart   # default ColorScheme
    custom_colors.dart      # ThemeExtension<CustomColors> (textColor, info, success, warning, danger)
    custom_text_styles.dart # ThemeExtension<CustomTextStyles> (button/body/label styles)
    app_text_styles.dart    # default TextTheme (AppTextStyles.getDefaultAppStyles())
    app_dimensions.dart     # ThemeExtension<AppDimension> (spacing2/4/8/12/16/20/24 ints)
    app_buttons.dart        # ThemeExtension<AppButtonsStyle> (filled/outline/text button styles)
  widgets/
    app_checkbox.dart
    app_dialog.dart
    app_dropdown.dart
    app_radio_button.dart
    app_select_dropdown.dart
    app_text_fields.dart
```

### Barrel file

`lib/design_system.dart` declares `library design_system;` and re-exports the
public surface. **Not everything in `lib/` is exported** — e.g.
`app_checkbox.dart`, `app_dialog.dart`, `app_dropdown.dart`,
`app_radio_button.dart`, `app_text_fields.dart`, `common/helper.dart`, and
`extensions/color_extensions.dart` are currently only reachable via their full
`package:design_system/...` import path, not via the barrel. When adding a
new widget or theme file meant for general consumption, add an `export` line
to `design_system.dart`; otherwise document/import it directly.

### Naming conventions

- Widgets are named `App<Thing>` (`AppCheckbox`, `AppDialog`, `AppDropdown`,
  `AppRadioButton`, `AppSelectDropdown`, `AppTextFields`) and live one class
  (plus its private `State`) per file, file name = `snake_case` of the class.
  Generic widgets are parameterized with `<T>` where useful (e.g.
  `AppSelectDropdown<T>`, `AppCheckbox<T>`).
- Theme extension classes are named `Custom<Thing>` (`CustomColors`,
  `CustomTextStyles`) or `App<Thing>` (`AppDimension`, `AppButtonsStyle`,
  `AppTheme`, `AppColorScheme`, `AppTextStyles`) and each exposes a static
  `getDefaultX()` / `getCustomX()` factory that builds the canonical instance
  — there is a single "default" token set, not a per-instance builder pattern.
- Every `ThemeExtension` subclass implements `copyWith` (which in this
  codebase just returns `getDefault...()`/`getCustom...()` again — extensions
  are effectively immutable singletons) and `lerp`.

## Theming

- `AppTheme.provideAppTheme(BuildContext)` (in `theme/app_theme.dart`) is the
  single entry point the app calls to build its `ThemeData` (see
  `design_system_gallery/lib/main.dart`: `theme: AppTheme.provideAppTheme(context)`).
  It composes `AppTextStyles`, `AppColorScheme`, `CustomColors`,
  `CustomTextStyles`, `AppDimension`, and `AppButtonsStyle`, and registers the
  custom ones as `ThemeData.extensions`.
- There is **no separate light/dark ThemeData** — `provideAppTheme` returns
  one `ThemeData`. Colors are defined as `MaterialColor` with explicit shade
  maps (100–500), and `Color.getShade(int)` (in `color_extensions.dart`)
  reads a shade off a `MaterialColor` or synthesizes one via tint/shade math
  for a plain `Color`.
- Consumers read theme tokens through the `ThemeExtensions` extension on
  `ThemeData` (defined at the bottom of `app_theme.dart`):
  `context.theme.customColors`, `context.theme.dimensions`,
  `context.theme.customTextStyles`, `context.theme.textStyles`,
  `context.theme.buttonsStyle` — combined with `context.theme` from
  `ContextExtensions` (`extensions/context_extensions.dart`). Prefer this
  path (`context.theme.customColors.textColor!.getShade(300)` etc.) over
  reaching into `Theme.of(context).extension<...>()` directly.
- `flutter_screenutil` is used throughout for responsive sizing (`.r`, `.h`,
  `.w`, `.sp`, `.sw`) in both theme code and widgets. The gallery app wraps
  its root in `ScreenUtilInit(designSize: const Size(375, 812), ...)`
  (`design_system_gallery/lib/main.dart`) — any app consuming this package is
  expected to do the same.
- `google_fonts` (Roboto) is used for text styles, but text style factories
  fall back to plain `TextStyle` when `Platform.environment` contains
  `FLUTTER_TEST`, to avoid network font fetches in tests
  (`custom_text_styles.dart`).

## `design_system_gallery/` (the showcase app)

A separate, runnable Flutter app (own `pubspec.yaml`, own `android/`/`ios`/`web`
folders) that depends on `design_system` via `path: ../` and exists purely to
visually showcase every component/token in the package — it has no business
logic of its own.

Structure:
```
design_system_gallery/lib/
  main.dart                     # runApp, ScreenUtilInit, MaterialApp.router w/ AppTheme
  main/gallery_main_screen.dart # home screen: list of links to each gallery screen
  router/gallery_router.dart    # auto_route AutoRouterConfig + route list (+ generated .gr.dart)
  gallery/
    gallery_scaffold_screen.dart      # shared GalleryScaffold (AppBar + back button + padding)
    gallery_app_button_screen.dart
    gallery_app_checkbox.dart
    gallery_app_colors_screen.dart
    gallery_app_dialog.dart
    gallery_app_dropdown_screen.dart
    gallery_app_radio_button.dart
    gallery_app_text_fields_screen.dart
    gallery_app_typography_screen.dart
```

Routing uses `auto_route` (same as the main app). To add a new component's
example screen to the gallery:
1. Create `gallery/gallery_<component>_screen.dart` as a `@RoutePage()`
   `StatelessWidget` that wraps its demo content in `GalleryScaffold(title: ...,
   child: ...)`, importing the widget from `package:design_system/...`.
2. Import the new screen file and add `AutoRoute(page: Gallery<Component>Route.page)`
   to the `routes` list in `router/gallery_router.dart` (routes are generated
   by `auto_route_generator`/`build_runner` into `gallery_router.gr.dart` —
   this generated file is not hand-edited).
3. Add a new case to the `_GalleryScreen` enum and its `title`/`route`
   extensions in `main/gallery_main_screen.dart` so the new screen appears as
   a link on the gallery home screen.

## Lint / analysis

- `design_system/analysis_options.yaml` and
  `design_system/design_system_gallery/analysis_options.yaml` both just
  `include:` the root `analysis_options.yaml` (`../analysis_options.yaml` and
  `../../analysis_options.yaml` respectively) — there are **no
  package-specific lint overrides**; the same `flutter_lints` + custom rule
  set (including `dart_code_linter` anti-patterns/metrics) applies here as in
  the root app.
- `design_system`'s own `pubspec.yaml` uses `flutter_lints: 3.0.1` /
  `lints: 3.0.0` as dev dependencies, matching the root app.

## Testing

- `design_system/test/catalog_test.dart` currently contains only
  `void main() {}` — there is no real automated test coverage for the
  package's widgets/theme yet. Do not assume behavior is verified by tests;
  if you add tests here, they are the first substantive ones for this
  package and there's no existing pattern to follow beyond standard
  `flutter_test` conventions.
- `design_system_gallery/test/` exists as the app's default widget test
  scaffold (from `flutter create`) and is not a substitute for package unit
  tests — verification of new components is done visually via the gallery
  app, not via automated tests.
