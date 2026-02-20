import 'package:dio/dio.dart';
import 'package:iv_project_api_core/iv_project_api_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

class TransactionStatusService {
  final Dio _dio = ApiClient.dio;

  Future<TransactionResponse> checkByReferenceNumber(String referenceNumber) async {
    try {
      final response = await _dio.patch('${TransactionStatusEndpoints.checkByReferenceNumber}$referenceNumber');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<TransactionResponse> resetById(String id) async {
    try {
      final response = await _dio.patch('${TransactionStatusEndpoints.resetById}$id');
      return .fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
