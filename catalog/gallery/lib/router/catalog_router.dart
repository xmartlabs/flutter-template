import 'package:auto_route/auto_route.dart';
import 'package:gallery/catalog/catalog_app_button_screen.dart';
import 'package:gallery/catalog/catalog_app_colors_screen.dart';
import 'package:gallery/catalog/catalog_app_selection_control.dart';
import 'package:gallery/catalog/catalog_app_typography_screen.dart';
import 'package:gallery/catalog/catalog_app_dropdown_screen.dart';
import 'package:gallery/catalog/catalog_app_text_fields_screen.dart';
import 'package:gallery/catalog/catalog_app_dialog.dart';
import 'package:gallery/main/catalog_main_screen.dart';

part 'catalog_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|Router,Route',
)
class CatalogRouter extends _$CatalogRouter {
  @override
  final List<AutoRoute> routes;

  CatalogRouter()
      : routes = [
          AutoRoute(page: CatalogAppButtonRoute.page),
          AutoRoute(initial: true, page: CatalogMainRoute.page),
          AutoRoute(page: CatalogTextFieldsRoute.page),
          AutoRoute(page: CatalogAppColorsRoute.page),
          AutoRoute(page: CatalogAppTypographyRoute.page),
          AutoRoute(page: CatalogDropdownRoute.page),
          AutoRoute(page: CatalogDialogRoute.page),
          AutoRoute(page: CatalogAppSelectionControlRoute.page),
        ];
}
