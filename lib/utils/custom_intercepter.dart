import 'package:dio/dio.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../domain/user/model/user.dart';

class CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
    logger.d('가입 데이터 확인 : ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    print('HEADERS = ${response.headers}, DATA = ${response.data}');
    if (response.statusCode == 400) {
      response.data = null;
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    super.onError(err, handler);
  }
}

class LoginInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    UserSession.setJwtTokenHeader(response.headers);
    logger.d("로그인 Dto : ${response.data}");
    super.onResponse(response, handler);
  }
}

class SignedInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = UserSession.getJwtTokenHeader(options.headers);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}

//인터셉터 사용시 예시
//dio.interceptors.add(InterceptorsWrapper(
//onRequest: (Options options, handler) async {
//print('send request：path:${options.path}，baseURL:${options.baseUrl}');
//if (csrfToken == null) {
//print('no token，request token firstly...');
////lock the dio.
//dio.lock();
//tokenDio.get('/token').then((d) {
//options.headers['csrfToken'] = csrfToken = d.data['data']['token'];
//print('request token succeed, value: ' + d.data['data']['token']);
//print( 'continue to perform request：path:${options.path}，baseURL:${options.path}');
//handler.next(options);
//}).catchError((error, stackTrace) {
//handler.reject(error, true);
//}) .whenComplete(() => dio.unlock()); // unlock the dio
//} else {
//options.headers['csrfToken'] = csrfToken;
//handler.next(options);
//}
//}
//));
