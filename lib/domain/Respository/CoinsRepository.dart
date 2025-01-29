import 'package:crypto_wallets/data/model/ChartModel.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';

abstract class CoinsRepository{
  Future<Either<Fauilers, List<ChartModel>>>getcharts(String coinid,  int days);
}