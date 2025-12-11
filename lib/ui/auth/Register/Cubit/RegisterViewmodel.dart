import 'package:crypto_wallets/domain/Usecase/RegisterUseCase.dart';
import 'package:crypto_wallets/ui/auth/Register/Cubit/RegisterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterState>{
  RegisterViewModel({required this.useCase}):super(RegisterInaitial());
  RegisterUseCase useCase;
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  register()async{
    var result=await  useCase.invok(email.text, name.text, password.text);
    result.fold((error)=>emit(RegisterError(fauilers: error)),
            (success)=>emit(RegisterSuccess(user: success)));
  }
}