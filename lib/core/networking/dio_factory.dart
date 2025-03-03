import 'package:dio/dio.dart';
import 'package:docdoc/core/helpers/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/shared_pref_helper.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.sendTimeout = timeOut;
      dio!.options.receiveTimeout = timeOut;
      addInterceptors();
      addHeaders();
      return dio!;
    }
    return dio!;
  }

  static void addHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getString(SharedPrefKeys.TOKEN)}',
    };
  }

  static setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void addInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
