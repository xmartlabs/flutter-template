import 'package:flutter/services.dart';
import 'package:flutter_template/ui/signin/signin_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mocks/mock_app.dart';

void main() {
  tearDown(rootBundle.clear);
  setUp(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets(
    'Initialize app from login screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        await SimpleTesteableApp.getUnauthenticatedApp(
          initialRoute: 'login',
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SignInScreen), findsOneWidget);
    },
  );
}
