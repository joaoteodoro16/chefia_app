// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get accessMyAccount => 'Access my account';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot my password';

  @override
  String get createAccount => 'Create my account';

  @override
  String get version => 'Version:';

  @override
  String get invalidCredentials => 'Invalid email or password';

  @override
  String get requiredField => 'Required field';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get name => 'Name';

  @override
  String get nameTooShort => 'Name must be at least 3 characters';

  @override
  String get save => 'Save';

  @override
  String get cnpjRequired => 'CNPJ is required';

  @override
  String get cnpjInvalid => 'Invalid CNPJ';

  @override
  String get phone => 'Phone';

  @override
  String get invalidPhone => 'Invalid phone number';
}
