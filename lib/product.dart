class Product {
  String id; // ID sản phẩm
  String name; // Tên sản phẩm
  double price; // Giá sản phẩm
  String category; // Danh mục sản phẩm
  String imageUrl; // URL hình ảnh sản phẩm

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
  });

  // Chuyển đổi từ Map sang Product object
  factory Product.fromMap(Map<String, dynamic> map, String id) {
    return Product(
      id: id, // ID của sản phẩm
      name: map['name'] ?? '', // Nếu name là null thì mặc định là ''
      price: (map['price'] ?? 0).toDouble(), // Đảm bảo price là double
      category: map['category'] ?? '', // Nếu category là null thì mặc định là ''
      imageUrl: map['imageUrl'] ?? '', // Nếu imageUrl là null thì mặc định là ''
    );
  }

  // Chuyển đổi Product object sang Map để lưu vào Firebase
  Map<String, dynamic> toJson() { // Đổi tên phương thức từ toMap thành toJson
    return {
      'name': name,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
    };
  }
}
