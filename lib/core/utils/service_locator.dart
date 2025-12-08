
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/core/network/dio_client.dart';
import 'package:hungry/core/utils/pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_endpoints.dart';

final getIt=GetIt.instance;
class ServiceLocator{
  void setUp()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    final Dio dio=Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type':'application/json',},

        )
    );
    getIt.registerLazySingleton<SharedPreferences>(()=>sharedPreferences);
    getIt.registerLazySingleton<Dio>(()=>dio);
    getIt.registerLazySingleton<PrefHelper>(()=>PrefHelper(getIt<SharedPreferences>()));
    getIt.registerLazySingleton<DioClient>(()=>DioClient(getIt.get<Dio>(), prefHelper: getIt.get<PrefHelper>()));
    getIt.registerLazySingleton<ApiService>(()=>ApiService(getIt.get<DioClient>()));


  }

}