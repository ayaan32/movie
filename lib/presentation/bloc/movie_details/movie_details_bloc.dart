import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/movie_repository.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieRepository _repository;

  MovieDetailsBloc(this._repository) : super(MovieDetailsInitial()) {
    on<LoadMovieDetails>(_onLoadMovieDetails);
    on<ToggleBookmark>(_onToggleBookmark);
    on<CheckBookmarkStatus>(_onCheckBookmarkStatus);
  }

  Future<void> _onLoadMovieDetails(
    LoadMovieDetails event,
    Emitter<MovieDetailsState> emit,
  ) async {
    try {
      emit(MovieDetailsLoading());
      final details = await _repository.getMovieDetails(event.movieId);
      final isBookmarked = await _repository.isBookmarked(event.movieId);
      emit(MovieDetailsLoaded(
        movieDetails: details,
        isBookmarked: isBookmarked,
      ));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }

  Future<void> _onToggleBookmark(
    ToggleBookmark event,
    Emitter<MovieDetailsState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is MovieDetailsLoaded) {
        await _repository.toggleBookmark(event.movieId);
        final newBookmarkStatus = await _repository.isBookmarked(event.movieId);
        emit(currentState.copyWith(isBookmarked: newBookmarkStatus));
      }
    } catch (e) {
      // Handle error silently or emit error state
    }
  }

  Future<void> _onCheckBookmarkStatus(
    CheckBookmarkStatus event,
    Emitter<MovieDetailsState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is MovieDetailsLoaded) {
        final isBookmarked = await _repository.isBookmarked(event.movieId);
        emit(currentState.copyWith(isBookmarked: isBookmarked));
      }
    } catch (e) {
      // Handle error silently
    }
  }
}

