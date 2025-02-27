import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';

import 'doctors_list_view_item.dart';

class DoctoresListView extends StatelessWidget {
  const DoctoresListView({super.key, required this.doctorsList});
  final List<Doctors> doctorsList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            idnex: index,
            doctorsModel: doctorsList[index],
          );
        },
      ),
    );
  }
}
