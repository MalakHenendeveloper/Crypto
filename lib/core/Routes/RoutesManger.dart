
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/ui/Coin/CoinScreen.dart';
import 'package:crypto_wallets/ui/auth/Login/Login.dart';
import 'package:crypto_wallets/ui/auth/Register/Register.dart';

import 'package:crypto_wallets/ui/home/HomeScreen.dart';
import 'package:crypto_wallets/ui/splash/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'Routes.dart';

class MangeRoutes{
  static Route<dynamic>?getroutes(RouteSettings route){
    switch(route.name){
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_)=>Splashscreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_)=>RegisterScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_)=>Homescreen());

    case AppRoutes.coins:
      var view=route.arguments as HomeResponseEntity;
    return MaterialPageRoute(builder: (_)=>Coinscreen(view: view,));
      default:
        return null;
    }
  }
}