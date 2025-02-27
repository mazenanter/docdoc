import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model.dart';

import '../../../../core/networking/api_service.dart';

class HomeRepo {
  final ApiService _apiServices;

  HomeRepo(this._apiServices);

  Future<ApiResult<SpecializationResponseModel>> getSpecializations() async {
    try {
      var response = await _apiServices.getSpecializations();
      return ApiResult.success(response);
    } catch (errorHandler) {
      return ApiResult.error(ErrorHandler.handle(errorHandler));
    }
  }
}
