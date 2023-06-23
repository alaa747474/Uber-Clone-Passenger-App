import 'package:dio/dio.dart';
import 'package:uber_clone/core/constants/app_end_points.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);

  Future<Response> getData(
      {String endPoint = '',
      Map<String, dynamic>? queryParameters}) async {
    Response response = await _dio.get(AppEndPosints.baseUrl+endPoint,
        queryParameters: queryParameters,
        );
    return response;
  }

  Future<Response> postData(
      {required String endPoint, dynamic data, String? token}) async {
    Response response = await _dio.post(AppEndPosints.baseUrl + endPoint,
        data: data,
      );
    return response;
  }

  Future<Response> putData(
      {String endPoint = '', dynamic data, String? token}) async {
    Response response = await _dio.put(AppEndPosints.baseUrl + endPoint,
        data: data,
        options: Options(headers: {
          'authorization': token ?? '',
          'Content-Type': 'application/json'
        }));
    return response;
  }

  Future<Response> deleteData({String endPoint = "", String? token}) async {
    Response response = await _dio.delete(AppEndPosints.baseUrl + endPoint,
        options: Options(headers: {
          'authorization': token ?? '',
          'Content-Type': 'application/json'
        }));
    return response;
  }
}
