import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://pbs.twimg.com/profile_images/1479416404788932608/WI4tInbv_400x400.jpg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                accountName: Text(
                  "Gagandeep",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                accountEmail: Text(
                  "gbhardwaj572@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                   ),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color : Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color : Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color : Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.question_circle,
                color : Colors.white,
              ),
              title: Text(
                "Help",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}