import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class IVCoinPackageService {
  final Dio _dio = ApiClient.dio;

  Future<IVCoinPackageResponse> create(CreateIVCoinPackageRequest request) async {
    try {
      final response = await _dio.post(IVCoinPackageEndpoints.create, data: request.toJson());
      return IVCoinPackageResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IVCoinPackageResponse> getById(int id) async {
    try {
      final response = await _dio.get('${IVCoinPackageEndpoints.getById}$id');
      return IVCoinPackageResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<IVCoinPackageResponse>> gets() async {
    try {
      final response = await _dio.get(IVCoinPackageEndpoints.gets);
      return (response.data['data'] as List).map((json) => IVCoinPackageResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IVCoinPackageResponse> updateById(int id, UpdateIVCoinPackageRequest request) async {
    try {
      final response = await _dio.patch('${IVCoinPackageEndpoints.updateById}$id', data: request.toJson());
      return IVCoinPackageResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await _dio.delete('${IVCoinPackageEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
