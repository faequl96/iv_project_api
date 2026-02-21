import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class CategoryService {
  Future<CategoryResponse> create(CategoryRequest request) async {
    try {
      final response = await ApiHttpClient.postByJson(CategoryEndpoints.create, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<CategoryResponse> getById(int id) async {
    try {
      final response = await ApiHttpClient.get('${CategoryEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<CategoryResponse>> gets() async {
    try {
      final response = await ApiHttpClient.get(CategoryEndpoints.gets);
      return (jsonDecode(response.body)['data'] as List).map((json) => CategoryResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<CategoryResponse> updateById(int id, CategoryRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${CategoryEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await ApiHttpClient.delete('${CategoryEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
