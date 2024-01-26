import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalLogin {
  final SharedPreferences sharedPreferences = GetIt.I<SharedPreferences>();
  final String nama = "namaCustomer";
  final String token = "token";

  Future saveBearerToken(String accessToken) async {
    await sharedPreferences.setString(token, accessToken);
  }

  Future saveNamaCustomer(String namaCustomer) async {
    await sharedPreferences.setString(nama, namaCustomer);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(token).toString();

    return data;
  }

  Future<String> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(nama).toString();

    return data;
  }
}
