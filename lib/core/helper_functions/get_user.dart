import 'package:fruits/core/constants/const.dart';
import 'package:fruits/core/services/shared_preferences_singleton.dart';
import 'package:fruits/featuer/auth/data/models/user_model.dart';
import 'package:fruits/featuer/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonString);
  return userEntity;
}
