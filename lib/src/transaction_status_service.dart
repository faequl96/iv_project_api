import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class TransactionStatusService {
  Future<TransactionResponse> checkByReferenceNumber(String referenceNumber) async {
    try {
      final response = await ApiHttpClient.patchByJson('${TransactionStatusEndpoints.checkByReferenceNumber}$referenceNumber');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<TransactionResponse> resetById(String id) async {
    try {
      final response = await ApiHttpClient.patchByJson('${TransactionStatusEndpoints.resetById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
