abstract class ApiConsumer {
  Future<dynamic> get({
     String path,
      Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post({
     String path,
      Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

/*************  ✨ Codeium Command ⭐  *************/
/******  1105bfb5-558c-4203-a1bd-64bc8fa972ae  *******/
  Future<dynamic> put({
     String path,
      Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> delete({
     String path,
      Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}