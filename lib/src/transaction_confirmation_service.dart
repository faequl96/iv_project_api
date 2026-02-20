import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class TransactionConfirmationService {
  final Dio _dio = ApiClient.dio;

  Future<TransactionResponse> manualByAdminById(String id, TransactionConfirmationRequest request) async {
    try {
      final response = await _dio.patch('${TransactionConfirmationEndpoints.manualByAdminById}$id', data: request.toJson());
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
