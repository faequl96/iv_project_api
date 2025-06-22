import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class InvitationService {
  final Dio _dio = ApiClient.dio;

  Future<InvitationResponse> create(CreateInvitationRequest request) async {
    try {
      final response = await _dio.post(InvitationEndpoints.create, data: request.toJson());
      return InvitationResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationResponse> getById(int id) async {
    try {
      final response = await _dio.get('${InvitationEndpoints.getById}$id');
      return InvitationResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationResponse>> gets() async {
    try {
      final response = await _dio.get(InvitationEndpoints.gets);
      return (response.data['data'] as List).map((json) => InvitationResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationResponse>> getsByUserId(String userId) async {
    try {
      final response = await _dio.get('${InvitationEndpoints.getsByUserId}$userId');
      return (response.data['data'] as List).map((json) => InvitationResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationResponse> updateById(int id, UpdateInvitationRequest request) async {
    try {
      final response = await _dio.patch('${InvitationEndpoints.updateById}$id', data: request.toJson());
      return InvitationResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await _dio.delete('${InvitationEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
