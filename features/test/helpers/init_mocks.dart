import 'package:features/data/data_source/remote_movies_data_source_impl.dart';
import 'package:features/data/repository/movies_repository_impl.dart';
import 'package:features/domain/use_cases/fetch_latest_movies_use_case.dart';
import 'package:features/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:features/domain/use_cases/fetch_popular_movies_use_case.dart';
import 'package:features/domain/use_cases/fetch_top_rated_movies_use_case.dart';
import 'package:features/domain/use_cases/fetch_upcoming_movies_use_case.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  RemoteMoviesDataSourceImpl,
  MoviesRepositoryImpl,
  FetchPopularMoviesUseCase,
  FetchLatestMoviesUseCase,
  FetchTopRatedMoviesUseCase,
  FetchUpcomingMoviesUseCase,
  FetchMovieDetailsUseCase
], customMocks: [])
void main() {}
