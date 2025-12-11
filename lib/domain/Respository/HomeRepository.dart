import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Fauilers, List<HomeResponseEntity>>> fetchHomeData(
      {int page = 1});
}
