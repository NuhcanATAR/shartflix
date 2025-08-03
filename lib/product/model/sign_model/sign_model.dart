import 'package:json_annotation/json_annotation.dart';

part 'sign_model.g.dart';

@JsonSerializable()
class SignResponseModel {
  final ResponseStatus response;
  final UserModel data;

  SignResponseModel({required this.response, required this.data});

  factory SignResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignResponseModelToJson(this);
}

@JsonSerializable()
class ResponseStatus {
  final int code;
  final String message;

  ResponseStatus({required this.code, required this.message});

  factory ResponseStatus.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseStatusToJson(this);
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String idMongo;

  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String token;

  UserModel({
    required this.idMongo,
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
