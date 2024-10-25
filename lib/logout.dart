import 'package:flutter/material.dart';
import 'package:flutter_application_register/login_page.dart';

class Logout {
  static void logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false
        );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Anda telah keluar'),
      ),
    );
  }
}
