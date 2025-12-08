import 'package:dio/dio.dart';
import 'package:hungry/core/utils/pref_helper.dart';

class DioClient{
  final Dio _dio;
  final PrefHelper prefHelper;
  DioClient(this._dio, {required this.prefHelper}){
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options,handler)async{
          final token=prefHelper.getToken();
          if(token!=null&&token.isNotEmpty){
            options.headers['Authorization']='Bearer $token';
          }
          return handler.next(options);

        }
      )
    );
  }
  Dio get dio =>_dio;
}


