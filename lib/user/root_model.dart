

import 'package:demojson3/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'root_model.g.dart';

@JsonSerializable()
class Root {
  int status;
  String message;
  List<User> data;

  Root(this.status, this.message, this.data);

  factory Root.fromJson(Map<String, dynamic> json) => _$RootFromJson(json);

  Map<String, dynamic> toJson() => _$RootToJson(this);
}