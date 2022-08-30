class CatalogModel {
  // we make it static so that we can directly access it using catalog Model
  static final items = [
  Item(
    id: "Lovebabbar",
    name: "Pointersin C++",
    desc: "All about pointers with questions",
    color: "Black",
    price: 5,
    image: "https://i.ytimg.com/vi/YHwEIfrXZgE/maxresdefault.jpg",
  )
  ];
}
class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id,
  required  this.name,
  required  this.desc,
  required this.price,
  required  this.color,
  required  this.image});
}