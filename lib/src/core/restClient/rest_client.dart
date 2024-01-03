import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: 'http://192.168.3.127:8080/',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
      ),
    ]);
  }

  RestClient get auth {
    options.extra['ACCESS_TOKEN'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['ACCESS_TOKEN'] = false;
    return this;
  }
}
