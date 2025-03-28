import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class CategoryService {
  final Dio _dio = ApiClient.dio;

  Future<CategoryResponse> createCategory(CategoryRequest request) async {
    try {
      final response = await _dio.post(CategoryEndpoints.createCategory, data: request.toJson());
      return CategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<CategoryResponse> getCategoryById(int id) async {
    try {
      final response = await _dio.get('${CategoryEndpoints.getCategoryById}$id');
      return CategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<CategoryResponse>> getCategories() async {
    try {
      final response = await _dio.get(CategoryEndpoints.getCategories);
      return (response.data['data'] as List).map((json) => CategoryResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<CategoryResponse> updateCategoryById(int id, CategoryRequest request) async {
    try {
      final response = await _dio.patch('${CategoryEndpoints.updateCategoryById}$id', data: request.toJson());
      return CategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteCategoryById(int id) async {
    try {
      await _dio.delete('${CategoryEndpoints.deleteCategoryById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
