import 'package:crypto_wallets/domain/Entity/UserModel.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either<Fauilers, UserModel>>login(String email,String password);
  Future<Either<Fauilers, UserModel>>register(String email,String password,String name,);
}