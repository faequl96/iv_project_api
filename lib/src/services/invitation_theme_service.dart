import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class InvitationThemeService {
  final Dio _dio = ApiClient.dio;

  Future<InvitationThemeResponse> createInvitationTheme(CreateInvitationThemeRequest request) async {
    try {
      final response = await _dio.post(InvitationThemeEndpoints.createInvitationTheme, data: request.toJson());
      return InvitationThemeResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationThemeResponse> getInvitationThemeById(int id) async {
    try {
      final response = await _dio.get('${InvitationThemeEndpoints.getInvitationThemeById}$id');
      return InvitationThemeResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationThemeResponse>> getInvitationThemes() async {
    try {
      final response = await _dio.get(InvitationThemeEndpoints.getInvitationThemes);
      return (response.data['data'] as List).map((json) => InvitationThemeResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationThemeResponse>> getInvitationThemesByCategoryId(int categoryId) async {
    try {
      final response = await _dio.get('${InvitationThemeEndpoints.getInvitationThemesByCategoryId}$categoryId');
      return (response.data['data'] as List).map((json) => InvitationThemeResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationThemeResponse> updateInvitationThemeById(int id, UpdateInvitationThemeRequest request) async {
    try {
      final response = await _dio.patch('${InvitationThemeEndpoints.updateInvitationThemeById}$id', data: request.toJson());
      return InvitationThemeResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteInvitationThemeById(int id) async {
    try {
      await _dio.delete('${InvitationThemeEndpoints.deleteInvitationThemeById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
