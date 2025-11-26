import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/movie_repository.dart';
import 'bookmarks_event.dart';
import 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final MovieRepository _repository;

  BookmarksBloc(this._repository) : super(BookmarksInitial()) {
    on<LoadBookmarks>(_onLoadBookmarks);
    on<RemoveBookmark>(_onRemoveBookmark);
  }

  Future<void> _onLoadBookmarks(
    LoadBookmarks event,
    Emitter<BookmarksState> emit,
  ) async {
    try {
      emit(BookmarksLoading());
      final movies = await _repository.getBookmarkedMovies();
      emit(BookmarksLoaded(movies));
    } catch (e) {
      emit(BookmarksError(e.toString()));
    }
  }

  Future<void> _onRemoveBookmark(
    RemoveBookmark event,
    Emitter<BookmarksState> emit,
  ) async {
    try {
      await _repository.toggleBookmark(event.movieId);
      final movies = await _repository.getBookmarkedMovies();
      emit(BookmarksLoaded(movies));
    } catch (e) {
      emit(BookmarksError(e.toString()));
    }
  }
}

