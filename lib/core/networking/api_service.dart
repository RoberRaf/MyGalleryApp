import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final _dio = Dio();
  final String _baseURL = 'https://flutter.prominaagency.com/api/';
  final String _authorization = "Authorization";
  static String? token;

  ApiService() {
    const timeOutDuration = Duration(seconds: 30);
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: _baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: timeOutDuration,
      receiveTimeout: timeOutDuration,
      sendTimeout: timeOutDuration,
      headers: {
        'Accept': "application/json",
        'Content-Type': "application/json",
      },
    );
    _dio.options = baseOptions;
    if (kDebugMode) _dio.interceptors.add(PrettyDioLogger(requestBody: true));
  }

  Future<Response> get({
    required String endPoint,
  }) async {
    return await _dio.get(
      endPoint,
      options: Options(
        headers: {_authorization: token != null ? "Bearer $token" : ''},
      ),
    );
  }

  Future<Response> post({
    required String endPoint,
    required dynamic requestBody,
    void Function(int, int)? onSendProgress,
  }) async {
    return await _dio.post(
      endPoint,
      data: requestBody,
      onSendProgress: onSendProgress,
      options: Options(
        headers: {
          _authorization: token != null ? "Bearer $token" : '',
        },
      ),
    );
  }
}
