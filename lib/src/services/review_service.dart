import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class ReviewService {
  final Dio _dio = ApiClient.dio;

  Future<ReviewResponse> createReview(CreateReviewRequest request) async {
    try {
      final response = await _dio.post(ReviewEndpoints.createReview, data: request.toJson());
      return ReviewResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<ReviewResponse> getReviewById(int id) async {
    try {
      final response = await _dio.get('${ReviewEndpoints.getReviewById}$id');
      return ReviewResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<ReviewResponse>> getReviews() async {
    try {
      final response = await _dio.get(ReviewEndpoints.getReviews);
      return (response.data['data'] as List).map((json) => ReviewResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<ReviewResponse>> getReviewsByInvitationThemeId(int invitationThemeId) async {
    try {
      final response = await _dio.get('${ReviewEndpoints.getReviewsByInvitationThemeId}$invitationThemeId');
      return (response.data['data'] as List).map((json) => ReviewResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<ReviewResponse> updateReviewById(int id, UpdateReviewRequest request) async {
    try {
      final response = await _dio.patch('${ReviewEndpoints.updateReviewById}$id', data: request.toJson());
      return ReviewResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteReviewById(int id) async {
    try {
      await _dio.delete('${ReviewEndpoints.deleteReviewById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
