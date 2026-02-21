import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class IVCoinService {
  Future<IVCoinResponse> get() async {
    try {
      final response = await ApiHttpClient.get(IVCoinEndpoints.get);
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<IVCoinResponse> getById(int id) async {
    try {
      final response = await ApiHttpClient.get('${IVCoinEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<IVCoinResponse> updateById(int id, IVCoinRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${IVCoinEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
