import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class TransactionPaymentService {
  final Dio _dio = ApiClient.dio;

  Future<TransactionResponse> issueById(String id) async {
    try {
      final response = await _dio.patch('${TransactionPaymentEndpoints.issueById}$id');
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
