import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:register_page/core/errors/failure.dart';
import 'package:register_page/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:register_page/features/register/domain/entities/user_entity.dart';
import 'package:register_page/features/register/domain/params/user_params.dart';
import 'package:register_page/features/register/domain/repos/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepoImpl(this.registerRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(UserParams params) async {
    try {
      final userModel = await registerRemoteDataSource.register(
        params.username,
        params.email,
        params.password,
      );
      final userEntity = UserEntity(
        username: userModel.username,
        email: userModel.email,
        password: userModel.password,
      );
      return right(userEntity);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(_handleFirebaseError(e)));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  String _handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'The email address is already in use.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'An unexpected error occurred: ${e.message}';
    }
  }
}
