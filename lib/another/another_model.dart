

import 'package:demojson3/another/rating_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'another_model.g.dart';

@JsonSerializable()
class Another {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Another(this.id, this.title, this.price, this.description, this.category, this.image, this.rating);

  factory Another.fromJson(Map<String, dynamic> json) {
    return _$AnotherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnotherToJson(this);
}