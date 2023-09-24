
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {

  requestLogger(options);

  handler.next(options);
}


void requestLogger(RequestOptions options) {
  debugPrint('Url: ${options.method} ${options.uri}\n');
  if (options.data != null) {
    debugPrint('Request Data: ${options.data}\n');
  }
}