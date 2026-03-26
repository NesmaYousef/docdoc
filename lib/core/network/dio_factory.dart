import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/constants.dart';
import '../helpers/shared_pref_helper.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 60);

    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      await addDioHeaders();
      addDioInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static Future<void> addDioHeaders() async {
    final token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    _dio?.options.headers = {
      'Accept': 'application/json',
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
