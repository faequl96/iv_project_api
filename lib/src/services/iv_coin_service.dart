import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class IVCoinService {
  final Dio _dio = ApiClient.dio;

  Future<IVCoinResponse> get() async {
    try {
      final response = await _dio.get(IVCoinEndpoints.get);
      return IVCoinResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IVCoinResponse> getById(int id) async {
    try {
      final response = await _dio.get('${IVCoinEndpoints.getById}$id');
      return IVCoinResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IVCoinResponse> updateById(int id, IVCoinRequest request) async {
    try {
      final response = await _dio.patch('${IVCoinEndpoints.updateById}$id', data: request.toJson());
      return IVCoinResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
