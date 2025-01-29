import 'package:crypto_wallets/domain/Entity/UserModel.dart';

class UserModelDto extends UserModel{
  UserModelDto({
   super.id,
   super.email,
   super.name,
});
  UserModelDto.fromjson(Map<String, dynamic>json):this(
id:json['id'],
    name: json['name'],
    email:json['email']
);
Map<String, dynamic>  tojson(){
  return{
    'id':id,
    'name':name,
    'email':email
  };
}
}