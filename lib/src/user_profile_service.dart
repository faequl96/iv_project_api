import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class UserProfileService {
  final Dio _dio = ApiClient.dio;

  Future<UserProfileResponse> get() async {
    try {
      final response = await _dio.get(UserProfileEndpoints.get);
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserProfileResponse> getById(int id) async {
    try {
      final response = await _dio.get('${UserProfileEndpoints.getById}$id');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
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
            if (logoImage != null) map['logo_image'] = await MultipartFile.fromFile(logoImage.path, filename: 'logo_image');
            return map;
          })),
      });

      final response = await _dio.patch(
        UserProfileEndpoints.update,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<UserProfileResponse> updateById(int id, UserProfileRequest request) async {
    try {
      final response = await _dio.patch('${UserProfileEndpoints.updateById}$id', data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
