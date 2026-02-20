import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class CategoryService {
  final Dio _dio = ApiClient.dio;

  Future<CategoryResponse> create(CategoryRequest request) async {
    try {
      final response = await _dio.post(CategoryEndpoints.create, data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<CategoryResponse> getById(int id) async {
    try {
      final response = await _dio.get('${CategoryEndpoints.getById}$id');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<CategoryResponse>> gets() async {
    try {
      final response = await _dio.get(CategoryEndpoints.gets);
      return (response.data['data'] as List).map((json) => CategoryResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<CategoryResponse> updateById(int id, CategoryRequest request) async {
    try {
      final response = await _dio.patch('${CategoryEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await _dio.delete('${CategoryEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
