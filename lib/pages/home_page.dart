import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/drawer.dart';
import 'package:myfirstproject/widgets/item_widget.dart';


class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int days = 30;

  String chr = "days";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData =  jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.formMap(item)).toList();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar:AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Codehelp",
        //  style: TextStyle(
        //   color: Colors.blue,
        //   fontWeight: FontWeight.bold,
        //   ),
          ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ?GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16
              ),
             itemBuilder:(context,index){
              final item = CatalogModel.items[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: GridTile(
                  header: Container(
                    child: Text(
                      item.name,
                      style: TextStyle(color: Colors.white),
                      ),
                      padding:EdgeInsets.all(7.2),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    ),
                  child: Image.network(item.image),
                  footer: Container(
                    child: Text(
                      item.price.toString(),
                      style: TextStyle(color: Colors.black),
                      ),
                      padding:EdgeInsets.all(7.2),
                    decoration: BoxDecoration(
                      color: Colors.white54
                    ),
                    ),
                  )
                );
             } ,
             itemCount: CatalogModel.items.length,
             )
          :
          Center(
            child: CircularProgressIndicator(),
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}