import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';
import 'package:path/path.dart' as p;

class InvitationService {
  final Dio _dio = ApiClient.dio;

  Future<InvitationResponse> create(CreateInvitationRequest request, InvitationImageRequest? imageRequest) async {
    try {
      final formData = FormData.fromMap({
        'invitation': jsonEncode(request.toJson()),
        'bride_nickname': request.invitationData.bride.nickname.split(' ').first,
        'groom_nickname': request.invitationData.groom.nickname.split(' ').first,
        'event_time': DateTimeConverter.toJson(
          request.invitationData.receptionEvent.startTime,
        )!.substring(0, 16).replaceAll('-', '_').replaceAll(' ', '_').replaceAll(':', '_'),
        if (imageRequest != null)
          ...(await imageRequest.toFormDataMap((musicAudio, coverImage, brideImage, groomImage, galleries) async {
            final map = <String, dynamic>{};

            if (musicAudio != null) {
              map['music_audio'] = await MultipartFile.fromFile(
                musicAudio.path,
                filename: p.basename(musicAudio.path).replaceAll(' ', '_'),
              );
            }
            if (coverImage != null) map['cover_image'] = await MultipartFile.fromFile(coverImage.path, filename: 'cover_image');
            if (brideImage != null) map['bride_image'] = await MultipartFile.fromFile(brideImage.path, filename: 'bride_image');
            if (groomImage != null) map['groom_image'] = await MultipartFile.fromFile(groomImage.path, filename: 'groom_image');
            for (int i = 0; i < galleries.length; i++) {
              final image = galleries[i];
              if (image != null) map['image_${i + 1}'] = await MultipartFile.fromFile(image.path, filename: 'image_${i + 1}');
            }

            return map;
          })),
      });

      final response = await _dio.post(
        InvitationEndpoints.create,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationResponse> getById(String id) async {
    try {
      final response = await _dio.get('${InvitationEndpoints.getById}$id');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<InvitationResponse>> gets({QueryRequest? query}) async {
    try {
      final response = await _dio.get(InvitationEndpoints.gets, data: query?.toJson());
      return (response.data['data'] as List).map((json) => InvitationResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationResponse> updateById(String id, UpdateInvitationRequest request, InvitationImageRequest? imageRequest) async {
    try {
      final formData = FormData.fromMap({
        'invitation': jsonEncode(request.toJson()),
        'bride_nickname': request.invitationData?.bride.nickname.split(' ').first,
        'groom_nickname': request.invitationData?.groom.nickname.split(' ').first,
        'event_time': request.invitationData?.receptionEvent.startTime != null
            ? DateTimeConverter.toJson(
                request.invitationData?.receptionEvent.startTime,
              )!.substring(0, 16).replaceAll('-', '_').replaceAll(' ', '_').replaceAll(':', '_')
            : null,
        if (imageRequest != null)
          ...(await imageRequest.toFormDataMap((musicAudio, coverImage, brideImage, groomImage, galleries) async {
            final map = <String, dynamic>{};

            if (musicAudio != null) {
              map['music_audio'] = await MultipartFile.fromFile(
                musicAudio.path,
                filename: p.basename(musicAudio.path).replaceAll(' ', '_'),
              );
            }
            if (coverImage != null) map['cover_image'] = await MultipartFile.fromFile(coverImage.path, filename: 'cover_image');
            if (brideImage != null) map['bride_image'] = await MultipartFile.fromFile(brideImage.path, filename: 'bride_image');
            if (groomImage != null) map['groom_image'] = await MultipartFile.fromFile(groomImage.path, filename: 'groom_image');
            for (int i = 0; i < galleries.length; i++) {
              final image = galleries[i];
              if (image != null) map['image_${i + 1}'] = await MultipartFile.fromFile(image.path, filename: 'image_${i + 1}');
            }

            return map;
          })),
      });
      final response = await _dio.patch(
        '${InvitationEndpoints.updateById}$id',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(String id) async {
    try {
      await _dio.delete('${InvitationEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
