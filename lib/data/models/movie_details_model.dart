import 'package:json_annotation/json_annotation.dart';
import 'movie_model.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  final int id;
  final String title;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  final double? popularity;
  final int? runtime;
  final List<Genre>? genres;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompany>? productionCompanies;

  MovieDetailsModel({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.popularity,
    this.runtime,
    this.genres,
    this.productionCompanies,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);

  String get fullPosterPath => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500$posterPath'
      : '';

  String get fullBackdropPath => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w1280$backdropPath'
      : '';

  MovieModel toMovieModel() {
    return MovieModel(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      popularity: popularity,
    );
  }
}

@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  final int id;
  final String? name;
  @JsonKey(name: 'logo_path')
  final String? logoPath;

  ProductionCompany({required this.id, this.name, this.logoPath});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

