import 'package:core/core.dart';
import 'package:core/networking/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:features/data/data_source/remote_movies_data_source.dart';
import 'package:features/data/models/movie_model.dart';
import 'package:features/domain/entity/movie_details_entity.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/domain/mapper/movie_details_mapper.dart';
import 'package:features/domain/repository/movies_repository.dart';

import '../../domain/mapper/movies_mapper.dart';

class MoviesRepositoryImpl implements MoviesRepository{

  final RemoteMoviesDataSource _dataSource;
  MoviesRepositoryImpl(this._dataSource);


  final _mapper = Modular.get<MoviesMapper>();
  final _movieDetailsMapper = Modular.get<MovieDetailsMapper>();

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchLatestMovies() async{

   var res = await _dataSource.fetchLatestMovies();
  return res.fold((l) => Left(l), (r) =>  Right(_mapper.fromModelListToEntityList(r.results)));
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies() async{
    var res = await _dataSource.fetchPopularMovies();
    return res.fold((l) => Left(l), (r) =>  Right(_mapper.fromModelListToEntityList(r.results)));

  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies() async{
    var res = await _dataSource.fetchTopRatedMovies();
    return res.fold((l) => Left(l), (r) =>  Right(_mapper.fromModelListToEntityList(r.results)));

  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchUpcomingMovies() async{
    var res = await _dataSource.fetchUpcomingMovies();
    return res.fold((l) => Left(l), (r) =>  Right(_mapper.fromModelListToEntityList(r.results)));

  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> fetchMovieDetails({required int movieId}) async {

    var res = await _dataSource.fetchMovieDetails(movieId: movieId);
    return res.fold((l) => Left(l), (r) =>  Right(_movieDetailsMapper.fromModelToEntity(r)));
  }
}
