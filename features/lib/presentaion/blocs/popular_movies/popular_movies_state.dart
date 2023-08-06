import 'package:equatable/equatable.dart';

import '../../../domain/entity/movie_entity.dart';
abstract class PopularMoviesState extends Equatable {}


class PopularMoviesInitialState extends PopularMoviesState{
  @override
  List<Object?> get props => [];
}
class PopularMoviesLoadingState extends PopularMoviesState{
  @override
  List<Object?> get props => [];
}

class PopularMoviesSuccessState extends PopularMoviesState{
  final List<MovieEntity> movies;

  PopularMoviesSuccessState(this.movies);
  @override
  List<Object?> get props => [movies];
}

class PopularMoviesErrorState extends PopularMoviesState{
  final String errorMessage;

  PopularMoviesErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
