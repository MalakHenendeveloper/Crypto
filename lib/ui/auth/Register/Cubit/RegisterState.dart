import 'package:crypto_wallets/domain/Entity/UserModel.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';

abstract class RegisterState{}
class RegisterInaitial extends RegisterState{}
class RegisterLoading extends RegisterState{}
class RegisterError extends RegisterState{
  Fauilers fauilers;
  RegisterError({required this.fauilers});
}
class RegisterSuccess extends RegisterState{
  UserModel user;
  RegisterSuccess({required this.user});
}