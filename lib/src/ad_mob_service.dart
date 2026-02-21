import 'dart:convert';

import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class AdMobService {
  Future<IVCoinResponse> addExtraIVCoins(AdMobRequest request) async {
    try {
      final response = await ApiHttpClient.postByJson(AdMobEndpoints.addExtraIVCoins, data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
