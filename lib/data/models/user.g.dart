// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: asOrNull(json['id']),
      name: asOrNull(json['name']),
      email: asOrNull(json['email']),
      avatar: asOrNull(json['avt']),
      dob: asOrNull(json['dob']),
      phoneNumber: asOrNull(json['phoneNumber']),
      familyId: asOrNull(json['familyId']),
      role: $enumDecodeNullable(_$FamilyRoleEnumMap, json['familyRole']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avt': instance.avatar,
      'dob': instance.dob?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'familyId': instance.familyId,
      'familyRole': _$FamilyRoleEnumMap[instance.role],
    };

const _$FamilyRoleEnumMap = {
  FamilyRole.parent: 'parent',
  FamilyRole.child: 'child',
};

UserStatistic _$UserStatisticFromJson(Map<String, dynamic> json) =>
    UserStatistic(
      members: asOrNull(json['members']),
      locations: asOrNull(json['locations']),
    );

Map<String, dynamic> _$UserStatisticToJson(UserStatistic instance) =>
    <String, dynamic>{
      'members': instance.members,
      'locations': instance.locations,
    };

UserFamily _$UserFamilyFromJson(Map<String, dynamic> json) => UserFamily(
      id: asOrNull(json['id']),
      role: $enumDecodeNullable(_$FamilyRoleEnumMap, json['role']),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserFamilyToJson(UserFamily instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$FamilyRoleEnumMap[instance.role],
      'user': instance.user,
    };
