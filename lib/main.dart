import 'package:flutter/material.dart';
import 'package:magfee/pages/login_page.dart';
import 'pages/homepage.dart';
void main() {
  runApp(Magfee());
}

class Magfee extends StatelessWidget {
  const Magfee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        // home: Homepage(), // Because Rout added so no need
        // themeMode: ThemeMode.dark,
        // darkTheme: ThemeData(brightness: Brightness.dark),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple
        ),
        routes: {
          "/": (context) => LoginPage(),
          "home": (context) => Homepage(),
          "login": (context) => LoginPage(),
        },
        // initialRoute: '/register',
    );
  }
}
