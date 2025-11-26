import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadMovieDetails extends MovieDetailsEvent {
  final int movieId;

  const LoadMovieDetails(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class ToggleBookmark extends MovieDetailsEvent {
  final int movieId;

  const ToggleBookmark(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class CheckBookmarkStatus extends MovieDetailsEvent {
  final int movieId;

  const CheckBookmarkStatus(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

