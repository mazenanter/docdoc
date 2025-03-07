import 'package:bloc/bloc.dart';
import 'package:docdoc/core/helpers/extenstions.dart';
import 'package:docdoc/features/home/data/repos/home_repo.dart';
import 'package:docdoc/features/home/logic/home_state.dart';

import '../data/models/specialization_response_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  final HomeRepo _homeRepo;
  List<SpecializationData> specializationsList = [];
  void emitSpecializationsStates() async {
    emit(const HomeState.specializationLoading());
    final result = await _homeRepo.getSpecializations();
    result.when(
      success: (specializationsResponseData) {
        specializationsList = specializationsResponseData.specializationData;

        getDoctorsList(specializationsList.first.id);
        emit(HomeState.specializationSuccess(specializationsList));
      },
      error: (apiErrorModel) {
        emit(HomeState.specializationError(apiErrorModel));
      },
    );
  }

  void getDoctorsList(int specializationId) {
    List<Doctors> doctorsList =
        getDoctorsListBySpecializationId(specializationId);
    if (!doctorsList.isNullOrEmpty) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(const HomeState.doctorsError());
    }
  }

  getDoctorsListBySpecializationId(int specializationId) {
    return specializationsList
        .firstWhere((specialization) => specialization.id == specializationId)
        .doctorsList;
  }
}
