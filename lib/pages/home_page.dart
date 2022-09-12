// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/drawer.dart';
import 'package:myfirstproject/widgets/item_widget.dart';
import 'package:myfirstproject/widgets/themes.dart';

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
      backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                CatalogHeader(),
                if(CatalogModel.items != null && CatalogModel.items.isNotEmpty )
                  CatalogList().expand()
                
                else
                  Center(
                    child : CircularProgressIndicator() ,
                  )
              ],
            ),
          ),
        )
      );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                "Codehelp".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
                "Trending Courses".text.xl2.make(),

              ], // children
            ); // Column
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog :catalog);
      }
      );
  }
}

class CatalogItem extends StatelessWidget {
 final catalog;

  const CatalogItem({Key? key, @required this.catalog}) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
            children: [
              catalog.name.text.make(),
            ],
          ))
        ],
        )
    ).white.rounded.square(108).make().py16();
  }
}

class CatalogImage extends StatelessWidget {

  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
            image,
          ).box.p8.color(MyTheme.creamColor).make().p16();
  }
}
