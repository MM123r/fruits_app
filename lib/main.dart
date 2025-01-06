import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/custom_bloc_observer.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/services/shared_preferences_singleton.dart';
import 'package:fruits/featuer/home/presentation/views/home_view.dart';
import 'package:fruits/featuer/intro/splash/splash_screen.dart';
import 'package:fruits/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setupGetit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale("ar")],
        locale: Locale("ar"),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
