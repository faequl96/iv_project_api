import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class TransactionService {
  final Dio _dio = ApiClient.dio;

  Future<TransactionResponse> create(CreateTransactionRequest request) async {
    try {
      print('tesss');
      final response = await _dio.post(TransactionEndpoints.create, data: request.toJson());
      print('tesss');
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<TransactionResponse> getById(String id) async {
    try {
      final response = await _dio.get('${TransactionEndpoints.getById}$id');
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<TransactionResponse> getByReferenceNumber(String referenceNumber) async {
    try {
      final response = await _dio.get('${TransactionEndpoints.getByReferenceNumber}$referenceNumber');
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<TransactionResponse>> gets() async {
    try {
      final response = await _dio.get(TransactionEndpoints.gets);
      return (response.data['data'] as List).map((json) => TransactionResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<List<TransactionResponse>> getsByUserId(String userId) async {
    try {
      final response = await _dio.get('${TransactionEndpoints.getsByUserId}$userId');
      return (response.data['data'] as List).map((json) => TransactionResponse.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<TransactionResponse> updateById(String id, UpdateTransactionRequest request) async {
    try {
      print(request.toJson());
      final response = await _dio.patch('${TransactionEndpoints.updateById}$id', data: request.toJson());
      return TransactionResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> deleteById(String id) async {
    try {
      await _dio.delete('${TransactionEndpoints.deleteById}$id');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
