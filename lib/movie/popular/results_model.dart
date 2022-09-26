import 'package:json_annotation/json_annotation.dart';

import 'genre_ids_model.dart';
part 'results_model.g.dart';

@JsonSerializable()
class Result {
  bool? adult;
  String? backdrop_path;
  List<GenreIds>? genreIdsList;
  int? id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  DateTime? release_date;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;

  Result(
      this.adult,
      this.backdrop_path,
      this.genreIdsList,
      this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title, this.video,
      this.vote_average,
      this.vote_count);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String,dynamic> toJson() => _$ResultToJson(this);
}