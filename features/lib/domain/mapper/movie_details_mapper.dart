import 'package:core/core.dart';
import 'package:features/data/models/movie_details/movie_details_response.dart';

import '../entity/movie_details_entity.dart';

class MovieDetailsMapper extends Mapper<MovieDetailsResponse, MovieDetailsEntity> {
  @override
  List<MovieDetailsEntity> fromModelListToEntityList(
      List<MovieDetailsResponse>? modelList) {
    return modelList
            ?.map((model) => MovieDetailsEntity(
                model.id ?? 0,
                model.title ?? "",
                "https://image.tmdb.org/t/p/w342${model.posterPath}",
                model.voteAverage ?? 0.0,
                model.overview ?? "",
                model.genres?.map((e) => e.name ?? "").join("-") ?? "",
                model.releaseDate?.substring(0, 4) ?? "",model.video??false))
            .toList() ??
        [];
  }

  @override
  MovieDetailsEntity fromModelToEntity(MovieDetailsResponse model) {
    return MovieDetailsEntity(
        model.id ?? 0,
        model.title ?? "",
        "https://image.tmdb.org/t/p/w342${model.posterPath}",
        model.voteAverage ?? 0.0,
        model.overview ?? "",
        model.genres?.map((e) => e.name ?? "").join(", ") ?? "",
        model.releaseDate?.substring(0, 4) ?? "" , model.video ?? false);
  }
}
