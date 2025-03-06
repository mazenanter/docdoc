import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/specialization_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
      List<SpecializationData> specializationData) = SpecializationSuccess;
  const factory HomeState.specializationError({required String message}) =
      SpecializationError;

  // Doctors State
  const factory HomeState.doctorsSuccess(List<Doctors> doctorsList) =
      DoctorsSuccess;
  const factory HomeState.doctorsError({required String message}) =
      DoctorsError;
}
