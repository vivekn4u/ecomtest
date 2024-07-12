import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecomtest/src/core/util/constant/profile_types.dart';
import 'package:ecomtest/src/features/login/service/entity/user_entity.dart';

///user entity mode adapter class
class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.name,
    super.email,
    super.mobile,
    super.photoUrl,
    super.age,
    super.gender,
    super.token,
    super.isActive,
    super.profileType,
    super.tokenCreatedAt,
    super.userCreatedAt,
    final DateTime? userLoginAt,
  }) : super(
          userLoginAt: userCreatedAt,
        );

  /// get user entity from firebase auth
  factory UserModel.fromFirebaseAuth(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? "Guest",
      email: user.email ?? 'guest@example.com',
      mobile: user.phoneNumber ?? '',
      photoUrl: user.photoURL ?? '',
    );
  }

  ///factory to convert User Entity to Map
  Map<String, dynamic> toMap() {
    return {
      'userID': id,
      'name': name,
      'email': email,
      'phoneNumber': mobile,
      'photoUrl': photoUrl,
      'age': age,
      'gender': gender,
      'token': token,
      'isActive': isActive,
      'profileType': profileType!.name,
      'tokenCreatedAt': tokenCreatedAt,
      'userCreatedAt': userCreatedAt,
      'userLoginAt': userLoginAt,
    };
  }

  /// get user entity from firebase
  factory UserModel.fromFirebase(DocumentSnapshot snapshot) {
    return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  ///factory to convert Map to user Entity
  factory UserModel.fromMap(Map<String, dynamic> map) {
    double age = map['age'] != null && map['age'] is String
        ? double.parse(map['age'])
        : map['age'] ?? 13;

    ProfileType profileType =
        map['profileType'] == null && map['email'] != "guest@ecomtest.com"
            ? ProfileType.notPrime
            : map['profileType'] is String
                ? ProfileType.values.byName(map['profileType'])
                : ProfileType.guest;

    return UserModel(
      id: map['userID'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      mobile: map['phoneNumber'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      age: age,
      gender: map['gender'] ?? '',
      token: map['token'] ?? '',
      isActive: map['isActive'] ?? false,
      profileType: profileType,
      tokenCreatedAt: map['tokenCreatedAt'] == null
          ? DateTime.now()
          : (map['tokenCreatedAt']).toDate(),
      userCreatedAt: map['userCreatedAt'] == null
          ? DateTime.now()
          : (map['userCreatedAt']).toDate(),
      userLoginAt: map['userLoginAt'] == null
          ? DateTime.now()
          : (map['userLoginAt']).toDate(),
    );
  }

  @override
  UserModel? copyWith(
      {String? id,
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
      DateTime? userLoginAt}) {
    return UserModel(
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
}
