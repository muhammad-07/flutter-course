import 'package:flutter/material.dart';
import 'homepage.dart';
void main() {
  runApp(Magfee());
}

class Magfee extends StatelessWidget {
  const Magfee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        home: Homepage(),
    );
  }
}
