import 'package:flutter/material.dart';
import 'package:flutter1/utils/routes.dart';

void main = () => runApp(Login());

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool loginPress = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        loginPress = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        loginPress = false;
        name = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(width: 20, height: 30),
                Image.asset(
                  'assets/images/user.png',
                  fit: BoxFit.scaleDown,
                  width: 200,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome $name',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "Enter username",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter passowrd",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (value.length < 6) {
                            return "Password cannot be less than 6 words long";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      // ElevatedButton(
                      //   onPressed: () =>
                      //       {Navigator.pushNamed(context, MyRoutes.homeRoute)},
                      //   child: Text('Submit'),
                      //   style: TextButton.styleFrom(minimumSize: Size(160, 40)),
                      // ),
                      Material(
                        // decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius:
                            BorderRadius.circular(loginPress ? 25 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: loginPress ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: loginPress
                                ? Icon(Icons.done)
                                : Text("Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
