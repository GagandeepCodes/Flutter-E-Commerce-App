class Item{
  final String? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}
final product = [
  Item(
    id: "Lovebabbar",
    name: "Pointersin C++",
    desc: "All about pointers with questions",
    price: 100,
    image: "https://i.ytimg.com/vi/YHwEIfrXZgE/maxresdefault.jpg",
  )
];