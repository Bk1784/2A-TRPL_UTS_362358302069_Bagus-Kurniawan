import 'package:flutter_application_register/user.dart';
import 'package:flutter_application_register/auth.dart';


void registerUser(String username, String email, String password, String phone,
    String address, String images) {
  Auth.users.add(
    User(
        username: username,
        email: email,
        password: password,
        phone: phone,
        address: address,
        images: images),
  );

  print('User registered $username');
}
