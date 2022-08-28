import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static void writeString({String? key, String? value}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString(key!, value!);
  }

  static Future<String> readString({String? key}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    /// Las dos ?? son para validar nulos. Por ejemplo si el valor es nulo,
    /// pues lo que va a retornar es "". Si no es nulo pues retorna normalmente
    /// el valor deseado qe en este caso es shared.getString(key!)
    return shared.getString(key!) ?? "";
  }
}