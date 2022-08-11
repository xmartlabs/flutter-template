import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/ui/resources.dart';
import 'package:flutter_template/ui/section/error_handler/error_handler_cubit.dart';

class SectionRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ErrorHandlerCubit(),
      child: BlocListener<ErrorHandlerCubit, ErrorHandlerState>(
        listener: showError,
        child: AutoRouter(),
      ),
    );
  }

  void showError(BuildContext context, ErrorHandlerState error) {
    error.when(
        init: () => {},
        unknownError: (error, retry) => _showDialog(
              context,
              Resources.localizations.error_unknown_error_title,
              Resources.localizations.error_unknown_error_description,
              retry,
            ),
        internetError: (retry) => _showDialog(
              context,
              Resources.localizations.error_no_internet_connection_error_title,
              Resources
                  .localizations.error_no_internet_connection_error_description,
              retry,
            ),
        generalError: (title, description, retry) =>
            _showDialog(context, title, description, retry));
  }

  void _showDialog(BuildContext context, String? title, String description,
          VoidCallback? retry) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                    title ?? Resources.localizations.error_unknown_error_title),
                content: Text(description),
                actions: <Widget>[
                  if (retry != null)
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(Resources.localizations.error_button_retry),
                    ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(Resources.localizations.error_button_ok),
                  ),
                ],
              ));
}
