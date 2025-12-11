
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';

abstract class HomeState{}
class Homeinatial extends HomeState{}
class HomeLoading extends HomeState{}
class HomeError extends HomeState{
  Fauilers fauilers;
  HomeError({required this.fauilers});
}
class HomeSuccess extends HomeState{
  final List<HomeResponseEntity> data;
  HomeSuccess({required this.data});
}