// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String error(String text) {
    return 'Error: $text';
  }

  @override
  String get error_button_ok => 'Ok';

  @override
  String get error_button_retry => 'Retry';

  @override
  String get error_no_internet_connection_error_description =>
      'You have no internet connection';

  @override
  String get error_no_internet_connection_error_title => 'Error';

  @override
  String get error_unknown_error_description => 'Something went wrong!';

  @override
  String get error_unknown_error_title => 'Ops!';

  @override
  String get log_out => 'Log out';

  @override
  String get mail => 'Mail';

  @override
  String get password => 'Password';

  @override
  String get sign_in => 'Sign In';

  @override
  String get xmartlabs_projects => 'Xmartlabs\' projects';
}
