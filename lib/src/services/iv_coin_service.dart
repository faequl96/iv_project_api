import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class IVCoinService {
  final Dio _dio = ApiClient.dio;

  Future<IVCoinResponse> getIVCoin() async {
    try {
      final response = await _dio.get(IVCoinEndpoints.getIVCoin);
      return IVCoinResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IVCoinResponse> getIVCoinById(int id) async {
    try {
      final response = await _dio.get('${IVCoinEndpoints.getIVCoinById}$id');
      return IVCoinResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IVCoinResponse> updateIVCoinById(int id, IVCoinRequest request) async {
    try {
      final response = await _dio.patch('${IVCoinEndpoints.updateIVCoinById}$id', data: request.toJson());
      return IVCoinResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
