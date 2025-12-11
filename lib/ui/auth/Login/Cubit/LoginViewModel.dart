import 'package:crypto_wallets/domain/Usecase/LoginUseCase.dart';
import 'package:crypto_wallets/ui/auth/Login/Cubit/LoginState.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel({required this.usecase}) : super(Logininatial());
  LoginUseCase usecase;

  var email = TextEditingController();
  var password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  login() async {
    var result = await usecase.call(email.text, password.text);
    result.fold((error) => emit(LoginError(fauilers: error)),
        (success) => emit(LoginSuccess(user: success)));
  }
}
