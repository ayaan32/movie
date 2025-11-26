import 'package:equatable/equatable.dart';

abstract class BookmarksEvent extends Equatable {
  const BookmarksEvent();

  @override
  List<Object?> get props => [];
}

class LoadBookmarks extends BookmarksEvent {
  const LoadBookmarks();
}

class RemoveBookmark extends BookmarksEvent {
  final int movieId;

  const RemoveBookmark(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

