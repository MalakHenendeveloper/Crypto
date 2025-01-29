import 'package:crypto_wallets/core/APi/ApiManger.dart';
import 'package:crypto_wallets/core/APi/Endpoints.dart';
import 'package:crypto_wallets/data/DataSource/Coins/CoinsDataSource.dart';
import 'package:crypto_wallets/data/model/ChartModel.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CoinsDataSource)
class CoinsDataSourceImp implements CoinsDataSource{
 APiManger aPiManger;
 CoinsDataSourceImp({required this.aPiManger});
  Future<Either<Fauilers,List< ChartModel>>> getcharts(String coinsid, int days) async{
  try{
    var response= await  aPiManger.getData(Endpoints.selectcoins.
    replaceFirst('coinId', coinsid),query:{'days':days} );
var responsecoins= (response.data as List)
    .map((item) => ChartModel.fromjson(item))
    .toList();
if(response.statusCode!>=200&& response.statusCode!<=299){
  return Right(responsecoins);
}
else{
  return Left(ServerError(errorMassage: response.statusMessage!));
}
  }
      catch(e){
    return Left(NetworkError(errorMassage:e.toString() ));
      }
  }
}