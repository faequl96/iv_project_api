import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class DiscountService {
  Future<DiscountResponse> setProductPrices(DiscountRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson(DiscountEndpoints.setProductPrices, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
