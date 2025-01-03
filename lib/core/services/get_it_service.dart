import 'package:fruits/core/services/data_service.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/core/services/firestore_service.dart';
import 'package:fruits/featuer/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits/featuer/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(), 
    ),
  );
}
