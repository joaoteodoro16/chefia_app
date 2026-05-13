import 'package:chefia_app/app/core/rest_client/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';


class AppRestClient extends DioForNative {
  late AuthInterceptor _authInterceptor;

  AppRestClient()
      : super(
          BaseOptions(
            baseUrl: 'http://10.0.2.2:5000/api/',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
    _authInterceptor = AuthInterceptor(dio: this);
  }

  AppRestClient auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  AppRestClient unAuth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}