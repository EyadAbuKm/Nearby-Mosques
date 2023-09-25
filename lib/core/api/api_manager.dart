import 'package:dio/dio.dart';
import 'package:masjidi/core/api/api.dart';

import '../enums/request_type_enum.dart';


class ApiManager {
  static ApiManager? _instance;

  static ApiManager getInstance() {
    return _instance ??= new ApiManager();
  }

  static ApiManager get instance => _instance ??= new ApiManager();

  late BaseOptions options;

  Dio _dio = Dio();

  ApiManager() {
    options = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout:  Duration(seconds: 30),
        headers: headers

    );

    _dio = Dio(options);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: requestInterceptor,
      onResponse: responseInterceptor
    ));  }

  final headers = {
    'Content-Type': 'application/json',
  };




  Future<dynamic> execute({
    required RequestType type,
    required String endPoint,
    dynamic data,
    dynamic newHeaders,
  }) async {
    if (newHeaders != null) {
      _dio.options.headers.addAll(newHeaders);
    } else {
      _dio.options.headers.addAll(headers);
    }


    var response = await _dio.request(
      ApiConstants.baseUrl + endPoint,
      data: data,
      options: Options(
          method: type.value,
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: _dio.options.headers),
    );
    print(response.data);
    return response.data;
  }
}
