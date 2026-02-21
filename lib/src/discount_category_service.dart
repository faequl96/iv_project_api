import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class DiscountCategoryService {
  Future<DiscountCategoryResponse> create(DiscountCategoryRequest request) async {
    try {
      final response = await ApiHttpClient.postByJson(DiscountCategoryEndpoints.create, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<DiscountCategoryResponse> getById(int id) async {
    try {
      final response = await ApiHttpClient.get('${DiscountCategoryEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<DiscountCategoryResponse>> gets() async {
    try {
      final response = await ApiHttpClient.get(DiscountCategoryEndpoints.gets);
      return (jsonDecode(response.body)['data'] as List).map((json) => DiscountCategoryResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<DiscountCategoryResponse> updateById(int id, DiscountCategoryRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${DiscountCategoryEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await ApiHttpClient.delete('${DiscountCategoryEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
