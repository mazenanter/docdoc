import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/specialization_response_model.dart';

class SpecializationsListViewItem extends StatelessWidget {
  const SpecializationsListViewItem({
    super.key,
    required this.specializationData,
    required this.indexPadding,
  });

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
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsManager.offWhite,
            child: Image.asset(
              width: 24.w,
              photos,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            specializationData.name,
            style: Styles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
