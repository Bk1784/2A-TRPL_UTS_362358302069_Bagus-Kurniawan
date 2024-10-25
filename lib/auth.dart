import 'package:flutter_application_register/user.dart';

class Auth {
  static List<User> users = [];

  bool login(String email, String password) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }

  User getUserByemail(String email) {
    return users.firstWhere((user) => user.email == email,
        orElse: () => throw Exception('user tidak ditemukan'));
  }

  bool addUser(String username, String email, String password, String phone, String address, String images) {

    for (var user in users) {
      if (user.email == email) {
        return false; 
      }
    }

    users.add(User(
      username: username,
      email: email,
      password: password,
      phone: phone,
      address: address,
      images: images,
    ));
    return true;
  }
}
