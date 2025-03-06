import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/specialization_response_model.dart';

class SpecializationsListViewItem extends StatelessWidget {
  const SpecializationsListViewItem({
    super.key,
    required this.specializationData,
    required this.indexPadding,
    required this.currentIndex,
  });
  final int currentIndex;
  final SpecializationData specializationData;
  final int indexPadding;
  @override
  Widget build(BuildContext context) {
    String photos = specializationData.name == 'Cardiology'
        ? 'assets/images/specializations_image/cardiologist.png'
        : specializationData.name == 'Neurology'
            ? 'assets/images/specializations_image/neurologic.png'
            : specializationData.name == 'Pediatrics'
                ? 'assets/images/specializations_image/pediatric.png'
                : specializationData.name == 'Urology'
                    ? 'assets/images/specializations_image/urologist.png'
                    : 'assets/images/specializations_image/general.png';
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: indexPadding == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          currentIndex == indexPadding
              ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.5,
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.offWhite,
                    child: Image.asset(
                      width: 42.w,
                      height: 42.h,
                      photos,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.offWhite,
                  child: Image.asset(
                    width: 40.w,
                    height: 40.h,
                    photos,
                  ),
                ),
          verticalSpace(8),
          Text(
            specializationData.name,
            style: currentIndex == indexPadding
                ? Styles.font14DarkBlueBold
                : Styles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
