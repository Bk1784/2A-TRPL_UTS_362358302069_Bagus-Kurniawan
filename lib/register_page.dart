import 'dart:html' as html; 
import 'dart:typed_data'; 
import 'package:flutter/material.dart';
import 'package:flutter_application_register/login_page.dart';
import 'auth.dart';
import 'user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  Uint8List? _imageBytes; 

  Future<void> _pickImage() async {

    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.click();

    input.onChange.listen((e) async {
      final reader = html.FileReader();
      reader.readAsArrayBuffer(input.files![0]);
      reader.onLoadEnd.listen((e) {
        setState(() {
          _imageBytes = reader.result as Uint8List;
        });
      });
    });
  }

  void _register() {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    String phone = _phoneController.text.trim();
    String address = _addressController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password dan konfirmasi tidak cocok')),
      );
      return;
    }

    
    Auth.users.add(
      User(
        username: username,
        email: email,
        password: password,
        phone: phone,
        address: address,
        images: '',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registrasi berhasil, silakan login')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Daftar', style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.image,),
              onPressed: _pickImage,
            ),
            _imageBytes != null
                ? Image.memory(_imageBytes!, height: 100, width: 100)
                : Icon(Icons.person, size: 100),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Konfirmasi Password'),
              obscureText: true,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            ElevatedButton(
              onPressed: _register,
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
