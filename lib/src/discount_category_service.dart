import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class DiscountCategoryService {
  final Dio _dio = ApiClient.dio;

  Future<DiscountCategoryResponse> create(DiscountCategoryRequest request) async {
    try {
      final response = await _dio.post(DiscountCategoryEndpoints.create, data: request.toJson());
      return DiscountCategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<DiscountCategoryResponse> getById(int id) async {
    try {
      final response = await _dio.get('${DiscountCategoryEndpoints.getById}$id');
      return DiscountCategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<DiscountCategoryResponse>> gets() async {
    try {
      final response = await _dio.get(DiscountCategoryEndpoints.gets);
      return (response.data['data'] as List).map((json) => DiscountCategoryResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<DiscountCategoryResponse> updateById(int id, DiscountCategoryRequest request) async {
    try {
      final response = await _dio.patch('${DiscountCategoryEndpoints.updateById}$id', data: request.toJson());
      return DiscountCategoryResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await _dio.delete('${DiscountCategoryEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
