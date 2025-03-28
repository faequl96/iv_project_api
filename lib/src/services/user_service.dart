import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class UserService {
  final Dio _dio = ApiClient.dio;

  Future<UserResponse> getUser() async {
    try {
      final response = await _dio.get(UserEndpoints.getUser);
      return UserResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserResponse> getUserById(String id) async {
    try {
      final response = await _dio.get('${UserEndpoints.getUserById}$id');
      return UserResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<UserResponse>> getUsers() async {
    try {
      final response = await _dio.get(UserEndpoints.getUsers);
      return (response.data['data'] as List).map((json) => UserResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserResponse> updateUserById(String id, UserRequest request) async {
    try {
      final response = await _dio.patch('${UserEndpoints.updateUserById}$id', data: request.toJson());
      return UserResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteUser() async {
    try {
      await _dio.delete(UserEndpoints.deleteUser);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteUserById(String id) async {
    try {
      await _dio.delete('${UserEndpoints.deleteUserById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
