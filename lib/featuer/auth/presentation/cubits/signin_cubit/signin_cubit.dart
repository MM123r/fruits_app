 import 'package:bloc/bloc.dart';
import 'package:fruits/featuer/auth/domain/repos/auth_repo.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signin_cubit/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  // signinWithEmailAndPassword
  Future<void> signin(
      String email, String password,) async { //  String name
    emit(SigninLoading());
    final result =
        await authRepo.signinWithEmailAndPassword(email, password, );
    result.fold(
      (failure) => emit(SigninFailuer(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }


// signinWithGoogel
  Future<void> signinWithGoogel() async { 
    emit(SigninLoading());
    final result =
        await authRepo.signinWithGoogle();
    result.fold(
      (failure) => emit(SigninFailuer(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }


  // signInWithFacebook
  Future<void> signInWithFacebook() async { 
    emit(SigninLoading());
    final result =
        await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SigninFailuer(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }


   // signInWithApple
  Future<void> signInWithApple() async { 
    emit(SigninLoading());
    final result =
        await authRepo.signInWithApple();
    result.fold(
      (failure) => emit(SigninFailuer(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }

}
