import 'package:crypto_wallets/domain/Entity/UserModel.dart';
import 'package:crypto_wallets/domain/Respository/authRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'Fauilers.dart';
@injectable
class LoginUseCase{
  AuthRepository repo;
  LoginUseCase({required this.repo});
  Future<Either<Fauilers, UserModel>> call(String email, String password)async{
    return await repo.login(email, password);
  }
}