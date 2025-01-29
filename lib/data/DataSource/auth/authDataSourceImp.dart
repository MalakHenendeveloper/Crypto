import 'package:crypto_wallets/data/DataSource/auth/authDatasource.dart';
import 'package:crypto_wallets/domain/Entity/UserModel.dart';
import 'package:crypto_wallets/domain/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthDataSource)
 class authDataSourceimp implements AuthDataSource{
  @override
  Future<Either<Fauilers, UserModel>> login(String email, String password)async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      var user=UserModel(id:credential.user?.uid, name:credential.user?.displayName
          , email:credential.user?.email );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      return Left(ServerError(errorMassage:'user-not-found'));
      } else if (e.code == 'wrong-password') {
        return Left(ServerError(errorMassage:'wrong-password'));
      }
      else {
        return Left(ServerError(errorMassage: 'Wrong .'));
      }

    }
    catch(e
    ){
      return Left(NetworkError(errorMassage:' Network Error'));
    }
  }

  @override
  Future<Either<Fauilers, UserModel>> register(String email, String name, String password) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user=UserModel(
        id:credential.user!.uid??'',
        name: credential.user?.displayName??'loka',
        email: credential.user?.email??''
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      return Left(ServerError(errorMassage:'weak-password' ));
      } else if (e.code == 'email-already-in-use') {
        return Left(ServerError(errorMassage:'email-already-in-use' ));
      }
      else{
        return Left(ServerError(errorMassage:  'An unknown error occurred.'));
      }
    } catch (e) {
      return Left(NetworkError(errorMassage:e.toString() ));
    }
  }
}