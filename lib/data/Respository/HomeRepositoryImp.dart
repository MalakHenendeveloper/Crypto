import 'package:crypto_wallets/data/DataSource/Home/HomeDataSource.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/domain/Respository/HomeRepository.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImp({required this.dataSource});

  @override
  Future<Either<Fauilers, List<HomeResponseEntity>>> fetchHomeData(
      {int page = 1}) {
    return dataSource.getdata(page: page);
  }
}
