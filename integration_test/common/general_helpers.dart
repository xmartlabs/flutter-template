import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/main.dart' as app;
import 'package:flutter_template/ui/router/app_router.dart';

import 'repository_mocks.dart';

Future<void> commonSetup(
  MockSessionRepository mockSessionRepository,
  AppRouter appRouter,
) async {
  await app.initSdks();

  DiProvider.instance.unregister<SessionRepository>();
  DiProvider.instance.unregister<AppRouter>();

  DiProvider.instance
      .registerSingleton<SessionRepository>(mockSessionRepository);
  DiProvider.instance.registerSingleton<AppRouter>(appRouter);
}
