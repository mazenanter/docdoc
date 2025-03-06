import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'specializatiosn_list_view_item.dart';

class SpecializationListView extends StatefulWidget {
  const SpecializationListView(
      {super.key, required this.specializationDataList});
  final List<SpecializationData> specializationDataList;

  @override
  State<SpecializationListView> createState() => _SpecializationListViewState();
}

class _SpecializationListViewState extends State<SpecializationListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              context
                  .read<HomeCubit>()
                  .getDoctorsList(widget.specializationDataList[index].id);
            },
            child: SpecializationsListViewItem(
              specializationData: widget.specializationDataList[index],
              indexPadding: index,
              currentIndex: selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
