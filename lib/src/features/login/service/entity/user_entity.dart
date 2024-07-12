import 'package:ecomtest/src/core/util/constant/profile_types.dart';
import 'package:ecomtest/src/core/util/usecase/copyable.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable implements Copyable<UserEntity> {
  ///String User ID with unique 16 character code
  final String? id;

  ///String User name
  final String? name;

  ///String User Email
  final String? email;

  ///String User Mobile
  final String? mobile;

  ///String User photo URL from social sites
  final String? photoUrl;

  ///double User age for restricted contents
  final double? age;

  ///user gender
  final String? gender;

  ///mobile notification token
  final String? token;

  ///is user subscribed and active
  final bool? isActive;

  ///profile type of the user
  final ProfileType? profileType;

  final DateTime? tokenCreatedAt;
  final DateTime? userCreatedAt;
  final DateTime? userLoginAt;

  ///user entity constructor
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.photoUrl,
    required this.age,
    required this.gender,
    required this.token,
    required this.isActive,
    required this.profileType,
    required this.tokenCreatedAt,
    required this.userCreatedAt,
    required this.userLoginAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        mobile,
        photoUrl,
        age,
        gender,
        token,
        isActive,
        profileType,
        tokenCreatedAt,
        userCreatedAt,
        userLoginAt,
      ];

  @override
  bool? get stringify => true;

  ///shallow copy of user entity
  @override
  UserEntity? copy() => UserEntity(
      id: id,
      name: name,
      email: email,
      mobile: mobile,
      photoUrl: photoUrl,
      age: age,
      gender: gender,
      isActive: isActive,
      profileType: profileType,
      token: token,
      tokenCreatedAt: tokenCreatedAt,
      userCreatedAt: userCreatedAt,
      userLoginAt: userLoginAt);

  ///deep copy of user entity
  @override
  UserEntity? copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
    String? photoUrl,
    double? age,
    String? gender,
    String? token,
    bool? isActive,
    ProfileType? profileType,
    DateTime? tokenCreatedAt,
    DateTime? userCreatedAt,
    DateTime? userLoginAt,
  }) =>
      UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        photoUrl: photoUrl ?? this.photoUrl,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        token: token ?? this.token,
        isActive: isActive ?? this.isActive,
        profileType: profileType ?? this.profileType,
        tokenCreatedAt: tokenCreatedAt ?? this.tokenCreatedAt,
        userCreatedAt: userCreatedAt ?? this.userCreatedAt,
        userLoginAt: userLoginAt ?? this.userLoginAt,
      );
}
