import 'package:crypto_wallets/domain/Entity/UserModel.dart';
import 'package:crypto_wallets/domain/Respository/authRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'Fauilers.dart';

@injectable
class RegisterUseCase {
  AuthRepository repository;
  RegisterUseCase({required this.repository});
  Future<Either<Fauilers, UserModel>> invok(
      String emial, String name, String password) async {
    return await repository.register(emial, password, name);
  }
}
