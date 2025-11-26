import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/movie_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MovieRepository _repository;

  HomeBloc(this._repository) : super(HomeInitial()) {
    on<LoadTrendingMovies>(_onLoadTrendingMovies);
    on<LoadNowPlayingMovies>(_onLoadNowPlayingMovies);
  }

  Future<void> _onLoadTrendingMovies(
    LoadTrendingMovies event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());
      final movies = await _repository.getTrendingMovies();
      final currentState = state;
      if (currentState is HomeLoaded) {
        emit(HomeLoaded(
          trendingMovies: movies,
          nowPlayingMovies: currentState.nowPlayingMovies,
        ));
      } else {
        emit(HomeLoaded(
          trendingMovies: movies,
          nowPlayingMovies: const [],
        ));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onLoadNowPlayingMovies(
    LoadNowPlayingMovies event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is! HomeLoading) {
        emit(HomeLoading());
      }
      final movies = await _repository.getNowPlayingMovies();
      if (currentState is HomeLoaded) {
        emit(HomeLoaded(
          trendingMovies: currentState.trendingMovies,
          nowPlayingMovies: movies,
        ));
      } else {
        emit(HomeLoaded(
          trendingMovies: const [],
          nowPlayingMovies: movies,
        ));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}

