import 'package:core/core.dart';
import 'package:features/data/models/movie_model.dart';

class MoviesResponse extends BaseMappable {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MoviesResponse({this.page, this.results, this.totalPages, this.totalResults});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieModel>[];
      json['results'].forEach((v) {
        results!.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];

    return MoviesResponse(page: page, results: results, totalPages: totalPages, totalResults: totalResults);
  }
}

