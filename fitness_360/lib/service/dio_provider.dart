// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fitness_360/service/config_url.dart';
import 'dart:developer' as developer;



class LoggingInterceptor extends Interceptor {
  LoggingInterceptor();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    developer.log(
      '*** API Request - Start ***',
      name: 'Status API',
    );
    options.headers.forEach((key, v) => printKV(' - $key', v));
    developer.log('');

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    developer.log(
      '*** Api Error - Start ***:',
      name: 'Status API',
    );

    logPrint('URI: ${err.requestOptions.uri}');

    if (err.response != null) {
      logPrint('STATUS CODE: ${err.response?.statusCode?.toString()}');
    }
    logPrint('$err');
    if (err.response != null) {
      printKV('REDIRECT', err.response?.realUri ?? '');
      logPrint('BODY:');
      printAll(err.response?.data.toString());
    }


    developer.log(
      '*** Api Error - End ***:',
      name: 'Status API',
    );
    return handler.next(err);
  }

  

  @override
  Future onResponse(response, ResponseInterceptorHandler handler) async {
    developer.log(
      '*** API Request - Start ***',
      name: 'Status API',
    );

    printKV('URI: ', response.requestOptions.uri);
    printKV('STATUS CODE: ', response.statusCode ?? '');
    logPrint('BODY: ');
    printAll(response.data ?? '');

    developer.log('*** API Request - End ***', name: 'Status API');

    return handler.next(response);
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
  }
}

class ServiceDioProvider {
  ServiceDioProvider() {
    dio.interceptors.add(LoggingInterceptor());
  }
  final dio = Dio();
  final urlDescover = ConfigURL();
  String? token;

  Dio getDio() {

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        

        // options.headers.addAll({'Authorization': controllerSplash?.tokenService});
        // options.headers.addAll({'refUsuarioApp': refPersonal  });
        options.headers.addAll({'Access-Control-Allow-Credentials': true});
        options.headers.addAll({
          'Access-Control-Allow-Headers':
              'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'
        });
        options.headers.addAll({'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'});

       

        var urlSistema = await urlDescover.url(options.path.split('/').first);
        if (urlSistema != null) {
          options.path = options.path.replaceAll(options.path.split('/').first, '');
          options.baseUrl = urlSistema;
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.data.runtimeType == String) {
          response.data = const JsonCodec().decode(response.data)['sucesso'];
          return handler.next(response);
        }
        if (response.data != null) {
          response.data = response.data ;
          return handler.next(response);
        }
        return handler.next(response);
      },
      onError: (e, handler) {
        DioError? erro;
        if (e.response?.statusCode == 401) {
        }
        if (e.response?.data['erro'] != null) {
          erro = DioError(
            type: DioErrorType.other,
            requestOptions: e.requestOptions,
            error: e.response!.data['erro'],
          );
        }
        return handler.next(erro ?? e);
      },
    ));
    return dio;
  }
}
