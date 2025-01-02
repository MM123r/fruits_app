import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/featuer/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure,UserEntity>> signinWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure,UserEntity>> signinWithGoogle();

   Future<Either<Failure,UserEntity>> signInWithFacebook(); 
   
   Future<Either<Failure,UserEntity>> signInWithApple();   
}
