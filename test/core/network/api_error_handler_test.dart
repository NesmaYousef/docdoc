import 'package:dio/dio.dart';
import 'package:docdoc/core/network/api_error_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiErrorHandler', () {
    test('handles data as a Map with List values (normal case)', () {
      final data = {
        'message': 'Validation failed',
        'code': 422,
        'data': {
          'email': ['The email field is required.'],
          'password': ['The password field is required.']
        }
      };
      
      final result = ApiErrorHandler.handle(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: data,
            statusCode: 422,
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      expect(result.message, 'Validation failed');
      expect(result.code, 422);
      expect(result.errors?['email'], contains('The email field is required.'));
    });

    test('repro: handles data["data"] as a List<dynamic>', () {
      final data = {
        'message': 'Generic error',
        'code': 400,
        'data': ['Error message 1', 'Error message 2']
      };
      
      final result = ApiErrorHandler.handle(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: data,
            statusCode: 400,
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      expect(result.message, 'Generic error');
      expect(result.code, 400);
      expect(result.errors?['error'], contains('Error message 1'));
    });

    test('repro: handles data as null', () {
      final result = ApiErrorHandler.handle(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: null,
            statusCode: 500,
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      expect(result.message, 'Unknown error occurred');
    });

    test('repro: handles data as a String instead of a Map', () {
      final result = ApiErrorHandler.handle(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Internal Server Error',
            statusCode: 500,
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      expect(result.message, 'Unknown error occurred');
    });
  });
}
