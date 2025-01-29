import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'Endpoints.dart';

@singleton
class APiManger {
  late Dio dio;
  APiManger() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true));
  }
  Future<Response> getData(String endpoint,{ Map<String, dynamic>? query}) {
    return dio.get(Endpoints.Url + endpoint,
        queryParameters: query,
        options: Options(validateStatus: (status) => true));
  }
}