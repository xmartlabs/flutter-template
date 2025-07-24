import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/welcome/welcome_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            WelcomeCubit(context.read<GlobalEventHandlerCubit>()),
        child: _WelcomeContentScreen(),
      );
}

class _WelcomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<WelcomeCubit, WelcomeBaseState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              context.localizations.xmartlabs_projects,
              style: context.theme.textStyles.titleMedium
                  ?.copyWith(color: context.theme.colorScheme.onPrimary),
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(
                    context.theme.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () => context.read<WelcomeCubit>().logOut(),
                child: Text(
                  context.localizations.log_out,
                  style: context.theme.textStyles.bodyMedium
                      ?.copyWith(color: context.theme.colorScheme.onPrimary),
                ),
              ),
            ],
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: state.projects.length,
            itemBuilder: (context, index) {
              final project = state.projects[index];
              return _ProjectWidget(project: project);
            },
          ),
        ),
      );
}

class _ProjectWidget extends StatelessWidget {
  const _ProjectWidget({
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          final uri = Uri.parse(project.url);
          unawaited(launchUrl(uri));
        },
        child: Card(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 6,
                child: AspectRatio(
                  aspectRatio: 16 / 6,
                  child: Image.network(
                    project.imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              ListTile(
                title: Text(project.name),
                subtitle: Text(project.description),
              ),
            ],
          ),
        ),
      );
}
