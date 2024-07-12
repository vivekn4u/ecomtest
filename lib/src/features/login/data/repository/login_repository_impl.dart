import 'package:dartz/dartz.dart';
import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/features/login/service/entity/user_entity.dart';
import 'package:ecomtest/src/features/login/service/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

///Queries the datasource for any authentication requests.
///Implements [LoginRepository].
///
///Requires:
/// * [FirebaseLoginDataSource]
@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<Either<Failures, UserEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, bool>> isUserSignedIn() {
    // TODO: implement isUserSignedIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, bool>> signedOutUser() {
    // TODO: implement signedOutUser
    throw UnimplementedError();
  }
}
