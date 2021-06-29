import 'package:flutter/material.dart';
import 'package:magfee/pages/cart.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:magfee/pages/login_page.dart';
import 'package:magfee/utils/routes.dart';
import 'package:magfee/widgets/themes.dart';
// import 'pages/homepage.dart';
import 'pages/homepage2.dart';

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
        darkTheme: MyTheme.lightTheme(context),
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => Homepage(),
          MyRoutes.homeRoute: (context) => Homepage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.cartRoute: (context) => CartPage(),
        },
        // initialRoute: '/register',
    );
  }
}
