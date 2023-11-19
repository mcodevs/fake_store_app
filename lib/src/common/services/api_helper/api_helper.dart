import 'package:dio/dio.dart';

enum Method {
  get("GET"),
  put("PUT"),
  post("POST"),
  delete("DELETE"),
  patch("PATCH");

  final String method;

  const Method(this.method);
}

final class ApiHelper {
  final Dio _dio;

  String get baseUrl => _dio.options.baseUrl;

  ApiHelper({required String baseUrl})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 20),
          connectTimeout: const Duration(seconds: 20),
          contentType: "application/json",
        ));

  Future<Response> request(
    String path, {
    Method method = Method.get,
    Map<String, Object?>? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
  }) async {
    final response = await _dio.request(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        method: method.method,
      ),
    );
    return response;
  }
}
