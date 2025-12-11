import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/domain/Respository/HomeRepository.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// @injectable
// class HomeUseCase{
//   HomeRepository repo;
//   HomeUseCase({required this.repo});
//   Future<Either<Fauilers, HomeResponseEntity>> invok(){
//     return repo.getdata();
//   }
// }
@injectable
class GetHomeDataUseCase {
  HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  Future<Either<Fauilers, List<HomeResponseEntity>>> call({int page = 1}) {
    return repository.fetchHomeData(page: page);
  }
}
