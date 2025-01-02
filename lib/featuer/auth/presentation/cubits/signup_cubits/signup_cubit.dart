import 'package:bloc/bloc.dart';
import 'package:fruits/featuer/auth/domain/repos/auth_repo.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signup_cubits/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold((failure) => emit(SignupFailuer(message: failure.message)),
        (userEntity) => emit(SignupSuccess(userEntity: userEntity)));
  }
}
