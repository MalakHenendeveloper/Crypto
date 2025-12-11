import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';

// abstract class HomeDataSource{
//   Future<Either<Fauilers, HomeResponseEntity>>getdata();
// }
//
abstract class HomeDataSource {
  Future<Either<Fauilers, List<HomeResponseEntity>>> getdata({int page = 1});
}
