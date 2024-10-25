import 'package:flutter_application_register/auth.dart';
import 'package:flutter_application_register/user.dart';

class Registerservice {
  static bool validasiPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  static bool addUser({
    required String username,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String images,
  }) {
    for (var user in Auth.users) {
      if (user.email == email) {
        return false;
      }
    }
    Auth.users.add(User(
        username: username,
        email: email,
        password: password,
        phone: phone,
        address: address,
        images: images));
    return true;
  }
}
