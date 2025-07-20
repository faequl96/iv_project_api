import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class InvitationDataService {
  final Dio _dio = ApiClient.dio;

  Future<InvitationDataResponse> getById(int id) async {
    try {
      final response = await _dio.get('${InvitationDataEndpoints.getById}$id');
      return InvitationDataResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationDataResponse> updateById(int id, UpdateInvitationDataRequest request) async {
    try {
      final response = await _dio.patch('${InvitationDataEndpoints.updateById}$id', data: request.toJson());
      return InvitationDataResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
