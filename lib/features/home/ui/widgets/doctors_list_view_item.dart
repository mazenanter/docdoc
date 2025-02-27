import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/specialization_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, required this.doctorsModel});
  final Doctors doctorsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              width: 110.w,
              height: 120.h,
              'assets/images/Image (1).png',
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
