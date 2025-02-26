import 'package:bloc/bloc.dart';
import 'package:docdoc/features/home/data/repos/home_repo.dart';
import 'package:docdoc/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  final HomeRepo _homeRepo;

  void emitSpecializationsStates() async {
    emit(const HomeState.specializationLoading());
    final result = await _homeRepo.getSpecializations();
    result.when(
      success: (specializationsResponseData) {
        emit(HomeState.specializationSuccess(specializationsResponseData));
      },
      error: (errorHandler) {
        emit(HomeState.specializationError(
            message: errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }
}
