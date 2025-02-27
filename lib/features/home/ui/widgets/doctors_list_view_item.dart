import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/specialization_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem(
      {super.key, required this.doctorsModel, required this.idnex});
  final Doctors doctorsModel;
  final int idnex;
  @override
  Widget build(BuildContext context) {
    List<String> doctorsImages = [
      'assets/images/doctors_images/doctor1.png',
      'assets/images/doctors_images/doctor2.png',
      'assets/images/doctors_images/doctor3.png',
      'assets/images/doctors_images/doctor4.png',
    ];
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              width: 110.w,
              height: 120.h,
              idnex < 4 ? doctorsImages[idnex] : doctorsImages[0],
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel.name,
                  style: Styles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  '${doctorsModel.degree} | ${doctorsModel.phone}',
                  style: Styles.font12GrayMeduim,
                ),
                verticalSpace(5),
                Text(
                  doctorsModel.email,
                  style: Styles.font12GrayMeduim,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
