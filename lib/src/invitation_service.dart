import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';
import 'package:path/path.dart' as p;

class InvitationService {
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
              map['music_audio'] = await http.MultipartFile.fromPath(
                'music_audio',
                musicAudio.path,
                filename: p.basename(musicAudio.path).replaceAll(' ', '_'),
              );
            }
            if (coverImage != null) {
              map['cover_image'] = await http.MultipartFile.fromPath('cover_image', coverImage.path, filename: 'cover_image');
            }
            if (brideImage != null) {
              map['bride_image'] = await http.MultipartFile.fromPath('bride_image', brideImage.path, filename: 'bride_image');
            }
            if (groomImage != null) {
              map['groom_image'] = await http.MultipartFile.fromPath('groom_image', groomImage.path, filename: 'groom_image');
            }
            for (int i = 0; i < galleries.length; i++) {
              final image = galleries[i];
              if (image != null) {
                final String key = 'image_${i + 1}';
                map[key] = await http.MultipartFile.fromPath(key, image.path, filename: key);
              }
            }

            return map;
          })),
      });

      final response = await ApiHttpClient.postByFormData(InvitationEndpoints.create, data: formData);
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<InvitationResponse> getById(String id) async {
    try {
      final response = await ApiHttpClient.get('${InvitationEndpoints.getById}$id');
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<List<InvitationResponse>> gets({QueryRequest? query}) async {
    try {
      final response = await ApiHttpClient.get(InvitationEndpoints.gets, data: query?.toJson());
      return (jsonDecode(response.body)['data'] as List).map((json) => InvitationResponse.fromJson(json)).toList();
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
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
              map['music_audio'] = await http.MultipartFile.fromPath(
                'music_audio',
                musicAudio.path,
                filename: p.basename(musicAudio.path).replaceAll(' ', '_'),
              );
            }
            if (coverImage != null) {
              map['cover_image'] = await http.MultipartFile.fromPath('cover_image', coverImage.path, filename: 'cover_image');
            }
            if (brideImage != null) {
              map['bride_image'] = await http.MultipartFile.fromPath('bride_image', brideImage.path, filename: 'bride_image');
            }
            if (groomImage != null) {
              map['groom_image'] = await http.MultipartFile.fromPath('groom_image', groomImage.path, filename: 'groom_image');
            }
            for (int i = 0; i < galleries.length; i++) {
              final image = galleries[i];
              if (image != null) {
                final String key = 'image_${i + 1}';
                map[key] = await http.MultipartFile.fromPath(key, image.path, filename: key);
              }
            }

            return map;
          })),
      });
      final response = await ApiHttpClient.patchByFormData('${InvitationEndpoints.updateById}$id', data: formData);
      return .fromJson(jsonDecode(response.body)['data']);
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }

  Future<void> deleteById(String id) async {
    try {
      await ApiHttpClient.delete('${InvitationEndpoints.deleteById}$id');
    } catch (e) {
      if (e is String) rethrow;
      throw 'Terjadi kesalahan saat mengolah data.';
    }
  }
}
