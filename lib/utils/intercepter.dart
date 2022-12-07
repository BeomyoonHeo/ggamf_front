import 'package:dio/dio.dart';

class Interceptor {
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) =>
      handler.next(options);

  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) =>
      handler.next(response);

  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) =>
      handler.next(err);
}
