import 'package:dartz/dartz.dart';
import 'package:register_page/core/errors/failure.dart';
import 'package:register_page/core/use_case/use_case.dart';
import 'package:register_page/features/register/domain/entities/user_entity.dart';
import 'package:register_page/features/register/domain/params/user_params.dart';
import 'package:register_page/features/register/domain/repos/register_repo.dart';

class RegisterUseCase extends UseCase<UserEntity, UserParams> {
  final RegisterRepo registerRepo;

  RegisterUseCase(this.registerRepo);

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) async {
    return await registerRepo.register(params);
  }
}
