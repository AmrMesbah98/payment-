import 'package:dio/dio.dart';

import '../Constant/const.dart';

class DioHelper {
  static Dio? dio;

  static initDio() => dio = Dio(BaseOptions(
      baseUrl: Constant.baseUrl,
      headers: {'content-Type': 'application/json'},
      receiveDataWhenStatusError: true));

  static Future<Response> postData(
      {required String url, Map<String, dynamic>? data}) async {
    return await dio!.post(url, data: data);
  }
}
