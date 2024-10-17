class Product {
  String? id;
  String name;
  String category;
  double price;
  String imageUrl;

  Product({this.id, required this.name, required this.category, required this.price, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String id) {
    return Product(
      id: id,
      name: map['name'],
      category: map['category'],
      price: map['price'],
      imageUrl: map['imageUrl'],
    );
  }
}
