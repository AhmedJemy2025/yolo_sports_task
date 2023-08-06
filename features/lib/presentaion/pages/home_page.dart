import 'package:art_core/art_core.dart';
import 'package:art_core/widgets/error_view.dart';
import 'package:art_core/widgets/extensions/widgets_extensions.dart';
import 'package:core/core.dart';
import 'package:features/presentaion/blocs/latest_movies/latest_movies_bloc.dart';
import 'package:features/presentaion/blocs/latest_movies/latest_movies_event.dart';
import 'package:features/presentaion/blocs/latest_movies/latest_movies_state.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_event.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_state.dart';
import 'package:features/presentaion/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:features/presentaion/blocs/top_rated_movies/top_rated_movies_event.dart';
import 'package:features/presentaion/blocs/upcoming_movies/upcoming_movies_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/top_rated_movies/top_rated_movies_state.dart';
import '../blocs/upcoming_movies/upcoming_movies_bloc.dart';
import '../blocs/upcoming_movies/upcoming_movies_state.dart';
import '../components/movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  LatestMoviesBloc latestMoviesBloc = Modular.get<LatestMoviesBloc>();
  PopularMoviesBloc popularMoviesBloc = Modular.get<PopularMoviesBloc>();
  TopRatedMoviesBloc topRatedMoviesBloc = Modular.get<TopRatedMoviesBloc>();
  UpcomingMoviesBloc upcomingMoviesBloc = Modular.get<UpcomingMoviesBloc>();

  @override
  void initState() {

    latestMoviesBloc.add(StartStreamingLatestMovies());
    popularMoviesBloc.add(FetchPopularMovies());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
                stretch: false,
                expandedHeight: 270,
                flexibleSpace: FlexibleSpaceBar(
                  title: null,
                  background: Image.network(
                      "https://image.tmdb.org/t/p/w780/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
                      fit: BoxFit.cover),
                ))
          ];
        },
        body: ListView(
          padding: EdgeInsets.zero,

          children: [
            Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                child: ExpansionTile(
                  title: const Text("Latest movies"),
                  initiallyExpanded: true,
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.centerLeft,
                  collapsedTextColor: Colors.black,
                  textColor: Colors.black,
                  onExpansionChanged: (expanded) {
                    if (expanded) {
                      latestMoviesBloc.add(StartStreamingLatestMovies());
                    } else {
                      latestMoviesBloc.add(StopStreamingLatestMovies());
                    }
                  },
                  children: [
                    BlocConsumer<LatestMoviesBloc, LatestMoviesState>(
                      listener: (context, state) {
                        if (state is LatestMoviesErrorState) {
                          showSnackBar(state.errorMessage);
                        }
                      },
                      bloc: latestMoviesBloc,
                      builder: (context, state) {
                        if (state is LatestMoviesSuccessState) {
                          return MovieList(movies: state.latestMovies);
                        } else if (state is LatestMoviesErrorState) {
                          return ErrorView(onRetryClick: () {
                            latestMoviesBloc.add(
                                StartStreamingLatestMovies());
                          });
                        } else {
                          return const AppLoading();
                        }
                      },

                    )
                  ],
                )).marginSymmetric(vertical: 8, horizontal: 16),
            Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ExpansionTile(
                  title: const Text("Popular Movies"),
                  initiallyExpanded: true,
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.centerLeft,
                  collapsedTextColor: Colors.black,
                  textColor: Colors.black,
                  onExpansionChanged: (expanded) {
                    if (expanded) {
                      popularMoviesBloc.add(FetchPopularMovies());
                    }
                  },
                  children: [
                    BlocConsumer<PopularMoviesBloc, PopularMoviesState>(
                      listener: (context, state) {
                        if (state is PopularMoviesErrorState) {
                          showSnackBar(state.errorMessage);
                        }
                      },
                      bloc: popularMoviesBloc,
                      builder: (context, state) {
                        if (state is PopularMoviesSuccessState) {
                          return MovieList(movies: state.movies);
                        } else if (state is PopularMoviesErrorState) {
                          return ErrorView(onRetryClick: () {
                            popularMoviesBloc.add(FetchPopularMovies());
                          });
                        } else {
                          return const AppLoading();
                        }
                      },

                    )
                  ],
                )).marginSymmetric(vertical: 8, horizontal: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

              child: ExpansionTile(
                title: const Text("TopRated Movies"),
                initiallyExpanded: false,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                collapsedTextColor: Colors.black,
                textColor: Colors.black,
                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                onExpansionChanged: (expanded) {
                  if (expanded) {
                    topRatedMoviesBloc.add(FetchTopRatedMovies());
                  }
                },
                children: [
                  BlocConsumer<TopRatedMoviesBloc, TopRatedMoviesState>(
                    bloc: topRatedMoviesBloc,
                    listener : (context, state) {
                      if (state is TopRatedMoviesErrorState) {
                        showSnackBar(state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      if (state is TopRatedMoviesSuccessState) {
                        return MovieList(movies: state.movies);
                      } else if (state is TopRatedMoviesErrorState) {
                        return ErrorView(onRetryClick: () {
                          topRatedMoviesBloc.add(FetchTopRatedMovies());
                        });
                      } else {
                        return const AppLoading();
                      }
                    },

                  )
                ],
              ),
            ).marginSymmetric(vertical: 8, horizontal: 16),
            Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                child: ExpansionTile(
                  title: const Text("Upcoming Movies"),
                  initiallyExpanded: false,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.centerLeft,
                  collapsedTextColor: Colors.black,
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textColor: Colors.black,
                  onExpansionChanged: (expanded) {
                    if (expanded) {
                      upcomingMoviesBloc.add(FetchUpcomingMovies());
                    }
                  },
                  children: [
                    BlocConsumer<UpcomingMoviesBloc,
                        UpcomingMoviesState>(
                      listener: (context, state) {
                        if (state is UpcomingMoviesErrorState) {
                          showSnackBar(state.errorMessage);
                        }
                      },
                      bloc: upcomingMoviesBloc,
                      builder: (context, state) {
                        if (state is UpcomingMoviesSuccessState) {
                          return MovieList(movies: state.movies);
                        } else if (state is UpcomingMoviesErrorState) {
                          return ErrorView(onRetryClick: () {
                            upcomingMoviesBloc.add(FetchUpcomingMovies());
                          });
                        } else {
                          return const AppLoading();
                        }
                      },

                    )
                  ],
                )).marginSymmetric(vertical: 8, horizontal: 16),

          ],
        ),
      ),
    );
  }
}
