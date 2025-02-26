import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/specialization_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
          SpecializationResponseModel specializationResponseModel) =
      SpecializationSuccess;
  const factory HomeState.specializationError({required String message}) =
      SpecializationError;
}
