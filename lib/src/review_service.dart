import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class ReviewService {
  final Dio _dio = ApiClient.dio;

  Future<ReviewResponse> create(CreateReviewRequest request) async {
    try {
      final response = await _dio.post(ReviewEndpoints.create, data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<ReviewResponse> getById(int id) async {
    try {
      final response = await _dio.get('${ReviewEndpoints.getById}$id');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<ReviewResponse>> gets() async {
    try {
      final response = await _dio.get(ReviewEndpoints.gets);
      return (response.data['data'] as List).map((json) => ReviewResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<ReviewResponse>> getsByInvitationThemeId(int invitationThemeId) async {
    try {
      final response = await _dio.get('${ReviewEndpoints.getsByInvitationThemeId}$invitationThemeId');
      return (response.data['data'] as List).map((json) => ReviewResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<ReviewResponse> updateById(int id, UpdateReviewRequest request) async {
    try {
      final response = await _dio.patch('${ReviewEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await _dio.delete('${ReviewEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
