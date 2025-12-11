import 'package:crypto_wallets/data/DataSource/Coins/CoinsDataSource.dart';
import 'package:crypto_wallets/data/model/ChartModel.dart';
import 'package:crypto_wallets/domain/Respository/CoinsRepository.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CoinsRepository)
class CoinsRepositoryImp implements CoinsRepository{
CoinsDataSource dataSource;
CoinsRepositoryImp({required this
.dataSource});
  Future<Either<Fauilers, List<ChartModel>>> getcharts(String coinid,  int days)async {
  var either=await dataSource.getcharts(coinid, days);
  return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}