import 'package:flutter/material.dart';
import 'package:magfee/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Header")),
      body: Center(child: Container(child: Text("Magfee"))),
      drawer: MyDrawer(),
    );
  }
}
