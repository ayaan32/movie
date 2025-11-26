import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/home/home_state.dart';
import '../bloc/movie_details/movie_details_bloc.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_list_item.dart';
import 'movie_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const LoadTrendingMovies());
    context.read<HomeBloc>().add(const LoadNowPlayingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        elevation: 0,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(const LoadTrendingMovies());
                      context.read<HomeBloc>().add(const LoadNowPlayingMovies());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is HomeLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(const LoadTrendingMovies());
                context.read<HomeBloc>().add(const LoadNowPlayingMovies());
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Trending Movies Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Trending Movies',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: state.trendingMovies.isEmpty
                          ? const Center(child: Text('No trending movies'))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.trendingMovies.length,
                              itemBuilder: (context, index) {
                                final movie = state.trendingMovies[index];
                                return MovieCard(
                                  movie: movie,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                          create: (context) => getIt<MovieDetailsBloc>(),
                                          child: MovieDetailsScreen(
                                            movieId: movie.id,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                    ),
                    const SizedBox(height: 24),
                    // Now Playing Movies Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Now Playing',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    state.nowPlayingMovies.isEmpty
                        ? const Center(child: Text('No movies playing now'))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.nowPlayingMovies.length,
                            itemBuilder: (context, index) {
                              final movie = state.nowPlayingMovies[index];
                              return MovieListItem(
                                movie: movie,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) => getIt<MovieDetailsBloc>(),
                                        child: MovieDetailsScreen(
                                          movieId: movie.id,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ],
                ),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

