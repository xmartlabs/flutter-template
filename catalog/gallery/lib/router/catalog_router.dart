import 'package:auto_route/auto_route.dart';
import 'package:gallery/catalog/catalog_app_button_screen.dart';
import 'package:gallery/catalog/catalog_text_fields_screen.dart';
import 'package:gallery/main/catalog_main_screen.dart';
import 'package:gallery/main/catalog_section.dart';

part 'catalog_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|Router,Route',
)
class CatalogRouter extends _$CatalogRouter {
  @override
  final List<AutoRoute> routes;

  CatalogRouter()
      : routes = [
          AutoRoute(
            page: CatalogSectionRouter.page,
            path: '/',
            children: [
              RedirectRoute(path: '', redirectTo: 'main'),
              AutoRoute(page: CatalogAppButtonRoute.page),
              AutoRoute(page: CatalogMainRoute.page, path: 'main'),
              AutoRoute(page: CatalogTextFieldsRoute.page),
            ],
          ),
        ];
}
