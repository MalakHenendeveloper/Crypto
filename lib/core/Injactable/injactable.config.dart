// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:crypto_wallets/ui/auth/Register/Cubit/RegisterViewmodel.dart';
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/DataSource/auth/authDatasource.dart' as _i339;
import '../../data/DataSource/auth/authDataSourceImp.dart' as _i986;
import '../../data/DataSource/Coins/CoinsDataSource.dart' as _i66;
import '../../data/DataSource/Coins/COinsDataSourceImp.dart' as _i852;
import '../../data/DataSource/Home/HomeDataSource.dart' as _i227;
import '../../data/DataSource/Home/HomeDataSourceImp.dart' as _i1007;
import '../../data/Respository/authRepository.dart' as _i396;
import '../../data/Respository/CoinsRepositoryimp.dart' as _i81;
import '../../data/Respository/HomeRepositoryImp.dart' as _i553;
import '../../domain/Respository/authRepository.dart' as _i954;
import '../../domain/Respository/CoinsRepository.dart' as _i23;
import '../../domain/Respository/HomeRepository.dart' as _i567;
import '../../domain/Usecase/CoinsUseCase.dart' as _i352;
import '../../domain/Usecase/HomeUseCase.dart' as _i492;
import '../../domain/Usecase/LoginUseCase.dart' as _i117;
import '../../domain/Usecase/RegisterUseCase.dart' as _i128;
import '../../ui/auth/Login/Cubit/LoginViewModel.dart' as _i930;
import '../../ui/Coin/Cubit/CoinsViewModel.dart' as _i847;
import '../../ui/home/Cubit/HomeViewModel.dart' as _i47;
import '../APi/ApiManger.dart' as _i828;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i828.APiManger>(() => _i828.APiManger());
    gh.factory<_i227.HomeDataSource>(
        () => _i1007.HomeDataSourceImp(apiManger: gh<_i828.APiManger>()));
    gh.factory<_i567.HomeRepository>(
        () => _i553.HomeRepositoryImp(dataSource: gh<_i227.HomeDataSource>()));
    gh.factory<_i339.AuthDataSource>(() => _i986.authDataSourceimp());
    gh.factory<_i66.CoinsDataSource>(
        () => _i852.CoinsDataSourceImp(aPiManger: gh<_i828.APiManger>()));
    gh.factory<_i954.AuthRepository>(
        () => _i396.AuthRepositoryImp(data: gh<_i339.AuthDataSource>()));
    gh.factory<_i128.RegisterUseCase>(
        () => _i128.RegisterUseCase(repository: gh<_i954.AuthRepository>()));
    gh.factory<_i23.CoinsRepository>(
        () => _i81.CoinsRepositoryImp(dataSource: gh<_i66.CoinsDataSource>()));
    gh.factory<_i352.CoinsUseCase>(
        () => _i352.CoinsUseCase(coinsRepository: gh<_i23.CoinsRepository>()));
    gh.factory<_i847.CoinsViewmodel>(
        () => _i847.CoinsViewmodel(coins: gh<_i352.CoinsUseCase>()));
    gh.factory<_i492.GetHomeDataUseCase>(
        () => _i492.GetHomeDataUseCase(gh<_i567.HomeRepository>()));
    gh.factory<RegisterViewModel>(
        () => RegisterViewModel(useCase: gh<_i128.RegisterUseCase>()));
    gh.factory<_i117.LoginUseCase>(
        () => _i117.LoginUseCase(repo: gh<_i954.AuthRepository>()));
    gh.factory<_i930.LoginViewModel>(
        () => _i930.LoginViewModel(usecase: gh<_i117.LoginUseCase>()));
    gh.factory<_i47.HomeViewModel>(
        () => _i47.HomeViewModel(useCase: gh<_i492.GetHomeDataUseCase>()));
    return this;
  }
}
