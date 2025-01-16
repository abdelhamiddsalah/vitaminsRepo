import 'package:dio/dio.dart';
import 'package:vitamins/core/databases/api/api_consumer.dart';
import 'package:vitamins/core/databases/api/endpoints.dart';

class DioConsumer extends ApiConsumer {
  final Dio _dio;

  DioConsumer(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: Endpoints.baseUrl, // عدلها حسب عنوان الـ API الخاص بك
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  @override
  Future<dynamic> get({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path!,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<dynamic> post({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await _dio.post(
        path!,
        data: isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<dynamic> put({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await _dio.put(
        path!,
        data: isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<dynamic> delete({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await _dio.delete(
        path!,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleDioError(e);
    }
  }

  void _handleDioError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          throw Exception('Connection Timeout');
        case DioExceptionType.badResponse:
          throw Exception(
              'Received invalid status code: ${error.response?.statusCode}');
        case DioExceptionType.cancel:
          throw Exception('Request to API server was cancelled');
        case DioExceptionType.unknown:
          throw Exception('Connection to API server failed');
        case DioExceptionType.sendTimeout:
          // TODO: Handle this case.
          throw UnimplementedError();
        case DioExceptionType.badCertificate:
          // TODO: Handle this case.
          throw UnimplementedError();
        case DioExceptionType.connectionError:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    } else {
      throw Exception('Unexpected error occurred');
    }
  }
}
