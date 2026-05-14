
import 'package:chefia_app/app/core/preferences/app_shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  Future<void> setAccessToken({required String accessToken})async{
    final shared = await SharedPreferences.getInstance();
    await shared.setString(AppSharedPreferencesKey.accesToken, accessToken);
  }
}