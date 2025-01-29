import 'package:crypto_wallets/data/DataSource/auth/authDataSourceImp.dart';
import 'package:crypto_wallets/data/DataSource/auth/authDatasource.dart';
import 'package:crypto_wallets/domain/Entity/UserModel.dart';

import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/Respository/authRepository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  AuthDataSource data;
  AuthRepositoryImp({required this.data});

  @override
  Future<Either<Fauilers, UserModel>> login(
      String email, String password) async {
    var either = await data.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  Future<Either<Fauilers, UserModel>> register(
      String email, String password, String name) async {
    var either = await data.register(email, name, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
