import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final String profileImageUrl =
      "https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvdjc5MS10YW5nLTM1LnBuZw.png?s=aLxshBxLcykO2UAnr6F0Nzhqtdx6iR6UuKi4bFSTzC8";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("CodBuddy"),
                  accountEmail: Text("hello@CodBuddy.com"),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(profileImageUrl)),
                )),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white
                    ),
                    title: Text(
                      "Home",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.white,
                        
                      )
                    ),
                  
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white
                    ),
                    title: Text(
                      "My Account",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.white,
                        
                      )
                    ),
                  
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.mail,
                    color: Colors.white
                    ),
                    title: Text(
                      "Contact Us",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.white,
                        
                      )
                    ),
                  
                )
          ],
        ),
      ),
    );
  }
}
