import 'package:json_annotation/json_annotation.dart';

part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  final List<SpecializationData> specializationData;

  SpecializationResponseModel({required this.specializationData});
  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationData {
  final int id;
  final String name;
  final List<Doctors> doctorsList;

  SpecializationData(
      {required this.id, required this.name, required this.doctorsList});
  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);
}

@JsonSerializable()
class Doctors {
  final String id;
  final String name;
  final String image;
  final String gender;
  final String degree;
  final int price;
  final String phone;
  final String email;

  Doctors(
      {required this.id,
      required this.name,
      required this.image,
      required this.gender,
      required this.degree,
      required this.price,
      required this.phone,
      required this.email});
  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);
}
