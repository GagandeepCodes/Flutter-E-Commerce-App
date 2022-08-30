import 'package:flutter/material.dart';
import 'package:myfirstproject/models/catalog.dart';


class ItemWidget extends StatelessWidget {
  final String str = "Rs";
  final Item? item;

  const ItemWidget({Key? key, @required this.item}) : assert( item != null ), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: (){
          print("${item!.name} pressed");
        },
        leading : Image.network(item!.image),
        title: Text(item!.name),
        subtitle:Text(item!.desc),
        trailing: Text(
          "\$${item!.price.toString()}",
          textScaleFactor: 1.5,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
    
          ),
        ),
      ),
    );
  }
}