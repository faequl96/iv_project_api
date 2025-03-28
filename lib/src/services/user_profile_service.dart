import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class UserProfileService {
  final Dio _dio = ApiClient.dio;

  Future<UserProfileResponse> getUserProfile() async {
    try {
      final response = await _dio.get(UserProfileEndpoints.getUserProfile);
      return UserProfileResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserProfileResponse> getUserProfileById(int id) async {
    try {
      final response = await _dio.get('${UserProfileEndpoints.getUserProfileById}$id');
      return UserProfileResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserProfileResponse> updateUserProfile(UserProfileRequest request) async {
    try {
      final response = await _dio.patch(UserProfileEndpoints.updateUserProfile, data: request.toJson());
      return UserProfileResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserProfileResponse> updateUserProfileById(int id, UserProfileRequest request) async {
    try {
      final response = await _dio.patch('${UserProfileEndpoints.updateUserProfileById}$id', data: request.toJson());
      return UserProfileResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
