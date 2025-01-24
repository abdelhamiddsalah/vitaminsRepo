// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomException implements Exception {
  final String message;
  CustomException(
    this.message,
  );

  CustomException copyWith({
    String? message,
  }) {
    return CustomException(
      message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory CustomException.fromMap(Map<String, dynamic> map) {
    return CustomException(
      map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomException.fromJson(String source) => CustomException.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'customException(message: $message)';

  @override
  bool operator ==(covariant CustomException other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}