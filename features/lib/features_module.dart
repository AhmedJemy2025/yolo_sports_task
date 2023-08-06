



import 'package:core/router/navigator_keys.dart';
import 'package:features/data/data_source/remote_movies_data_source_impl.dart';
import 'package:features/data/repository/movies_repository_impl.dart';
import 'package:features/domain/mapper/movie_details_mapper.dart';
import 'package:features/domain/use_cases/fetch_latest_movies_use_case.dart';
import 'package:features/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:features/presentaion/blocs/latest_movies/latest_movies_bloc.dart';
import 'package:features/presentaion/blocs/movie_details/movie_details_bloc.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:features/presentaion/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:features/presentaion/blocs/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:features/presentaion/pages/home_page.dart';
import 'package:features/presentaion/pages/movie_details_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'domain/mapper/movies_mapper.dart';
import 'domain/use_cases/fetch_popular_movies_use_case.dart';
import 'domain/use_cases/fetch_top_rated_movies_use_case.dart';
import 'domain/use_cases/fetch_upcoming_movies_use_case.dart';






class FeaturesModule extends Module {
  @override
  final List<Bind> binds = [

    Bind.lazySingleton((i) => RemoteMoviesDataSourceImpl(i())),

    Bind.lazySingleton((i) => MoviesMapper()),
    Bind.lazySingleton((i) => MovieDetailsMapper()),

    Bind.lazySingleton((i) => MoviesRepositoryImpl(i() )),

    Bind.lazySingleton((i) => FetchLatestMoviesUseCase(i())),
    Bind.lazySingleton((i) => FetchPopularMoviesUseCase(i())),
    Bind.lazySingleton((i) => FetchTopRatedMoviesUseCase(i())),
    Bind.lazySingleton((i) => FetchUpcomingMoviesUseCase(i())),
    Bind.lazySingleton((i) => FetchMovieDetailsUseCase(i())),

    Bind.lazySingleton((i) => LatestMoviesBloc(i())),
    Bind.lazySingleton((i) => PopularMoviesBloc(i())),
    Bind.lazySingleton((i) => TopRatedMoviesBloc(i())),
    Bind.lazySingleton((i) => UpcomingMoviesBloc(i())),
    Bind.lazySingleton((i) => MovieDetailsBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
    // ChildRoute('/', child: (_, args) =>  const MovieDetailsPage( movieId: 872585,)),

  ];
}
