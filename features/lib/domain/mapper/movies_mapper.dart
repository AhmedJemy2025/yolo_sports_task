import 'package:core/core.dart';
import 'package:features/domain/entity/movie_entity.dart';

import '../../data/models/movie_model.dart';

class MoviesMapper extends Mapper<MovieModel, MovieEntity> {
  @override
  List<MovieEntity> fromModelListToEntityList(List<MovieModel>? modelList) {
    return modelList
            ?.map((model) => MovieEntity(model.id ?? 0, model.title ?? "",
                "https://image.tmdb.org/t/p/w342${model.posterPath}"))
            .toList() ??
        [];
  }

  @override
  MovieEntity fromModelToEntity(MovieModel model) {
    return MovieEntity(model.id ?? 0, model.title ?? "",
        "https://image.tmdb.org/t/p/w342${model.posterPath}");
  }
}
