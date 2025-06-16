import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';

class TransactionPaymentService {
  final Dio _dio = ApiClient.dio;

  Future<String> issueById(int id) async {
    try {
      final response = await _dio.patch('${TransactionPaymentEndpoints.issueById}$id');
      return response.data['data'];
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
