import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  String role;
  @JsonKey(name: '_id')
  String id;
  String name;
  String email;
  int number;
  String password;
  String? createdAt;
  String? updatedAt;
  String? lastLoginAt;

  User(this.role, this.id, this.name, this.email, this.number, this.password, this.createdAt, this.updatedAt, this.lastLoginAt);


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}