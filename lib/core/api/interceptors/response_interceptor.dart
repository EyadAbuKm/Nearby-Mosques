


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide Response;

import '../../../shared/utils/common_widget.dart';
import '../../models/error_model.dart';

void responseInterceptor(Response response, ResponseInterceptorHandler handler)  async {
  EasyLoading.dismiss();
  responseLogger(response);
  if (response.statusCode != 200 && response.statusCode != 201) {
    handleErrorStatus(response);
  }
  handler.next(response); // Continue with the response

}


void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 404:
    case 400:
      final message = ErrorResponse.fromJson(response.data);
      CommonWidget.snackBar(message.error);
      break;

    default:
      CommonWidget.snackBar("SomethingWentWrong".tr);
      break;
  }
}

void responseLogger(Response response) {
  debugPrint('Status Code: ${response.statusCode}\n');
  debugPrint('Data: ${response.data ?? ''}');
}
