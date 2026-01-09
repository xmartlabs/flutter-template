import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/gen/locale_keys.g.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';

@RoutePage()
class AuthenticatedSectionRouter extends SectionRouter {
  const AuthenticatedSectionRouter({super.key});
}

@RoutePage()
class UnauthenticatedSectionRouter extends SectionRouter {
  const UnauthenticatedSectionRouter({super.key});
}

class SectionRouter extends StatelessWidget {
  const SectionRouter({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => GlobalEventHandlerCubit(),
        child: BlocListener<GlobalEventHandlerCubit, GlobalEventHandlerState>(
          listener: _handleStateChanges,
          child: const AutoRouter(),
        ),
      );

  void _handleStateChanges(
    BuildContext context,
    GlobalEventHandlerState event,
  ) =>
      event.when(
        idle: () => null,
        error: (errorType) => _showError(errorType, context),
        loading: () => null,
      );

  void _showError(
    GlobalEventHandlerStateError errorType,
    BuildContext context,
  ) =>
      switch (errorType) {
        UnknownError(retry: final retry) => _showDialog(
            context,
            LocaleKeys.error_unknown_error_title.tr(),
            LocaleKeys.error_unknown_error_description.tr(),
            retry,
          ),
        InternetError(retry: final retry) => _showDialog(
            context,
            LocaleKeys.error_no_internet_connection_error_title.tr(),
            LocaleKeys.error_no_internet_connection_error_description.tr(),
            retry,
          ),
        GeneralError(
          title: final titleLarge,
          description: final description,
          retry: final retry
        ) =>
          _showDialog(context, titleLarge, description, retry),
      };

  void _showDialog(
    BuildContext context,
    String? title,
    String description,
    VoidCallback? retry,
  ) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            title ?? LocaleKeys.error_unknown_error_title.tr(),
          ),
          content: Text(description),
          actions: <Widget>[
            if (retry != null)
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(LocaleKeys.error_button_retry.tr()),
              ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(LocaleKeys.error_button_ok.tr()),
            ),
          ],
        ),
      );
}
