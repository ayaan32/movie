import 'package:equatable/equatable.dart';
import '../../../data/models/movie_model.dart';

abstract class BookmarksState extends Equatable {
  const BookmarksState();

  @override
  List<Object?> get props => [];
}

class BookmarksInitial extends BookmarksState {}

class BookmarksLoading extends BookmarksState {}

class BookmarksLoaded extends BookmarksState {
  final List<MovieModel> movies;

  const BookmarksLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class BookmarksError extends BookmarksState {
  final String message;

  const BookmarksError(this.message);

  @override
  List<Object?> get props => [message];
}

