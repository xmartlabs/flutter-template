import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/ui/welcome/welcome_cubit.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeCubit(),
      child: _WelcomeContentScreen(),
    );
  }
}

class _WelcomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<WelcomeCubit, WelcomeBaseState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffEE1A64),
            title: Text(AppLocalizations.of(context)!.xmartlabs_projects),
            actions: [
              TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () => context.read<WelcomeCubit>().logOut(),
                child: Text(AppLocalizations.of(context)!.log_out),
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
        );
      });
}

class _ProjectWidget extends StatelessWidget {
  const _ProjectWidget({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FlutterWebBrowser.openWebPage(url: project.url),
      child: Card(
        child: Column(
          children: [
            Container(
              child: AspectRatio(
                  aspectRatio: 16 / 6,
                  child: Container(
                    child: AspectRatio(
                      aspectRatio: 16 / 6,
                      child: Image.network(
                        project.imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
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
}
