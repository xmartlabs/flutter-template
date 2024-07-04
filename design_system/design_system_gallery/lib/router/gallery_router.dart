import 'package:auto_route/auto_route.dart';
import 'package:design_system_gallery/gallery/gallery_app_colors_screen.dart';
import 'package:design_system_gallery/gallery/gallery_app_radio_button.dart';
import 'package:design_system_gallery/gallery/gallery_app_typography_screen.dart';
import 'package:design_system_gallery/gallery/gallery_app_checkbox.dart';
import 'package:design_system_gallery/gallery/gallery_app_dropdown_screen.dart';
import 'package:design_system_gallery/gallery/gallery_app_text_fields_screen.dart';
import 'package:design_system_gallery/gallery/gallery_app_dialog.dart';
import 'package:design_system_gallery/main/gallery_main_screen.dart';

part 'gallery_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|Router,Route',
)
class GalleryRouter extends _$GalleryRouter {
  @override
  final List<AutoRoute> routes;

  GalleryRouter()
      : routes = [
          AutoRoute(page: GalleryAppButtonRoute.page),
          AutoRoute(initial: true, page: GalleryMainRoute.page),
          AutoRoute(page: GalleryTextFieldsRoute.page),
          AutoRoute(page: GalleryAppColorsRoute.page),
          AutoRoute(page: GalleryAppTypographyRoute.page),
          AutoRoute(page: GalleryDropdownRoute.page),
          AutoRoute(page: GalleryDialogRoute.page),
          AutoRoute(page: GalleryAppRadioButtonRoute.page),
          AutoRoute(page: GalleryAppCheckboxRoute.page),
        ];
}
