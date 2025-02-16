import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';
@JsonSerializable()
class SignUpResponse {
  final String message;
  final bool status;
  final int code;
  final UserData data;

  SignUpResponse(
    this.status,
    this.code,
    this.data, {
    required this.message,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  UserData({required this.token, required this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
