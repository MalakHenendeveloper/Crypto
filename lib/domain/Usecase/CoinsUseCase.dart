import 'package:crypto_wallets/data/model/ChartModel.dart';
import 'package:crypto_wallets/domain/Respository/CoinsRepository.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class CoinsUseCase{
  CoinsRepository coinsRepository;
  CoinsUseCase({required this.coinsRepository});
 Future<Either<Fauilers, List<ChartModel>>> call(String coinid,  int days)async{
    return await coinsRepository.getcharts(coinid, days);

  }
}