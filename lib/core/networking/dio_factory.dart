import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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

  static void addHeaders() {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzQwNjc2NDQ1LCJleHAiOjE3NDA3NjI4NDUsIm5iZiI6MTc0MDY3NjQ0NSwianRpIjoiZkdwNmg5UUVXVTBqN2huaiIsInN1YiI6IjEyMTYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.GqonW-cnMSnE6hkAAeZKXgrQscr8Y1TbOpMia4WE8us',
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
