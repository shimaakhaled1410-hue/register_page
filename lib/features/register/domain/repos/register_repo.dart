import 'package:dartz/dartz.dart';
import 'package:register_page/core/errors/failure.dart';
import 'package:register_page/features/register/domain/entities/user_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserEntity>> register(
    String username,
    String email,
    String password,
  );
}
