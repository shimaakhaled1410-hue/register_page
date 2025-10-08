import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:register_page/features/register/domain/entities/user_entity.dart';
import 'package:register_page/features/register/domain/params/user_params.dart';
import 'package:register_page/features/register/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register(UserParams params) async {
    emit(RegisterLoading());
    final res = await registerUseCase(params);
    res.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (userEntity) => emit(RegisterSuccess(userEntity)),
    );
  }
}
