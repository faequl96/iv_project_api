import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class DiscountCategoryService {
  final Dio _dio = ApiClient.dio;

  Future<DiscountCategoryResponse> createDiscountCategory(DiscountCategoryRequest request) async {
    try {
      final response = await _dio.post(DiscountCategoryEndpoints.createDiscountCategory, data: request.toJson());
      return DiscountCategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<DiscountCategoryResponse> getDiscountCategoryById(int id) async {
    try {
      final response = await _dio.get('${DiscountCategoryEndpoints.getDiscountCategoryById}$id');
      return DiscountCategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<DiscountCategoryResponse>> getDiscountCategories() async {
    try {
      final response = await _dio.get(DiscountCategoryEndpoints.getDiscountCategories);
      return (response.data['data'] as List).map((json) => DiscountCategoryResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<DiscountCategoryResponse> updateDiscountCategoryById(int id, DiscountCategoryRequest request) async {
    try {
      final response = await _dio.patch('${DiscountCategoryEndpoints.updateDiscountCategoryById}$id', data: request.toJson());
      return DiscountCategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteDiscountCategoryById(int id) async {
    try {
      await _dio.delete('${DiscountCategoryEndpoints.deleteDiscountCategoryById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
