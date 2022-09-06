import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login_test/views/dashboard.dart';
import 'package:login_test/models/user_model.dart';
import 'package:login_test/views/welcome.dart';

class HttpService
{
  static final _client = http.Client();
  static const _dbUrl = 'http://localhost:8080';
  static final _loginUrl = Uri.parse('$_dbUrl/api/auth/signin');
  static final _registerUrl = Uri.parse('$_dbUrl/api/auth/signup');


  static login(String username, String password, context) async {
    http.Response response = await _client.post(
      _loginUrl,
      body: {
        "username": username,
        "password": password,
      }
    );
    if (response.statusCode == 200) {
      print(response.body);
      final user = User.fromJson(jsonDecode(response.body));
      await EasyLoading.showSuccess("success");
      await Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage(user: user)));
    }
    else {
      EasyLoading.showError("Error code :${response.statusCode.toString()}");
    }
  }

  static login2(String username, String password, String context) async {
    final response = _client.post(
      _loginUrl,
      body: {
        "username": username,
        "password": password,
      }
    ).catchError((error) {
      print(error);
    });
  }

  static register(String username, String email, String password, context) async {
    http.Response response = await _client.post(
      _registerUrl,
      body: {
        "username": username,
        "email": email,
        "password": password,
      }
    );

    if (response.statusCode == 200) {
      print(response.body);
      await EasyLoading.showSuccess("success");
      await Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
    else {
      EasyLoading.showError("Error code :${response.statusCode.toString()}");
    }
  }

}
