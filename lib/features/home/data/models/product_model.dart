import 'package:vitamins/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.description,
    required super.image,
    required super.category,
    required super.details,
    required super.isDeal,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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

  // Convert ProductModel to ProductEntity
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      description: description,
      image: image,
      category: category,
      details: details,
      isDeal: isDeal,
    );
  }
}