// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'catalog_router.dart';

abstract class _$CatalogRouter extends RootStackRouter {
  // ignore: unused_element
  _$CatalogRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CatalogAppButtonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CatalogAppButtonScreen(),
      );
    },
    CatalogMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CatalogMainScreen(),
      );
    },
    CatalogSectionRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CatalogSectionRouterPage(),
      );
    },
    CatalogTextFieldsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CatalogTextFieldsScreen(),
      );
    },
  };
}

/// generated route for
/// [CatalogAppButtonScreen]
class CatalogAppButtonRoute extends PageRouteInfo<void> {
  const CatalogAppButtonRoute({List<PageRouteInfo>? children})
      : super(
          CatalogAppButtonRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogAppButtonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CatalogMainScreen]
class CatalogMainRoute extends PageRouteInfo<void> {
  const CatalogMainRoute({List<PageRouteInfo>? children})
      : super(
          CatalogMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CatalogSectionRouterPage]
class CatalogSectionRouter extends PageRouteInfo<void> {
  const CatalogSectionRouter({List<PageRouteInfo>? children})
      : super(
          CatalogSectionRouter.name,
          initialChildren: children,
        );

  static const String name = 'CatalogSectionRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CatalogTextFieldsScreen]
class CatalogTextFieldsRoute extends PageRouteInfo<void> {
  const CatalogTextFieldsRoute({List<PageRouteInfo>? children})
      : super(
          CatalogTextFieldsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogTextFieldsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
