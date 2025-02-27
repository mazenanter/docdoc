import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/home/ui/widgets/doctores_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class SpecializationAndDoctosBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctosBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          specializationLoading: () => setupLoading(),
          specializationSuccess: (specializationResponseModel) {
            var specializations =
                specializationResponseModel.specializationData;
            return setupSuccess(specializations);
          },
          specializationError: (message) => setupError(message),
        );
      },
    );
  }

  Center setupError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Expanded setupSuccess(List<SpecializationData> specializations) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationDataList: specializations,
          ),
          verticalSpace(8),
          DoctoresListView(
            doctorsList: specializations[0].doctorsList,
          ),
        ],
      ),
    );
  }

  SizedBox setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
