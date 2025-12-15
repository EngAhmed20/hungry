import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/network/api_exceptions.dart';
import 'package:hungry/core/network/dio_client.dart';

class ApiService{
  final DioClient dioClient;
  ApiService(this.dioClient);
  Future<Either<ApiError,Map<String,dynamic>>>getData(String endpoint)async{
    try{
      final response=await dioClient.dio.get(endpoint);
      return Right(response.data);
    }on DioException catch(e){
      return Left(ApiException.handleException(e));
    }
  }
  Future<Either<ApiError,Map<String,dynamic>>>postData(String endPoint,dynamic data)async{
    try{
     final response= await dioClient.dio.post(endPoint,data:data);
      return Right(response.data);
    }on DioException catch(e){
      return Left(ApiException.handleException(e));
    }
  }
  Future<Either<ApiError,Map<String,dynamic>>>putData(String endPoint,Map<String,dynamic>data)async{
    try{
      final response= await dioClient.dio.put(endPoint,data:data);
      return Right(response.data);
    }on DioException catch(e){
      return Left(ApiException.handleException(e));
    }
  }
  Future<Either<ApiError,Map<String,dynamic>>>deleteData(String endPoint)async{
    try{
      final response= await dioClient.dio.delete(endPoint);
      return Right(response.data);
    }on DioException catch(e){
      return Left(ApiException.handleException(e));
    }
  }
}