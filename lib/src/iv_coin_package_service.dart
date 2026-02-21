import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class IVCoinPackageService {
  Future<IVCoinPackageResponse> create(CreateIVCoinPackageRequest request) async {
    try {
      final response = await ApiHttpClient.postByJson(IVCoinPackageEndpoints.create, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<IVCoinPackageResponse> getById(String id) async {
    try {
      final response = await ApiHttpClient.get('${IVCoinPackageEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<IVCoinPackageResponse>> gets() async {
    try {
      final response = await ApiHttpClient.get(IVCoinPackageEndpoints.gets);
      return (jsonDecode(response.body)['data'] as List).map((json) => IVCoinPackageResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<IVCoinPackageResponse> updateById(String id, UpdateIVCoinPackageRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${IVCoinPackageEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(String id) async {
    try {
      await ApiHttpClient.delete('${IVCoinPackageEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
