import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'specializations_response_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class SpecializationsResponseModel {
  @HiveField(0)
  @JsonKey(name: 'data')
  List<SpecializationsData?>? specializationDataList;

  SpecializationsResponseModel({
    this.specializationDataList,
  });

  factory SpecializationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseModelFromJson(json);
}

@HiveType(typeId: 1)
@JsonSerializable()
class SpecializationsData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  @JsonKey(name: 'doctors')
  List<Doctors?>? doctorsList;

  SpecializationsData({
    this.id,
    this.name,
    this.doctorsList,
  });

  factory SpecializationsData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsDataFromJson(json);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Doctors {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  String? photo;
  @HiveField(5)
  String? gender;
  @HiveField(6)
  @JsonKey(name: 'appoint_price')
  int? price;
  @HiveField(7)
  String degree;

  Doctors({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.price,
    required this.degree,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);
}