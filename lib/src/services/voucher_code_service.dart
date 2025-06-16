import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class VoucherCodeService {
  final Dio _dio = ApiClient.dio;

  Future<VoucherCodeResponse> createVoucherCode(VoucherCodeRequest request) async {
    try {
      final response = await _dio.post(VoucherCodeEndpoints.createVoucherCode, data: request.toJson());
      return VoucherCodeResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<VoucherCodeResponse> getVoucherCodeById(int id) async {
    try {
      final response = await _dio.get('${VoucherCodeEndpoints.getVoucherCodeById}$id');
      return VoucherCodeResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<VoucherCodeResponse> getVoucherCodeByName(String name) async {
    try {
      final response = await _dio.get('${VoucherCodeEndpoints.getVoucherCodeByName}$name');
      return VoucherCodeResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<VoucherCodeResponse> updateVoucherCodeById(int id, VoucherCodeRequest request) async {
    try {
      final response = await _dio.patch('${VoucherCodeEndpoints.updateVoucherCodeById}$id', data: request.toJson());
      return VoucherCodeResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteVoucherCodeById(int id) async {
    try {
      await _dio.delete('${VoucherCodeEndpoints.deleteVoucherCodeById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
