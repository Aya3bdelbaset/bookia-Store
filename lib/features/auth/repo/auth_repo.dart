import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio();
  static Future<bool> register({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
  }) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/api/register",
        data: {
          "email": email,
          "password": password,
          "name": name,
          "password_confirmation": passwordConfirmation,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}