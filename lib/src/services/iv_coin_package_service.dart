import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class IVCoinPackageService {
  final Dio _dio = ApiClient.dio;

  Future<IVCoinPackageResponse> createIVCoinPackage(CreateIVCoinPackageRequest request) async {
    try {
      final response = await _dio.post(IVCoinPackageEndpoints.createIVCoinPackage, data: request.toJson());
      return IVCoinPackageResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IVCoinPackageResponse> getIVCoinPackageById(int id) async {
    try {
      final response = await _dio.get('${IVCoinPackageEndpoints.getIVCoinPackageById}$id');
      return IVCoinPackageResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<IVCoinPackageResponse>> getIVCoinPackages() async {
    try {
      final response = await _dio.get(IVCoinPackageEndpoints.getIVCoinPackages);
      return (response.data['data'] as List).map((json) => IVCoinPackageResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<IVCoinPackageResponse> updateIVCoinPackageById(int id, UpdateIVCoinPackageRequest request) async {
    try {
      final response = await _dio.patch('${IVCoinPackageEndpoints.updateIVCoinPackageById}$id', data: request.toJson());
      return IVCoinPackageResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteIVCoinPackageById(int id) async {
    try {
      await _dio.delete('${IVCoinPackageEndpoints.deleteIVCoinPackageById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
