import 'package:flutter/material.dart';
import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/drawer.dart';
import 'package:myfirstproject/widgets/item_widget.dart';


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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context , index){
              return ItemWidget(item :CatalogModel.items[index]);
            }
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}