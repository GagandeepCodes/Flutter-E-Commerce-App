class CatalogModel {
  // we make it static so that we can directly access it using catalog Model
  static List<Item> items = [
  ];
}
class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  //constructor
  Item({required this.id,
  required  this.name,
  required  this.desc,
  required this.price,
  required  this.color,
  required  this.image});
  
  factory Item.formMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      price: map["price"],
      name : map["name"],
      desc: map["desc"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
      "id": id,
      "price": price,
      "name" : name,
      "desc" : desc,
      "color": color,
      "image": image
  };
}