import 'package:equatable/equatable.dart';

import '../../../domain/entity/movie_entity.dart';
abstract class LatestMoviesState extends Equatable {}


class LatestMoviesInitialState extends LatestMoviesState{
  @override
  List<Object?> get props => [];
}
class LatestMoviesLoadingState extends LatestMoviesState{
  @override
  List<Object?> get props => [];
}

class LatestMoviesSuccessState extends LatestMoviesState{
  final List<MovieEntity> latestMovies;

  LatestMoviesSuccessState(this.latestMovies);
  @override
  List<Object?> get props => [latestMovies];
}

class LatestMoviesErrorState extends LatestMoviesState{
  final String errorMessage;

  LatestMoviesErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
