import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class VoucherCodeService {
  final Dio _dio = ApiClient.dio;

  Future<VoucherCodeResponse> create(VoucherCodeRequest request) async {
    try {
      final response = await _dio.post(VoucherCodeEndpoints.create, data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<VoucherCodeResponse> getById(int id) async {
    try {
      final response = await _dio.get('${VoucherCodeEndpoints.getById}$id');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<VoucherCodeResponse> getByName(String name) async {
    try {
      final response = await _dio.get('${VoucherCodeEndpoints.getByName}$name');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<VoucherCodeResponse>> gets() async {
    try {
      final response = await _dio.get(VoucherCodeEndpoints.gets);
      return (response.data['data'] as List).map((json) => VoucherCodeResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<VoucherCodeResponse> updateById(int id, VoucherCodeRequest request) async {
    try {
      final response = await _dio.patch('${VoucherCodeEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await _dio.delete('${VoucherCodeEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
