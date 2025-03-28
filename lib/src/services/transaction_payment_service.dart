import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class TransactionPaymentService {
  final Dio _dio = ApiClient.dio;

  Future<TransactionResponse> issueById(int id) async {
    try {
      final response = await _dio.post('${TransactionPaymentEndpoints.issueById}$id');
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
