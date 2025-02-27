// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationResponseModel _$SpecializationResponseModelFromJson(
        Map<String, dynamic> json) =>
    SpecializationResponseModel(
      specializationData: (json['data'] as List<dynamic>)
          .map((e) => SpecializationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationResponseModelToJson(
        SpecializationResponseModel instance) =>
    <String, dynamic>{
      'data': instance.specializationData,
    };

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      doctorsList: (json['doctors'] as List<dynamic>)
          .map((e) => Doctors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctorsList,
    };

Doctors _$DoctorsFromJson(Map<String, dynamic> json) => Doctors(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      photo: json['photo'] as String,
      gender: json['gender'] as String,
      degree: json['degree'] as String,
      price: (json['appoint_price'] as num).toInt(),
      phone: json['phone'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$DoctorsToJson(Doctors instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'gender': instance.gender,
      'degree': instance.degree,
      'appoint_price': instance.price,
      'phone': instance.phone,
      'email': instance.email,
    };
