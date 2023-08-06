import 'package:core/networking/networking.dart';
import 'package:dio/dio.dart';

import 'api_constant.dart';

class DioClient {
  final ApiConfigurations configurations;

  DioClient({required this.configurations});

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
        baseUrl: configurations.baseUrlProd,
        connectTimeout: 50000,
        receiveTimeout: 30000);
    final dio = Dio(options);
    options.headers = {'Content-Type': 'application/json'};
    dio.interceptors.addAll([AuthInterceptor()]);
    return dio;
  }
}

class AuthInterceptor extends Interceptor {

  AuthInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjk3ZTU4NzUyZWU5NWEyZWM0NGU5ZWU2ZmRhMjg2MCIsInN1YiI6IjYzZTk3ODE0OTUxMmUxMDBhOTdlMDBhMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fcGy53yU5AbzoQks3pRpPIAxsPCbAtf5-7jzamWRihI",
    };

    // print("Auth Token >> ${options.headers}");
    return super.onRequest(options, handler);
  }
}
