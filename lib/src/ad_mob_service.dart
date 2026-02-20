import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class AdMobService {
  final Dio _dio = ApiClient.dio;

  Future<IVCoinResponse> addExtraIVCoins(AdMobRequest request) async {
    try {
      final response = await _dio.post(AdMobEndpoints.addExtraIVCoins, data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
