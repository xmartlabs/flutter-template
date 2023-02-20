import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';

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
        idle: () => {},
        error: (errorType) => _showError(errorType, context),
        loading: () => {},
      );

  void _showError(
    GlobalEventHandlerStateError errorType,
    BuildContext context,
  ) =>
      errorType.when(
        unknownError: (error, retry) => _showDialog(
          context,
          context.localizations.error_unknown_error_title,
          context.localizations.error_unknown_error_description,
          retry,
        ),
        internetError: (retry) => _showDialog(
          context,
          context.localizations.error_no_internet_connection_error_title,
          context.localizations.error_no_internet_connection_error_description,
          retry,
        ),
        generalError: (title, description, retry) =>
            _showDialog(context, title, description, retry),
      );

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
            title ?? context.localizations.error_unknown_error_title,
          ),
          content: Text(description),
          actions: <Widget>[
            if (retry != null)
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.localizations.error_button_retry),
              ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.localizations.error_button_ok),
            ),
          ],
        ),
      );
}
