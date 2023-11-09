import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

@RoutePage(name: 'CatalogSectionRouter')
class CatalogSectionRouterPage extends CatalogSectionRouter {
  const CatalogSectionRouterPage({super.key});
}

class CatalogSectionRouter extends StatelessWidget {
  const CatalogSectionRouter({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(child: AutoRouter());
}
