import 'dart:io';

import 'package:crypto_wallets/domain/Entity/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Injactable/injactable.dart';
import 'core/Resouces/Bloc.dart';
import 'core/Routes/Routes.dart';
import 'core/Routes/RoutesManger.dart';

void main() async {
  //flutter packages pub run build_runner build
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAICmcHX5385ReBSWrKiVo-lfEj7CqGaYI",
              appId: "1:195119510736:android:9744da69f97ff264605ad5",
              messagingSenderId: "195119510736",
              projectId: "cryptowallet-601c2"))
      : await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  String route;
  if (user != null) {
    route = AppRoutes.home;
  } else {
    route = AppRoutes.login;
  }
  runApp(MyApp(
    route: route,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.route});
  String route;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(340, 940),
      builder: (context, child) => MaterialApp(
        home: child,
        initialRoute: AppRoutes.login,
        onGenerateRoute: MangeRoutes.getroutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
