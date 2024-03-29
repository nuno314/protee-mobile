// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/data_checker.dart';
import 'user.dart';

part 'family.g.dart';

@JsonSerializable()
class Family {
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? id;
  @JsonKey(name: 'createdAt', fromJson: asOrNull)
  DateTime? createdAt;
  @JsonKey(name: 'name', fromJson: asOrNull)
  String? name;
  Family({
    this.id,
    this.createdAt,
    this.name,
  });

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyToJson(this);
}

@JsonSerializable()
class JoinFamilyRequest {
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? id;
  @JsonKey(name: 'createdBy', fromJson: asOrNull)
  String? createdBy;
  @JsonKey(name: 'user')
  User? user;

  JoinFamilyRequest({
    this.id,
    this.createdBy,
    this.user,
  });

  factory JoinFamilyRequest.fromJson(Map<String, dynamic> json) =>
      _$JoinFamilyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$JoinFamilyRequestToJson(this);
}

@JsonSerializable()
class FamilyStatistic {
  @JsonKey(name: 'numberMembers', fromJson: asOrNull)
  int? numberMembers;
  @JsonKey(name: 'numberLocations', fromJson: asOrNull)
  int? numberLocations;
  @JsonKey(name: 'numberWarningTimes', fromJson: asOrNull)
  int? numberWarningTimes;

  FamilyStatistic({
    this.numberMembers,
    this.numberLocations,
    this.numberWarningTimes,
  });

  factory FamilyStatistic.fromJson(Map<String, dynamic> json) =>
      _$FamilyStatisticFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyStatisticToJson(this);
}
