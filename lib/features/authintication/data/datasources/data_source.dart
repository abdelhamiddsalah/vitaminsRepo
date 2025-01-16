import 'package:vitamins/core/databases/api/dio_consumer.dart';

class DataSource {
  final DioConsumer dioConsumer;

  DataSource(this.dioConsumer);

  Future<dynamic> get(
    String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  ) =>
      dioConsumer.get(path: path, data: data, queryParameters: queryParameters);
}
