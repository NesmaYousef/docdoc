import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String? message;
  final List<ProfileData>? data;
  final bool? status;
  final int? code;

  ProfileResponse({this.message, this.data, this.status, this.code});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@JsonSerializable()
class ProfileData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;

  ProfileData({this.id, this.name, this.email, this.phone, this.gender});

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
