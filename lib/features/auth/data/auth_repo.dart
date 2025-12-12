import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/core/utils/pref_helper.dart';
import 'package:hungry/features/auth/data/user_model.dart';

class AuthRepo{
  final ApiService apiService;
  final PrefHelper prefHelper;

  AuthRepo({required this.apiService,required this.prefHelper});
  Future<Either<ApiError,UserData>>login({required String email,required String password})async {
    final data={
      'email':email,
      'password':password,
    };
    final response=await apiService.postData('/login', data);
    return response.fold((failure)=>Left(failure), (json){
      final UserData userData=UserData.fromJson(json);
      prefHelper.saveToken(userData.token!);
      return Right(userData);
    });
  }
  Future<Either<ApiError,UserData>>register({required String name,required String email,required String password})async{
    final data={
      'name':name,
      'email':email,
      'password':password,
    };
    final response=await apiService.postData('/register',data);
    return response.fold((failure){
      return Left(ApiError(message: 'The email has already been taken.'));}, (json){
      final UserData userData=UserData.fromJson(json);
      prefHelper.saveToken(userData.token!);
      return Right(userData);
    });

  }

}