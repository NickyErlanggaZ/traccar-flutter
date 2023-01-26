import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/view/home_screen.dart';

class LoginController {
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

  login(String email, String password, context) async {
    // init package
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // dikelompokin untuk dimasukkan ke dalam shared preferences 
    Map<String, dynamic> data = {"email": email, "password": password};
    // request untuk login 
    http.Response response = await http.post(
        Uri.parse("https://demo.traccar.org/api/session"),
        body: data, headers: {
          'content-type':'application/x-www-form-urlencoded'
        });

    // set data login
    prefs.setString('user_auth', json.encode(data));

    // logika untuk cek email dan password
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      int id = json["id"];
      String name = json["name"];

      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }else{
      debugPrint("${response.body}");
      showToast("Email dan Password salah");
    }
  }
}
