abstract class Fauilers{
  String errorMassage;
  Fauilers({required this.errorMassage});
}
class ServerError extends Fauilers{
  ServerError({required super.errorMassage});
}
class NetworkError extends Fauilers{
  NetworkError({required super.errorMassage});
}