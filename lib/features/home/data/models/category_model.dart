import 'package:vitamins/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.id, required super.name, required super.image});
  
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
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

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      image: image,
    );
  }
}