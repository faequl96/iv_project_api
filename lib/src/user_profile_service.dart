import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class UserProfileService {
  final Dio _dio = ApiClient.dio;

  Future<UserProfileResponse> get() async {
    try {
      final response = await _dio.get(UserProfileEndpoints.get);
      return UserProfileResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserProfileResponse> getById(int id) async {
    try {
      final response = await _dio.get('${UserProfileEndpoints.getById}$id');
      return UserProfileResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserProfileResponse> update(UserProfileRequest request) async {
    try {
      final response = await _dio.patch(UserProfileEndpoints.update, data: request.toJson());
      return UserProfileResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserProfileResponse> updateById(int id, UserProfileRequest request) async {
    try {
      final response = await _dio.patch('${UserProfileEndpoints.updateById}$id', data: request.toJson());
      return UserProfileResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
