import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadTrendingMovies extends HomeEvent {
  const LoadTrendingMovies();
}

class LoadNowPlayingMovies extends HomeEvent {
  const LoadNowPlayingMovies();
}

