class Product {
  final String name;
  final String? detail;
  final String imageUrl;
  final String category;
  final int price;
  final int? discount;
  final int available;

  Product(this.detail, this.discount,
      {required this.name,
      required this.imageUrl,
      required this.category,
      required this.price,
      required this.available});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json["detail"],
      json["discount_percentage"],
      name: json["name"],
      imageUrl: json["image_path"],
      category: json["category"],
      price: json["price"],
      available: json["available"],
    );
  }
}
