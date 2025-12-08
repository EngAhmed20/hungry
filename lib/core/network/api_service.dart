import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_exceptions.dart';
import 'package:hungry/core/network/dio_client.dart';

class ApiService{
  final DioClient dioClient;
  ApiService(this.dioClient);
  Future<dynamic>getData(String endpoint)async{
    try{
      final response=await dioClient.dio.get(endpoint);
      return response.data;
    }on DioException catch(e){
      return ApiException.handleException(e);
    }
  }
  Future<dynamic>postData(String endPoint,Map<String,dynamic>data)async{
    try{
     final response= await dioClient.dio.post(endPoint,data:data);
      return response.data;
    }on DioException catch(e){
      return ApiException.handleException(e);
    }
  }
  Future<dynamic>putData(String endPoint,Map<String,dynamic>data)async{
    try{
      final response= await dioClient.dio.put(endPoint,data:data);
      return response.data;
    }on DioException catch(e){
      return ApiException.handleException(e);
    }
  }
  Future<dynamic>deleteData(String endPoint)async{
    try{
      final response= await dioClient.dio.delete(endPoint);
      return response.data;
    }on DioException catch(e){
      return ApiException.handleException(e);
    }
  }
}