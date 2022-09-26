
import 'package:json_annotation/json_annotation.dart';
part 'genre_ids_model.g.dart';

@JsonSerializable()
class GenreIds {
  int? number;
  GenreIds(this.number);

  factory GenreIds.fromJson(Map<String, dynamic> json) => _$GenreIdsFromJson(json);
  Map<String, dynamic> toJson() => _$GenreIdsToJson(this);
}