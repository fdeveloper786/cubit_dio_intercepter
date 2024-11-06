import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


/// Common Class all API call, just create sendRequest : // TODO: Will add more comments later.
class API {
  Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    _dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: false
    ));
  }

  Dio get sendRequest => _dio;

  // TODO: Will add later for more action.
}