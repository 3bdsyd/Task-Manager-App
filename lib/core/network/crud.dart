import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/core/helper/failures_handling.dart';

class Crud {
  final Dio _dio = Dio();
  Future<Either<Failures, Map<String, dynamic>>> get({
    required final String url,
  }) async {
    try {
      _dio.options.headers['content-Type'] = 'application/json';
      final Response response = await _dio.get(url);
      final Map<String, dynamic> responseData = jsonDecode(
        response.toString(),
      );

      return right(responseData);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          Map response = jsonDecode(e.response.toString());
          return left(Failures(errMessage: response['message']));
        }
        return left(FailuresServer.fromDioException(exType: e.type));
      }
      return left(Failures(errMessage: 'A sudden error occurred, try again'));
    }
  }

  Future<Either<Failures, Map<String, dynamic>>> post({
    required final String url,
    required final Map<String, dynamic> body,
  }) async {
    try {
      _dio.options.headers['content-Type'] = 'application/json';

      final response = await _dio.post(url, data: body);

      final Map<String, dynamic> responseData = jsonDecode(response.toString());

      return right(responseData);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          Map response = jsonDecode(e.response.toString());
          return left(Failures(errMessage: response['message']));
        }
        return left(FailuresServer.fromDioException(exType: e.type));
      }
      return left(Failures(errMessage: 'A sudden error occurred, try again'));
    }
  }

   Future<Either<Failures, Map<String, dynamic>>> put({
    required final String url,
    required final Map<String, dynamic> body,

  }) async {
    try {
      _dio.options.headers['content-Type'] = 'application/json';

      final response = await _dio.put(url, data: body);

      final Map<String, dynamic> responseData = jsonDecode(response.toString());

      return right(responseData);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          Map response = jsonDecode(e.response.toString());
          return left(Failures(errMessage: response['message']));
        }
        return left(FailuresServer.fromDioException(exType: e.type));
      }
      return left(Failures(errMessage: 'A sudden error occurred, try again'));
    }
  }

  Future<Either<Failures, Map<String, dynamic>>> delete({
    required final String url,
  }) async {
    try {
      _dio.options.headers['content-Type'] = 'application/json';
      final Response response = await _dio.delete(url);
      final Map<String, dynamic> responseData = jsonDecode(
        response.toString(),
      );

      return right(responseData);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          Map response = jsonDecode(e.response.toString());
          return left(Failures(errMessage: response['message']));
        }
        return left(FailuresServer.fromDioException(exType: e.type));
      }
      return left(Failures(errMessage: 'A sudden error occurred, try again'));
    }
  }
}
