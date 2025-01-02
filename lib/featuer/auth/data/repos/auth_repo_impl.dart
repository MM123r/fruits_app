import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/exceptions.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/featuer/auth/data/models/user_model.dart';
import 'package:fruits/featuer/auth/domain/entites/user_entity.dart';
import 'package:fruits/featuer/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log("Exceptions in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}");
      return left(ServerFailure("حدث خطاء حاول مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log("Exceptions in AuthRepoImpl.signinWithEmailAndPassword: ${e.toString()}");
      return left(ServerFailure("حدث خطاء ما . الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log("Exceptions in AuthRepoImpl.signinWithEmailAndPassword: ${e.toString()}"
      );
      return left(
        ServerFailure("حدث خطاء ما . الرجاء المحاوله مره اخري"),
      );
    }
  }
  


  
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async{
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log("Exceptions in AuthRepoImpl.signinWithEmailAndPassword: ${e.toString()}"
      );
      return left(
        ServerFailure("حدث خطاء ما . الرجاء المحاوله مره اخري"),
      );
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async{
        try {
      var user = await firebaseAuthService.signInWithApple();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log("Exceptions in AuthRepoImpl.signinWithEmailAndPassword: ${e.toString()}"
      );
      return left(
        ServerFailure("حدث خطاء ما . الرجاء المحاوله مره اخري"),
      );
    }
  }
  
}
