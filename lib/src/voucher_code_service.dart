import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class VoucherCodeService {
  Future<VoucherCodeResponse> create(VoucherCodeRequest request) async {
    try {
      final response = await ApiHttpClient.postByJson(VoucherCodeEndpoints.create, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<VoucherCodeResponse> getById(int id) async {
    try {
      final response = await ApiHttpClient.get('${VoucherCodeEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<VoucherCodeResponse> getByName(String name) async {
    try {
      final response = await ApiHttpClient.get('${VoucherCodeEndpoints.getByName}$name');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<VoucherCodeResponse>> gets() async {
    try {
      final response = await ApiHttpClient.get(VoucherCodeEndpoints.gets);
      return (jsonDecode(response.body)['data'] as List).map((json) => VoucherCodeResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<VoucherCodeResponse> updateById(int id, VoucherCodeRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${VoucherCodeEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await ApiHttpClient.delete('${VoucherCodeEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
