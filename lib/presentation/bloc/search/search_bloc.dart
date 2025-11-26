import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/movie_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepository _repository;
  Timer? _debounceTimer;

  SearchBloc(this._repository) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    _debounceTimer?.cancel();

    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      try {
        emit(SearchLoading());
        final movies = await _repository.searchMovies(event.query);
        emit(SearchLoaded(movies: movies, query: event.query));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }

  void _onClearSearch(
    ClearSearch event,
    Emitter<SearchState> emit,
  ) {
    _debounceTimer?.cancel();
    emit(SearchInitial());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}

