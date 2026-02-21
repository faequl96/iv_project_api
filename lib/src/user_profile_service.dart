import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class UserProfileService {
  Future<UserProfileResponse> get() async {
    try {
      final response = await ApiHttpClient.get(UserProfileEndpoints.get);
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<UserProfileResponse> getById(int id) async {
    try {
      final response = await ApiHttpClient.get('${UserProfileEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<UserProfileResponse> update(UserProfileRequest request, String userId, LogoImageRequest? imageRequest) async {
    try {
      final formData = FormData.fromMap({
        'user_profile': jsonEncode(request.toJson()),
        'user_id': userId,
        if (imageRequest != null)
          ...(await imageRequest.toFormDataMap((logoImage) async {
            final map = <String, dynamic>{};
            if (logoImage != null) {
              map['logo_image'] = await http.MultipartFile.fromPath('logo_image', logoImage.path, filename: 'logo_image');
            }
            return map;
          })),
      });

      final response = await ApiHttpClient.patchByFormData(UserProfileEndpoints.update, data: formData);
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<UserProfileResponse> updateById(int id, UserProfileRequest request) async {
    try {
      final response = await ApiHttpClient.patchByJson('${UserProfileEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
