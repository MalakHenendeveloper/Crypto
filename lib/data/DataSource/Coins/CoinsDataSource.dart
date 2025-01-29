import 'package:crypto_wallets/data/model/ChartModel.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';

abstract class CoinsDataSource{
  Future<Either<Fauilers, List<ChartModel>>>getcharts(String id,  int days);
}