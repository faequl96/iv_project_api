import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class ReviewService {
  Future<ReviewResponse> create(CreateReviewRequest request) async {
    try {
      final response = await ApiHttpClient.postByJson(ReviewEndpoints.create, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<ReviewResponse> getById(int id) async {
    try {
      final response = await ApiHttpClient.get('${ReviewEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<ReviewResponse>> gets() async {
    try {
      final response = await ApiHttpClient.get(ReviewEndpoints.gets);
      return (jsonDecode(response.body)['data'] as List).map((json) => ReviewResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<ReviewResponse>> getsByInvitationThemeId(int invitationThemeId) async {
    try {
      final response = await ApiHttpClient.get('${ReviewEndpoints.getsByInvitationThemeId}$invitationThemeId');
      return (jsonDecode(response.body)['data'] as List).map((json) => ReviewResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<ReviewResponse> updateById(int id, UpdateReviewRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${ReviewEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await ApiHttpClient.delete('${ReviewEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
