// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignResponseModel _$SignResponseModelFromJson(Map<String, dynamic> json) =>
    SignResponseModel(
      response: ResponseStatus.fromJson(
        json['response'] as Map<String, dynamic>,
      ),
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignResponseModelToJson(SignResponseModel instance) =>
    <String, dynamic>{'response': instance.response, 'data': instance.data};

ResponseStatus _$ResponseStatusFromJson(Map<String, dynamic> json) =>
    ResponseStatus(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResponseStatusToJson(ResponseStatus instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  idMongo: json['_id'] as String,
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  photoUrl: json['photoUrl'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  '_id': instance.idMongo,
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'photoUrl': instance.photoUrl,
  'token': instance.token,
};
