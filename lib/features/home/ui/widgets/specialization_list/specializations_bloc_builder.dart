import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:docdoc/features/home/ui/widgets/specialization_list/speciality_shimmer_loading.dart';
import 'package:docdoc/features/home/ui/widgets/specialization_list/specialization_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({
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
            var specializations = specializationResponseModel;
            return setupSuccess(specializations);
          },
          specializationError: (message) =>
              setupError(message.getAllErrorMessages()),
        );
      },
    );
  }

  Center setupError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget setupSuccess(List<SpecializationData> specializations) {
    return SpecializationListView(
      specializationDataList: specializations,
    );
  }

  Expanded setupLoading() {
    return Expanded(
        child: Column(
      children: [
        const SpecialityShimmerLoading(),
        verticalSpace(8),
        const DoctorsShimmerLoading(),
      ],
    ));
  }
}
