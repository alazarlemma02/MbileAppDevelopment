class GroceryItem {
  String? id;
  String? name;
  String? description;
  double? price;
  String? image;

  GroceryItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  GroceryItem.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    image = json["imageUrl"];
  }
}
