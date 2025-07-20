import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class UserService {
  final Dio _dio = ApiClient.dio;

  Future<UserResponse> get() async {
    try {
      final response = await _dio.get(UserEndpoints.get);
      return UserResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserResponse> getById(String id) async {
    try {
      final response = await _dio.get('${UserEndpoints.getById}$id');
      return UserResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<UserResponse>> gets({QueryRequest? query}) async {
    try {
      final response = await _dio.get(UserEndpoints.gets, data: query?.toJson());
      return (response.data['data'] as List).map((json) => UserResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserResponse> updateById(String id, UserRequest request) async {
    try {
      final response = await _dio.patch('${UserEndpoints.updateById}$id', data: request.toJson());
      return UserResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> delete() async {
    try {
      await _dio.delete(UserEndpoints.delete);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(String id) async {
    try {
      await _dio.delete('${UserEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
