import 'package:dio/dio.dart';

abstract class Http {
  Future<T> get<T>(
    String path,
    T Function(dynamic json) parser, {
    Map<String, String>? queryParameters,
  });
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  @override
  String toString() => 'NetworkException: $message';
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException(DioException e)
    : super('Unauthorized (401). Please log in again.');
}

class NotFoundException extends NetworkException {
  NotFoundException(DioException e) : super('Resource not found (404).');
}

class DioHttp implements Http {
  final String baseUrl;
  late Dio _dio;

  DioHttp(this.baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        // 设置连接超时时间
        connectTimeout: const Duration(seconds: 15),
        // 设置接收超时时间
        receiveTimeout: const Duration(seconds: 15),
        // 通用请求头
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer YOUR_TOKEN', // 如果需要全局认证
        },
      ),
    );
  }

  @override
  Future<T> get<T>(
    String path,
    T Function(dynamic json) parser, {
    Map<String, String>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // 2. 将响应数据 (response.data) 通过传入的解析函数转换为 T 类型
        final dynamic jsonData = response.data;

        // 如果数据为空，可能需要抛出异常或返回默认值，这里我们假设非空
        if (jsonData == null) {
          throw Exception('Response data is null for path: $path');
        }

        return parser(jsonData); // 使用传入的 parser 函数进行反序列化
      } else {
        // 如果 HTTP 状态码不在成功的范围内，且没有被 Dio 捕获为 DioException，
        // 则抛出一般异常（这在实际中很少发生，因为 Dio 会处理非 2xx 状态码）
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage;
      if (e.response != null) {
        // 1. 服务器返回的错误 (如 404, 500, 401)
        final statusCode = e.response!.statusCode;
        final responseData = e.response!.data; // 错误响应体

        // 通常，我们会根据状态码和响应体来构建自定义错误信息
        errorMessage =
            'Server error [$statusCode]: ${responseData ?? e.message}';

        // 可以根据具体的业务需求抛出更精确的异常
        if (statusCode == 401) {
          // 重新抛出自定义的认证失败异常
          throw UnauthorizedException(e);
        } else if (statusCode == 404) {
          throw NotFoundException(e);
        }
      } else {
        // 2. 客户端或网络相关的错误 (如连接超时、DNS 错误、网络断开)
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage = 'Connection timeout. Check your internet.';
            break;
          case DioExceptionType.sendTimeout:
            errorMessage = 'Send timeout in connection with API server.';
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = 'Receive timeout in connection with API server.';
            break;
          case DioExceptionType.badResponse:
            // 当服务器返回 4xx/5xx 时，如果被 Dio 认为是 "Bad Response"
            errorMessage =
                'Bad Response received from server: ${e.response?.statusCode}';
            break;
          case DioExceptionType.cancel:
            errorMessage = 'Request to API server was cancelled.';
            break;
          case DioExceptionType.unknown:
          default:
            errorMessage = 'An unknown error occurred: ${e.message}';
            break;
        }
      }

      // 捕获并重新抛出自定义的通用网络异常
      throw NetworkException(errorMessage);
    }
  }
}
