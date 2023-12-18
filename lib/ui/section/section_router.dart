import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/cubit/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AuthenticatedSectionRouter extends SectionRouter {
  const AuthenticatedSectionRouter({super.key});
}

@RoutePage()
class UnauthenticatedSectionRouter extends SectionRouter {
  const UnauthenticatedSectionRouter({super.key});
}

class ProviderListener extends StatefulWidget {
  final ChangeNotifier provider;
  final VoidCallback callback;
  final Widget child;
  const ProviderListener({
    required this.provider,
    required this.callback,
    required this.child,
    super.key,
  });

  @override
  State<ProviderListener> createState() => _ProviderListenerState();
}

class _ProviderListenerState extends State<ProviderListener> {
  @override
  void initState() {
    widget.provider.addListener(() {
      widget.callback();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class SectionRouter extends StatelessWidget {
  const SectionRouter({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (BuildContext context) => GlobalEventHandlerProvider(),
        child: const _Content(),
      );
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderListener(
        provider: context.read<GlobalEventHandlerProvider>(),
        child: const AutoRouter(),
        callback: () => _handleStateChanges(
          context,
          context.read<GlobalEventHandlerProvider>().state,
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
      switch (errorType) {
        UnknownError(retry: final retry) => _showDialog(
            context,
            context.localizations.error_unknown_error_title,
            context.localizations.error_unknown_error_description,
            retry,
          ),
        InternetError(retry: final retry) => _showDialog(
            context,
            context.localizations.error_no_internet_connection_error_title,
            context
                .localizations.error_no_internet_connection_error_description,
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
