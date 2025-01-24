class CategoryEntity {
  final String id;
  final String name;
  final String image;

  CategoryEntity({required this.id, required this.name, required this.image});

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
    };
  }
}