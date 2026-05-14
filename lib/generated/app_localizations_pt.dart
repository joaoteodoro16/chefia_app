// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get accessMyAccount => 'Acessar minha conta';

  @override
  String get login => 'Entrar';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Senha';

  @override
  String get forgotPassword => 'Esqueci minha senha';

  @override
  String get createAccount => 'Criar minha conta';

  @override
  String get version => 'Versão:';

  @override
  String get invalidCredentials => 'E-mail ou senha inválidos';

  @override
  String get requiredField => 'Campo obrigatório';

  @override
  String get invalidEmail => 'Email inválido';

  @override
  String get name => 'Nome';

  @override
  String get nameTooShort => 'Nome deve conter pelo menos 3 caracteres';

  @override
  String get save => 'Salvar';

  @override
  String get cnpjRequired => 'CNPJ é obrigatório';

  @override
  String get cnpjInvalid => 'CNPJ inválido';

  @override
  String get phone => 'Celular';

  @override
  String get invalidPhone => 'Celular inválido';
}
