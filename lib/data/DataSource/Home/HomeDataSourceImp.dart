
import 'package:crypto_wallets/core/APi/ApiManger.dart';
import 'package:crypto_wallets/core/APi/Endpoints.dart';
import 'package:crypto_wallets/data/model/HomeResponseDto.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'HomeDataSource.dart';
@Injectable(as: HomeDataSource)
// class HomeDataSourceImp implements HomeDataSource {
//   APiManger aPiManger;
//   HomeDataSourceImp({required this.aPiManger});
//   Future<Either<Fauilers, HomeResponseEntity>> getdata() async {
//     try {
//       var response = await aPiManger.getData(
//         Endpoints.coins,
//       );
//       var HomeResponse = HomeResponseDto.fromJson(response.data);
//       if (response.statusCode! >= 200 && response.statusCode! <= 299) {
//         return Right(HomeResponse);
//       } else {
//         return Left(ServerError(errorMassage: response.statusMessage!));
//       }
//     } catch (e) {
//       return Left(NetworkError(errorMassage: e.toString()));
//     }
//   }
// }
class HomeDataSourceImp implements HomeDataSource {
  final APiManger apiManger;

  HomeDataSourceImp({required this.apiManger});

  @override
  Future<Either<Fauilers, List<HomeResponseEntity>>> getdata({int page = 1}) async {
    try {
      var response = await apiManger.getData(Endpoints.coins, query: {
        'vs_currency': 'usd',
        'sparkline': true,
        'per_page': 20,
        'page': page,
      });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List<HomeResponseEntity> homeResponseList = (response.data as List)
            .map((item) => HomeResponseDto.fromJson(item))
            .toList();
        return Right(homeResponseList);
      } else {
        return Left(ServerError(errorMassage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(errorMassage: e.toString()));
    }
  }
}