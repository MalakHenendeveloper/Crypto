import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/domain/Usecase/HomeUseCase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'HomeState.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  GetHomeDataUseCase useCase;
  ScrollController scrollController = ScrollController();
  List<HomeResponseEntity> allCoins = [];
  int currentPage = 1;
  bool isMoreLoading = false;

  getData() async {
    if (currentPage == 1) emit(HomeLoading());

    var results = await useCase.call(page: currentPage);
    results.fold((error) {
      if (currentPage == 1) emit(HomeError(fauilers: error));
    }, (success) {
      allCoins.addAll(success);
      isMoreLoading = false;
      emit(HomeSuccess(data: allCoins)); // Emit all data
    });
  }

  void getMoreData() {
    if (isMoreLoading) return;
    isMoreLoading = true;
    currentPage++;
    getData();
  }

  HomeViewModel({required this.useCase}) : super(Homeinatial()) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
  }
}
