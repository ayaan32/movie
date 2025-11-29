import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/movie_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepository _repository;
  Timer? _debounceTimer;
  String _lastSearchedQuery = '';

  SearchBloc(this._repository) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClearSearch>(_onClearSearch);
    on<PerformSearchEvent>(_onPerformSearch);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    _debounceTimer?.cancel();

    if (event.query.isEmpty) {
      _lastSearchedQuery = '';
      emit(SearchInitial());
      return;
    }

    // Debounce: wait 500ms before actually searching
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // Trigger a new event to perform the actual search
      // This ensures we have a fresh event handler with a valid emit
      add(PerformSearchEvent(event.query));
    });
  }

  Future<void> _onPerformSearch(
    PerformSearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    // Skip if query has changed (another search is in progress)
    if (_lastSearchedQuery == event.query && state is SearchLoaded) {
      return;
    }

    _lastSearchedQuery = event.query;

    try {
      emit(SearchLoading());
      final movies = await _repository.searchMovies(event.query);
      // Only emit if this is still the latest query
      if (_lastSearchedQuery == event.query) {
        emit(SearchLoaded(movies: movies, query: event.query));
      }
    } catch (e) {
      if (_lastSearchedQuery == event.query) {
        emit(SearchError(e.toString()));
      }
    }
  }

  void _onClearSearch(
    ClearSearch event,
    Emitter<SearchState> emit,
  ) {
    _debounceTimer?.cancel();
    _lastSearchedQuery = '';
    emit(SearchInitial());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}

