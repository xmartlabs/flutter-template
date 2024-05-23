import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/project_remote_source.dart';
import 'package:flutter_template/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

import 'repository_mocks.dart';

Future<void> commonSetup({
  required MockAuthRemoteSource mockAuthRemoteSource,
  required MockProjectRemoteSource mockProjectRemoteSource,
}) async {
  await app.initSdks();

  DiProvider.instance.unregister<AuthRemoteSource>();
  DiProvider.instance.unregister<ProjectRemoteSource>();

  DiProvider.instance.registerSingleton<AuthRemoteSource>(mockAuthRemoteSource);
  DiProvider.instance
      .registerSingleton<ProjectRemoteSource>(mockProjectRemoteSource);
}

extension WidgetTesterExtension on WidgetTester {
  BuildContext contextOfType<T extends Widget>() {
    final finder = find.byType(T);
    expect(finder, findsOneWidget);
    return element(finder);
  }
}
