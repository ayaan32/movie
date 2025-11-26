import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/movie_details/movie_details_bloc.dart';
import '../bloc/movie_details/movie_details_event.dart';
import '../bloc/movie_details/movie_details_state.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsBloc>().add(LoadMovieDetails(widget.movieId));
    context.read<MovieDetailsBloc>().add(CheckBookmarkStatus(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MovieDetailsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<MovieDetailsBloc>()
                          .add(LoadMovieDetails(widget.movieId));
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is MovieDetailsLoaded) {
            final movie = state.movieDetails;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: movie.fullBackdropPath.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: movie.fullBackdropPath,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.error),
                            ),
                          )
                        : Container(color: Colors.grey[300]),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        state.isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: state.isBookmarked ? Colors.amber : Colors.white,
                      ),
                      onPressed: () {
                        context
                            .read<MovieDetailsBloc>()
                            .add(ToggleBookmark(widget.movieId));
                      },
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (movie.voteAverage != null) ...[
                              const Icon(Icons.star, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(
                                '${movie.voteAverage!.toStringAsFixed(1)}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 16),
                            ],
                            if (movie.releaseDate != null)
                              Text(
                                movie.releaseDate!,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            if (movie.runtime != null) ...[
                              const SizedBox(width: 16),
                              Text(
                                '${movie.runtime} min',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ],
                        ),
                        if (movie.genres != null && movie.genres!.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            children: movie.genres!
                                .map((genre) => Chip(
                                      label: Text(genre.name),
                                      backgroundColor: Colors.blue[50],
                                    ))
                                .toList(),
                          ),
                        ],
                        if (movie.overview != null) ...[
                          const SizedBox(height: 24),
                          Text(
                            'Overview',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.overview!,
                            style: const TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

