import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/main.dart' as app;
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/router/app_router.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/signin/signin_screen.dart';
import 'package:flutter_template/ui/welcome/welcome_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

class MockSessionRepository extends Mock implements SessionRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockSessionRepository mockSessionRepository;
  late AppRouter appRouter;
  late BuildContext context;
  late StreamController<AuthenticationStatus> statusController;

  setUp(() async {
    await app.initSdks();
    mockSessionRepository = MockSessionRepository();
    statusController = BehaviorSubject()
      ..add(AuthenticationStatus.unauthenticated);
    when(() => mockSessionRepository.status)
        .thenAnswer((_) => statusController.stream);
    DiProvider.instance.unregister<SessionRepository>();
    DiProvider.instance.unregister<AppRouter>();
    DiProvider.instance
        .registerSingleton<SessionRepository>(mockSessionRepository);
    appRouter = AppRouter(mockSessionRepository);
    DiProvider.instance.registerSingleton<AppRouter>(appRouter);
  });

  tearDown(() {
    DiProvider.instance.reset();
    statusController.close();
  });
  group('SignIn screen tests', () {
    testWidgets('SignIn with wrong credentials', (WidgetTester tester) async {
      mockSignInUser(false, mockSessionRepository, statusController);
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();
      context = tester.element(find.byType(SignInScreen));
      await tester.enterText(
        find.widgetWithText(TextField, context.localizations.mail),
        'hi@xmartlabs.com',
      );
      await tester.enterText(
        find.widgetWithText(TextField, context.localizations.password),
        '1234',
      );
      await tester
          .tap(find.widgetWithText(TextButton, context.localizations.sign_in));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
    });
    testWidgets('SignIn with correct credentials', (WidgetTester tester) async {
      mockSignInUser(true, mockSessionRepository, statusController);
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();
      context = tester.element(find.byType(SignInScreen));

      await tester.enterText(
        find.widgetWithText(TextField, context.localizations.mail),
        'hi@xmartlabs.com',
      );
      await tester.enterText(
        find.widgetWithText(TextField, context.localizations.password),
        'xmartlabs',
      );
      await tester
          .tap(find.widgetWithText(TextButton, context.localizations.sign_in));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(WelcomeScreen), findsOneWidget);
    });
  });
}

void mockSignInUser(
  bool correctCredentials,
  MockSessionRepository mockSessionRepository,
  StreamController<AuthenticationStatus> statusController,
) =>
    when(
      () => mockSessionRepository.signInUser(
        email: 'hi@xmartlabs.com',
        password: correctCredentials ? 'xmartlabs' : '1234',
      ),
    ).thenAnswer(
      correctCredentials
          ? (_) async {
              statusController.add(AuthenticationStatus.authenticated);
            }
          : (_) => Future.error(
                const UnknownError('Ops! Something went wrong'),
              ),
    );
