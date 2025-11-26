import 'package:equatable/equatable.dart';
import '../../../data/models/movie_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MovieModel> trendingMovies;
  final List<MovieModel> nowPlayingMovies;

  const HomeLoaded({
    required this.trendingMovies,
    required this.nowPlayingMovies,
  });

  @override
  List<Object?> get props => [trendingMovies, nowPlayingMovies];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

