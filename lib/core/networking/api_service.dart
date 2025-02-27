import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/models/login_response.dart';
import 'package:docdoc/features/signup/data/models/sign_up_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/signup/data/models/sign_up_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.signUp)
  Future<SignUpResponse> signup(
    @Body() SignUpRequestBody signUpRequestBody,
  );

  @GET(ApiConstants.specializationEP)
  Future<SpecializationResponseModel> getSpecializations();
}
