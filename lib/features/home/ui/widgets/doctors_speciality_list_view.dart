import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'specializatiosn_list_view_item.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView(
      {super.key, required this.specializationDataList});
  final List<SpecializationData> specializationDataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationDataList.length,
        itemBuilder: (context, index) {
          return SpecializationsListViewItem(
            specializationData: specializationDataList[index],
            indexPadding: index,
          );
        },
      ),
    );
  }
}
