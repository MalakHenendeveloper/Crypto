
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/domain/Usecase/HomeUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'HomeState.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel({required this.useCase}) : super(Homeinatial());
  GetHomeDataUseCase useCase;

  getData() async {
    emit(HomeLoading());
    var results = await useCase.call();
    results.fold((error) => emit(HomeError(fauilers: error)),
        (success) {
          emit(HomeSuccess(data: success));
        });
  }
}
