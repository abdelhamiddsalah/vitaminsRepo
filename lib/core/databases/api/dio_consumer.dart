import 'package:dio/dio.dart';
import 'package:vitamins/core/errors/exception.dart';

import 'interceptors.dart';

class DioClient {
  
  late final Dio _dio;
  DioClient(): _dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json'
      },
      responseType: ResponseType.json,
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10)
    ),
  )..interceptors.addAll([LoggerInterceptor()]);

  // GET METHOD
  Future<dynamic>  get(
    String url, {
      Map < String,
      dynamic > ? queryParameters,
      Options ? options,
      CancelToken ? cancelToken,
      ProgressCallback ? onReceiveProgress,
    }) async {
    try {
      final  response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    }
    on DioException catch (e) {
      handleDioException(e);
      
    }
   
  }

  // POST METHOD
  Future < Response? > post(
    String url, {
      data,
      Map < String,dynamic > ? queryParameters,
      Options ? options,
      ProgressCallback ? onSendProgress,
      ProgressCallback ? onReceiveProgress,
    }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }on DioException catch (e) {
      handleDioException(e);
    }
    return null;
  }

  // PUT METHOD
  Future < Response?> put(
    String url, {
      dynamic data,
      Map < String,
      dynamic > ? queryParameters,
      Options ? options,
      CancelToken ? cancelToken,
      ProgressCallback ? onSendProgress,
      ProgressCallback ? onReceiveProgress,
    }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }on DioException catch (e) {
      handleDioException(e);
    }
   return null;
  }

  // DELETE METHOD
  Future < dynamic > delete(
    String url, {
      data,
      Map < String,
      dynamic > ? queryParameters,
      Options ? options,
      CancelToken ? cancelToken,
    }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    }on DioException catch (e) {
      handleDioException(e);
    }
  }
}