import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class UserService {
  Future<UserResponse> get() async {
    try {
      final response = await ApiHttpClient.get(UserEndpoints.get);
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<UserResponse> getById(String id) async {
    try {
      final response = await ApiHttpClient.get('${UserEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<UserResponse>> gets({QueryRequest? query}) async {
    try {
      final response = await ApiHttpClient.get(UserEndpoints.gets, data: query?.toJson());
      return (jsonDecode(response.body)['data'] as List).map((json) => UserResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<UserResponse> updateById(String id, UserRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${UserEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> delete() async {
    try {
      await ApiHttpClient.delete(UserEndpoints.delete);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(String id) async {
    try {
      await ApiHttpClient.delete('${UserEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
