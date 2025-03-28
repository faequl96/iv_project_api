import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class InvitationService {
  final Dio _dio = ApiClient.dio;

  Future<InvitationResponse> createInvitation(CreateInvitationRequest request) async {
    try {
      final response = await _dio.post(InvitationEndpoints.createInvitation, data: request.toJson());
      return InvitationResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationResponse> getInvitationById(int id) async {
    try {
      final response = await _dio.get('${InvitationEndpoints.getInvitationById}$id');
      return InvitationResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationResponse>> getInvitations() async {
    try {
      final response = await _dio.get(InvitationEndpoints.getInvitations);
      return (response.data['data'] as List).map((json) => InvitationResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationResponse>> getInvitationsByUserId(String userId) async {
    try {
      final response = await _dio.get('${InvitationEndpoints.getInvitationsByUserId}$userId');
      return (response.data['data'] as List).map((json) => InvitationResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationResponse> updateInvitationById(int id, UpdateInvitationRequest request) async {
    try {
      final response = await _dio.patch('${InvitationEndpoints.updateInvitationById}$id', data: request.toJson());
      return InvitationResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteInvitationById(int id) async {
    try {
      await _dio.delete('${InvitationEndpoints.deleteInvitationById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
