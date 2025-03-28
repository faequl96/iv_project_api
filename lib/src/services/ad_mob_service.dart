import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class AdMobService {
  final Dio _dio = ApiClient.dio;

  Future<IVCoinResponse> addExtraIVCoins() async {
    try {
      final response = await _dio.post(AdMobEndpoints.addExtraIVCoins);
      return IVCoinResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
