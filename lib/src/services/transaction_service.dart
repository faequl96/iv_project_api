import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class TransactionService {
  final Dio _dio = ApiClient.dio;

  Future<TransactionResponse> createTransaction(CreateTransactionRequest request) async {
    try {
      final response = await _dio.post(TransactionEndpoints.createTransaction, data: request.toJson());
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<TransactionResponse> getTransactionById(int id) async {
    try {
      final response = await _dio.get('${TransactionEndpoints.getTransactionById}$id');
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<TransactionResponse>> getTransactions() async {
    try {
      final response = await _dio.get(TransactionEndpoints.getTransactions);
      return (response.data['data'] as List).map((json) => TransactionResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<TransactionResponse>> getTransactionsByUserId(String userId) async {
    try {
      final response = await _dio.get('${TransactionEndpoints.getTransactionsByUserId}$userId');
      return (response.data['data'] as List).map((json) => TransactionResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<TransactionResponse> updateTransactionById(int id, UpdateTransactionRequest request) async {
    try {
      final response = await _dio.patch('${TransactionEndpoints.updateTransactionById}$id', data: request.toJson());
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteTransactionById(int id) async {
    try {
      await _dio.delete('${TransactionEndpoints.deleteTransactionById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
