import 'package:flutter/material.dart';
import 'package:flutter1/pages/cart_page.dart';
import 'package:flutter1/pages/home.dart';
import 'package:flutter1/pages/login.dart';
import 'package:flutter1/utils/routes.dart';
import 'package:flutter1/widgets/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => Login(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
