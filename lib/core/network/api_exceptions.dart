import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiException {
  static ApiError handleException(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ApiError(message: 'Request to API server was cancelled');
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive timeout in connection with API server');
      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Send timeout in connection with API server');
      case DioExceptionType.badResponse:
        if (error.response != null) {
          final dynamic data = error.response!.data;
          String apiErrMsg = 'Something went wrong';

          if (data is Map && data['message'] != null) {
            apiErrMsg = data['message'].toString();
          }
          else if (data is String) {
            apiErrMsg = 'Something went wrong please try again';
          }

          return ApiError(message: apiErrMsg);
        } else {
          return ApiError(message: 'Received invalid response from server');
        }

      default:
        return ApiError(message: 'Something went wrong');
    }
  }
}
/*
import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiException {
  static ApiError handleException(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ApiError(message: 'Request to API server was cancelled');
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive timeout in connection with API server');
      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Send timeout in connection with API server');
      case DioExceptionType.badResponse:
        if (error.response != null) {
          final dynamic data = error.response!.data;
          String apiErrMsg = 'Something went wrong';

          // إذا الـ data Map
          if (data is Map) {
            // أولاً: رسالة عامة
            if (data['message'] != null) {
              apiErrMsg = data['message'].toString();
            }
            // ثانياً: إذا فيه errors مفصلة (مثل الفورم)
            else if (data['errors'] != null && data['errors'] is Map) {
              final firstField = data['errors'].keys.first;
              final firstMsgList = data['errors'][firstField];
              if (firstMsgList is List && firstMsgList.isNotEmpty) {
                apiErrMsg = firstMsgList.first.toString();
              }
            }
          }
          // إذا الـ data String (مثل HTML أو نص)
          else if (data is String) {
            apiErrMsg = 'Server returned non-JSON response';
          }

          return ApiError(message: apiErrMsg);
        } else {
          return ApiError(message: 'Received invalid response from server');
        }

      default:
        return ApiError(message: 'Something went wrong');
    }
  }
}

 */