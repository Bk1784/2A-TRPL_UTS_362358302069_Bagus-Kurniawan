import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_register/login_page.dart';
import 'package:flutter_application_register/logout.dart';
import 'package:flutter_application_register/user.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  final Uint8List? imageBytes; 

  ProfilePage({required this.user, this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            imageBytes != null
                ? Image.memory(
                    imageBytes!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : Icon(Icons.person, size: 100),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Username: ${user.username}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey, thickness: 1, indent: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email: ${user.email}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(color: Colors.grey, thickness: 1, indent: 20),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone: ${user.phone}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(color: Colors.grey, thickness: 1, indent: 20),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Address: ${user.address}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(color: Colors.grey, thickness: 1, indent: 20),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () => Logout.logout(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
