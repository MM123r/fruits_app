import 'package:flutter/material.dart';
import 'package:fruits/featuer/auth/domain/entites/user_entity.dart';

@immutable
class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess({required this.userEntity});
}

final class SigninFailuer extends SigninState {
  final String message;

  SigninFailuer({required this.message});

}
