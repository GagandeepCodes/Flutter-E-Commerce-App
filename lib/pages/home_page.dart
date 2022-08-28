import 'package:flutter/material.dart';
import 'package:myfirstproject/widgets/drawer.dart';


class Homepage extends StatelessWidget {
  int days = 30;
  String chr = "days";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Catalog App",
        //  style: TextStyle(
        //   color: Colors.blue,
        //   fontWeight: FontWeight.bold,
        //   ),
          ),
      ),
        body: Center(
          child: Container(
            child: Text("Welcome to $days $chr of flutter "),
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}