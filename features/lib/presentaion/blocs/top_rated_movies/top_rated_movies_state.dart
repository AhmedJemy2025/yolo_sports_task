import 'package:equatable/equatable.dart';

import '../../../domain/entity/movie_entity.dart';
abstract class TopRatedMoviesState extends Equatable {}


class TopRatedMoviesInitialState extends TopRatedMoviesState{
  @override
  List<Object?> get props => [];
}
class TopRatedMoviesLoadingState extends TopRatedMoviesState{
  @override
  List<Object?> get props => [];
}

class TopRatedMoviesSuccessState extends TopRatedMoviesState{
  final List<MovieEntity> movies;

  TopRatedMoviesSuccessState(this.movies);
  @override
  List<Object?> get props => [movies];
}

class TopRatedMoviesErrorState extends TopRatedMoviesState{
  final String errorMessage;

  TopRatedMoviesErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
