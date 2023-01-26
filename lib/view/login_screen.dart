import 'package:flutter/material.dart';
import 'package:test_flutter/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Center(child: Text("Login",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)),
          SizedBox(height: 74,),
          TextField(
            controller: controller.inputEmail,
            decoration: InputDecoration(hintText: "email"),
          ),
          TextField(
            obscureText: true,
            controller: controller.inputPassword,
            decoration: InputDecoration(hintText: "password"),
          ),
          SizedBox(height: 96,),
          ElevatedButton.icon(onPressed: (){
            controller.login(controller.inputEmail.text, controller.inputPassword.text, context);
          },icon: Icon(Icons.login),label: Text("Login"),),
        ]),
      ),
    ));
  }
}
