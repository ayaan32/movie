import 'package:equatable/equatable.dart';
import '../../../data/models/movie_details_model.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsModel movieDetails;
  final bool isBookmarked;

  const MovieDetailsLoaded({
    required this.movieDetails,
    this.isBookmarked = false,
  });

  MovieDetailsLoaded copyWith({
    MovieDetailsModel? movieDetails,
    bool? isBookmarked,
  }) {
    return MovieDetailsLoaded(
      movieDetails: movieDetails ?? this.movieDetails,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  List<Object?> get props => [movieDetails, isBookmarked];
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  const MovieDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}

