
import 'package:demojson3/movie/popular/results_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'popular_model.g.dart';

@JsonSerializable()
class Popular {
  int? page;
List<Result>? results;
int? total_pages;
  int? total_results;

Popular(this.page, this.results, this.total_pages, this.total_results);

factory Popular.fromJson(Map<String, dynamic> json) => _$PopularFromJson(json);
Map<String, dynamic> toJson() => _$PopularToJson(this);
}