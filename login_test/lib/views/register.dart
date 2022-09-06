import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  late String email;
  late String password;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Page!!")),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            TextField(
              obscureText: false,
              decoration: const InputDecoration(hintText: 'email'),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(hintText: 'password'),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration( color: Colors.blue, borderRadius: BorderRadius.circular(25)),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
