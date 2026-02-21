import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class InvitationThemeService {
  Future<InvitationThemeResponse> create(CreateInvitationThemeRequest request) async {
    try {
      final response = await ApiHttpClient.postByJson(InvitationThemeEndpoints.create, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<InvitationThemeResponse> getById(int id) async {
    try {
      final response = await ApiHttpClient.get('${InvitationThemeEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<InvitationThemeResponse>> gets({QueryRequest? query}) async {
    try {
      final response = await ApiHttpClient.get(InvitationThemeEndpoints.gets, data: query?.toJson());
      return (jsonDecode(response.body)['data'] as List).map((json) => InvitationThemeResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<InvitationThemeResponse>> getsByCategoryId(int categoryId) async {
    try {
      final response = await ApiHttpClient.get('${InvitationThemeEndpoints.getsByCategoryId}$categoryId');
      return (jsonDecode(response.body)['data'] as List).map((json) => InvitationThemeResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<InvitationThemeResponse> updateById(int id, UpdateInvitationThemeRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${InvitationThemeEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await ApiHttpClient.delete('${InvitationThemeEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
