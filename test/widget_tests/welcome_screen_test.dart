import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/welcome/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubits_tests/welcome_cubit_test.mocks.dart';

void main() {
  final ProjectRepository projectRepository = MockProjectRepository();
  final SessionRepository sessionRepository = MockSessionRepository();
  DiProvider.instance
    ..registerSingleton<ProjectRepository>(projectRepository)
    ..registerSingleton<SessionRepository>(sessionRepository);
  testWidgets('Project list error', (tester) async {
    when(projectRepository.getProjects()).thenAnswer(
      (_) => const Stream.empty(),
    );
    await tester.pumpWidget(
      _setupWidget(const WelcomeScreen()),
    );
    expect(Exception, Exception);
  });

  testWidgets('Project list loaded', (tester) async {
    when(projectRepository.getProjects()).thenAnswer(
      (_) => Stream.fromIterable([
        [
          Project(
            id: 1,
            name: 's',
            description: '',
            url: '',
            imageUrl: '',
            language: '',
          ),
        ]
      ]),
    );
    await tester.pumpWidget(
      _setupWidget(const WelcomeScreen()),
    );
    await tester.pumpAndSettle();
    expect(find.text('s'), findsOneWidget);
  });
}

Widget _setupWidget(Widget child) => ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: (_, child) => child!,
      child: Builder(
        builder: (context) => Localizations(
          delegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: AppLocalizations.supportedLocales.first,
          child: Theme(
            data: AppTheme.provideAppTheme(context),
            child: BlocProvider(
              create: (BuildContext context) => GlobalEventHandlerCubit(),
              child: child,
            ),
          ),
        ),
      ),
    );
