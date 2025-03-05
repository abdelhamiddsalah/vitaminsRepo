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
}