import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiException{
  static ApiError handleException(DioException error){
    switch(error.type){
      case DioExceptionType.cancel:
        return ApiError(message: 'Request to API server was cancelled');
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive timeout in connection with API server');
      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Send timeout in connection with API server');
      case DioExceptionType.badResponse:
        if(error.response!=null){
          final statusMessage=error.response?.data['message']??'something went wrong';
          return ApiError(message: statusMessage);
        }else{
          return ApiError(message: 'Received invalid response from server');
        }
      default:
        return ApiError(message: 'Something went wrong');
    }
  }
}