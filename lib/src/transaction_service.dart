import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class TransactionService {
  Future<TransactionResponse> create(CreateTransactionRequest request) async {
    try {
      final response = await ApiHttpClient.postByJson(TransactionEndpoints.create, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<TransactionResponse> getById(String id) async {
    try {
      final response = await ApiHttpClient.get('${TransactionEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<TransactionResponse> getByReferenceNumber(String referenceNumber) async {
    try {
      final response = await ApiHttpClient.get('${TransactionEndpoints.getByReferenceNumber}$referenceNumber');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<TransactionResponse>> gets({QueryRequest? query}) async {
    try {
      final response = await ApiHttpClient.get(TransactionEndpoints.gets, data: query?.toJson());
      return (jsonDecode(response.body)['data'] as List).map((json) => TransactionResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<TransactionResponse>> getsByUserId(String userId) async {
    try {
      final response = await ApiHttpClient.get('${TransactionEndpoints.getsByUserId}$userId');
      return (jsonDecode(response.body)['data'] as List).map((json) => TransactionResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<TransactionResponse> updateById(String id, UpdateTransactionRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${TransactionEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(String id) async {
    try {
      await ApiHttpClient.delete('${TransactionEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
