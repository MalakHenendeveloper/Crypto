import 'package:crypto_wallets/data/model/ChartModel.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';

abstract class CoinsState{}
class CoinsInatial extends CoinsState{}
class CoinsLoading extends CoinsState{}
class CoinsError extends CoinsState{
  Fauilers fauilers;
  CoinsError({required this
  .fauilers});
}
class CoinsSuccess extends CoinsState{
  List<ChartModel>data;
  CoinsSuccess({required this.data});
}