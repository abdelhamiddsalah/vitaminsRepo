class ErrorModel {
  final int statusCode;
  final String message;

  ErrorModel({required this.message, required this.statusCode});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      // تحويل القيمة إلى int باستخدام int.parse() إذا كانت من نوع String
      statusCode: json['status'] is String ? int.parse(json['status']) : json['status'],
      message: json['message'],
    );
  }
}
