import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class InvitationThemeService {
  final Dio _dio = ApiClient.dio;

  Future<InvitationThemeResponse> create(CreateInvitationThemeRequest request) async {
    try {
      final response = await _dio.post(InvitationThemeEndpoints.create, data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationThemeResponse> getById(int id) async {
    try {
      final response = await _dio.get('${InvitationThemeEndpoints.getById}$id');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationThemeResponse>> gets({QueryRequest? query}) async {
    try {
      final response = await _dio.get(InvitationThemeEndpoints.gets, data: query?.toJson());
      return (response.data['data'] as List).map((json) => InvitationThemeResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationThemeResponse>> getsByCategoryId(int categoryId) async {
    try {
      final response = await _dio.get('${InvitationThemeEndpoints.getsByCategoryId}$categoryId');
      return (response.data['data'] as List).map((json) => InvitationThemeResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationThemeResponse> updateById(int id, UpdateInvitationThemeRequest request) async {
    try {
      final response = await _dio.patch('${InvitationThemeEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await _dio.delete('${InvitationThemeEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
