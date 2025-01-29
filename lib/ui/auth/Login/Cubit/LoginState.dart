import 'package:crypto_wallets/domain/Entity/UserModel.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';

abstract class LoginState{}
 class Logininatial extends LoginState{}
 class LoginLoading extends LoginState{}
 class LoginError extends LoginState{
  Fauilers fauilers;
  LoginError({required this.fauilers});
 }
 class LoginSuccess extends LoginState{
  UserModel user;
  LoginSuccess({required this.user});
 }
