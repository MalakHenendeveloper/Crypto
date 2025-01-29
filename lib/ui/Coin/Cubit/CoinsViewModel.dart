import 'package:crypto_wallets/domain/Usecase/CoinsUseCase.dart';
import 'package:crypto_wallets/ui/Coin/Cubit/CoinsState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
@injectable
class CoinsViewmodel extends Cubit<CoinsState>{
  CoinsViewmodel(
  {required this.coins}
      ):super(CoinsInatial());
  CoinsUseCase coins;
int selectdate=0;
  final Map<String, int> daysMap = {
    'D': 1,
    'W': 7,
    'M': 30,
    '3M': 90,
    '6M': 180,

  };
  List<String>text=[
    'D', 'W', 'M','3M','6M',
  ];
  var track=TrackballBehavior(enable: true, activationMode:ActivationMode.singleTap);
  gecharts(String coinid,  int days)async{
   emit(CoinsLoading());
   var results= await coins.call(coinid, days);
   results.fold((error)=>emit(CoinsError(fauilers: error)),
       (success)=>emit(CoinsSuccess(data: success))
   );
  }

}