import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/constants/const.dart';
import 'package:fruits/core/errors/exceptions.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/services/data_service.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/core/services/shared_preferences_singleton.dart';
import 'package:fruits/core/utils/backend_endpoint.dart';
import 'package:fruits/featuer/auth/data/models/user_model.dart';
import 'package:fruits/featuer/auth/domain/entites/user_entity.dart';
import 'package:fruits/featuer/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log("Exceptions in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}");
      return left(ServerFailure("حدث خطاء حاول مره اخري"));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
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

      var userEntity = await getUserData(uid: user.uid);
     await saveUserData(user: userEntity);
      return right(
        userEntity,
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExist, docuementId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(
        userEntity,
      );
    } catch (e) {
      await deleteUser(user);
      log("Exceptions in AuthRepoImpl.signinWithEmailAndPassword: ${e.toString()}");
      return left(
        ServerFailure("حدث خطاء ما . الرجاء المحاوله مره اخري"),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(
        userEntity,
      );
    } catch (e) {
      await deleteUser(user);
      log("Exceptions in AuthRepoImpl.signinWithEmailAndPassword: ${e.toString()}");
      return left(
        ServerFailure("حدث خطاء ما . الرجاء المحاوله مره اخري"),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(
        userEntity,
      );
    } catch (e) {
      await deleteUser(user);
      log("Exceptions in AuthRepoImpl.signinWithEmailAndPassword: ${e.toString()}");
      return left(
        ServerFailure("حدث خطاء ما . الرجاء المحاوله مره اخري"),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData, documentId: uid);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }


}
