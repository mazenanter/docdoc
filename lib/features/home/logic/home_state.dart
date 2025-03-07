import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/specialization_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
      List<SpecializationData> specializationData) = SpecializationSuccess;
  const factory HomeState.specializationError(ApiErrorModel apiErrorModel) =
      SpecializationError;

  // Doctors State
  const factory HomeState.doctorsSuccess(List<Doctors> doctorsList) =
      DoctorsSuccess;
  const factory HomeState.doctorsError() = DoctorsError;
}
