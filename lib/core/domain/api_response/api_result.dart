import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiResult<T>{
  final T? data;
  final dynamic error;

  ApiResult([this.data, this.error]);

  factory ApiResult.success(T data) => ApiResult(data);

  factory ApiResult.failure(dynamic error, [T? data]) => ApiResult(data, error);

  T? getOrElse([T? Function(Object)? defaultValue]) {
    if (data == null) {
      return defaultValue == null ? null : defaultValue(toError());
    }else{
      return data!;
    }
  }

  String toError(){
    final e = error!;
    switch(e.runtimeType) {
      case DioException _:
        try{
          if (e.response?.data != null && e.response?.data != '') {
            Logger().e('ERROR: -> ${e.response!.data['error']}');
            if (e.response!.data['message'] != null) {
              return e.response!.data['message'].toString();
            }

            final error = e.response!.data['error'];
            if (error != null && error is String) {
              return error;
            }
          }
        } catch(e){
          return 'Oops! Service is temporarily unavailable';
        }
        break;
      case TimeoutException _:
        return 'Request time out';
      case SocketException _:
        return 'Connection could not be established. Check internet';

      case FormatException _: return (e as FormatException).message;

      case const (String) : return e;
    }
    return 'Oops! an error occurred an request could not be completed';
  }
}