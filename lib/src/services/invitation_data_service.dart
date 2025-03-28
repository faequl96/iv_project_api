import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class InvitationDataService {
  final Dio _dio = ApiClient.dio;

  Future<InvitationDataResponse> getInvitationDataById(int id) async {
    try {
      final response = await _dio.get('${InvitationDataEndpoints.getInvitationDataById}$id');
      return InvitationDataResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<InvitationDataResponse> updateInvitationDataById(int id, UpdateInvitationDataRequest request) async {
    try {
      final response = await _dio.patch('${InvitationDataEndpoints.updateInvitationDataById}$id', data: request.toJson());
      return InvitationDataResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
