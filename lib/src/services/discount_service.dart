import 'package:dio/dio.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_model/iv_project_model.dart';

class DiscountService {
  final Dio _dio = ApiClient.dio;

  Future<DiscountResponse> setProductPrices(DiscountRequest request) async {
    try {
      final response = await _dio.patch(DiscountEndpoints.setProductPrices, data: request.toJson());
      return DiscountResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}
