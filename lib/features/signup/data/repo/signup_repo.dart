import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/features/signup/data/models/sign_up_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../models/sign_up_request_body.dart';

class SignupRepo {
  final ApiService apiService;

  SignupRepo(this.apiService);

  Future<ApiResult<SignUpResponse>> signup(
      {required SignUpRequestBody signUpRequestBody}) async {
    try {
      var response = await apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }
}
