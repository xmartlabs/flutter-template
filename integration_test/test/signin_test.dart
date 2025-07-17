import 'package:flutter/material.dart';
import 'package:flutter_template/core/common/network_exceptions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/service/auth_models.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/main.dart' as app;
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/signin/signin_screen.dart';
import 'package:flutter_template/ui/welcome/welcome_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../common/general_helpers.dart';
import '../common/repository_mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockAuthRemoteSource mockAuthRemoteSource;
  late MockProjectRemoteSource mockProjectRemoteSource;

  setUp(() async {
    mockAuthRemoteSource = MockAuthRemoteSource();
    mockProjectRemoteSource = MockProjectRemoteSource();
    await commonSetup(
      mockAuthRemoteSource: mockAuthRemoteSource,
      mockProjectRemoteSource: mockProjectRemoteSource,
    );
  });

  tearDown(() {
    DiProvider.instance.reset();
  });
  group('SignIn screen tests', () {
    const email = "test@test.com";
    const password = "test";

    testWidgets('SignIn with wrong credentials', (WidgetTester tester) async {
      when(() => mockAuthRemoteSource.signIn(email, password)).thenAnswer(
        (_) => Future.error(
          const NetworkException.unauthorizedRequest("Unauthorized"),
        ),
      );

      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      final context = tester.contextOfType<SignInScreen>();
      await tester.enterText(
        find.widgetWithText(TextField, context.localizations.mail),
        email,
      );
      await tester.enterText(
        find.widgetWithText(TextField, context.localizations.password),
        password,
      );
      await tester.tap(
        find.widgetWithText(TextButton, context.localizations.sign_in),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
    });
    testWidgets('SignIn with correct credentials', (WidgetTester tester) async {
      when(() => mockAuthRemoteSource.signIn(email, password)).thenAnswer(
        (_) => Future.value(
          SignInResponse(
            accessToken: "testing-token",
            user: User(email: "user@test.com"),
          ),
        ),
      );
      when(() => mockProjectRemoteSource.getProjects())
          .thenAnswer((_) => Future.value([]));

      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      final context = tester.contextOfType<SignInScreen>();
      await tester.enterText(
        find.widgetWithText(TextField, context.localizations.mail),
        email,
      );
      await tester.enterText(
        find.widgetWithText(TextField, context.localizations.password),
        password,
      );
      await tester
          .tap(find.widgetWithText(TextButton, context.localizations.sign_in));
      await tester.pumpAndSettle();
      expect(find.byType(WelcomeScreen), findsOneWidget);
    });
  });
}
