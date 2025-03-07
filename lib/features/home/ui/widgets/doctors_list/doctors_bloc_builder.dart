import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_list/doctores_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          doctorsSuccess: (doctorsList) {
            return setupSuccess(doctorsList);
          },
          doctorsError: () => setupError(),
        );
      },
    );
  }

  Widget setupSuccess(List<Doctors> doctorsList) {
    return DoctoresListView(doctorsList: doctorsList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
