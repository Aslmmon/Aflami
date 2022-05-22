import 'package:afalmi/presentation/app_resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _prefsKeyLang = "prfsKeylang";

class AppPrefrences {
  final SharedPreferences _sharedPreferences;

  AppPrefrences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(_prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }
}
