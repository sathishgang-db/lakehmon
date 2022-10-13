class Item {
  final String name;

  final String image;

  Item({required this.name, required this.image});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      image: json['image'],
    );
  }
}
