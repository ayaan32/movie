import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchQueryChanged extends SearchEvent {
  final String query;

  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearSearch extends SearchEvent {
  const ClearSearch();
}

// Internal event used to perform the actual search after debouncing
class PerformSearchEvent extends SearchEvent {
  final String query;

  const PerformSearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}

