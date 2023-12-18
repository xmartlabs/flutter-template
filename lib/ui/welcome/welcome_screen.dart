import 'package:auto_route/auto_route.dart';
import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/welcome/welcome_provider.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:provider/provider.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => WelcomeProvider(null),
        child: _WelcomeContentScreen(),
      );
}

class _WelcomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<WelcomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.xmartlabs_projects),
        actions: [
          SizedBox(
            width: 50.w,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  context.theme.colors.onPrimary,
                ),
              ),
              onPressed: () => context.read<WelcomeProvider>().logOut(),
              child: Text(context.localizations.log_out),
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
    );
  }
}

class _ProjectWidget extends StatelessWidget {
  const _ProjectWidget({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FlutterWebBrowser.openWebPage(url: project.url),
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
