import 'package:dartz/dartz.dart';
import 'package:register_page/core/errors/failure.dart';
import 'package:register_page/features/register/domain/entities/user_entity.dart';
import 'package:register_page/features/register/domain/params/user_params.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserEntity>> register(UserParams params);
}
