import 'package:docdoc/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import 'widgets/doctores_list_view.dart';
import 'widgets/doctors_blue_container.dart';
import 'widgets/doctors_speciality_list_view.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              20,
              16,
              20,
              28,
            ),
            child: Column(
              children: [
                const HomeTopBar(),
                const DoctorsBlueContainer(),
                verticalSpace(24),
                const DoctorsSpecialitySeeAll(),
                verticalSpace(16),
                const DoctorsSpecialityListView(),
                verticalSpace(8),
                const DoctoresListView(),
              ],
            )),
      ),
    );
  }
}
