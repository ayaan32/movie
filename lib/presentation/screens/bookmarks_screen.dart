import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../bloc/bookmarks/bookmarks_bloc.dart';
import '../bloc/bookmarks/bookmarks_event.dart';
import '../bloc/bookmarks/bookmarks_state.dart';
import '../bloc/movie_details/movie_details_bloc.dart';
import '../widgets/movie_list_item.dart';
import 'movie_details_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BookmarksBloc>().add(const LoadBookmarks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Movies'),
        elevation: 0,
      ),
      body: BlocBuilder<BookmarksBloc, BookmarksState>(
        builder: (context, state) {
          if (state is BookmarksLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BookmarksError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<BookmarksBloc>().add(const LoadBookmarks());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is BookmarksLoaded) {
            if (state.movies.isEmpty) {
              return const Center(
                child: Text('No bookmarked movies yet'),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<BookmarksBloc>().add(const LoadBookmarks());
              },
              child: ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return MovieListItem(
                    movie: movie,
                    onTap: () async {
                      await Navigator.push(
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
                      // Refresh bookmarks when returning from details
                      if (mounted) {
                        context.read<BookmarksBloc>().add(const LoadBookmarks());
                      }
                    },
                  );
                },
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

