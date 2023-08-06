import 'package:core/core.dart';
import 'package:core/networking/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:features/data/data_source/remote_movies_data_source.dart';
import 'package:features/data/models/movie_details/movie_details_response.dart';
import 'package:features/data/models/movies_response.dart';

class RemoteMoviesDataSourceImpl implements RemoteMoviesDataSource{

  final NetworkHandler _networkHandler;

  RemoteMoviesDataSourceImpl(this._networkHandler);


  @override
  Future<Either<Failure, MoviesResponse>> fetchLatestMovies() async {
    var response = await _networkHandler.get<MoviesResponse>(MoviesResponse(),'movie/now_playing');
    if(response.isRequestSuccess){
      return Right(response.body);
    }
    else {
      return Left(Failure(response.errorMessage!));
    }
  }

  @override
  Future<Either<Failure, MoviesResponse>> fetchPopularMovies() async {
    var response = await _networkHandler.get<MoviesResponse>(MoviesResponse(),'movie/popular');
    if(response.isRequestSuccess){
      return Right(response.body);
    }
    else {
      return Left(Failure(response.errorMessage!));
    }

  }

  @override
  Future<Either<Failure, MoviesResponse>> fetchTopRatedMovies() async {
    var response = await _networkHandler.get<MoviesResponse>(MoviesResponse(),'movie/top_rated');
    if(response.isRequestSuccess){
      return Right(response.body);
    }
    else {
      return Left(Failure(response.errorMessage!));
    }
  }

  @override
  Future<Either<Failure, MoviesResponse>> fetchUpcomingMovies() async {
    var response = await _networkHandler.get<MoviesResponse>(MoviesResponse(),'movie/upcoming');
    if(response.isRequestSuccess){
      return Right(response.body);
    }
    else {
      return Left(Failure(response.errorMessage!));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsResponse>> fetchMovieDetails({required int movieId}) async {
    var response = await _networkHandler.get<MovieDetailsResponse>(MovieDetailsResponse(),'movie/$movieId');
    if(response.isRequestSuccess){
      return Right(response.body);
    }
    else {
      return Left(Failure(response.errorMessage!));
    }
  }

}
