class ProductEntity {
  final String id;
  final String name;
  final double price;
  final String description;
  final String image;
  final String category;
  final String details;
  final bool isDeal;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.details,
    required this.isDeal,
  });

  // تحويل البيانات من JSON إلى كائن Product
  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['_id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
      details: json['details'],
      isDeal: json['isDeal'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
      'details': details,
      'isDeal': isDeal,
    };
  }
}
