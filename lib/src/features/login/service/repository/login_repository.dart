import 'package:dartz/dartz.dart';
import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/features/login/service/entity/user_entity.dart';

/// remote login repository interface
abstract class LoginRepository {
  ///get User data from google login
  // Future<Either<Failures, UserEntity>> getUserFromGoogleApi();

  ///get current user data from app
  Future<Either<Failures, UserEntity>> getCurrentUser();

  ///update current user data from app
  // Future<Either<Failures, UserEntity>> updateCurrentUser(UserEntity entity);

  ///check if the user is signed in
  Future<Either<Failures, bool>> isUserSignedIn();

  ///signed out the user from application
  Future<Either<Failures, bool>> signedOutUser();
}
