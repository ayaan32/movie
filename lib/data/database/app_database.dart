import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/movie_model.dart';
import '../models/movie_details_model.dart';

part 'app_database.g.dart';

@DataClassName('MovieEntity')
class Movies extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn? get overview => text().nullable()();
  TextColumn? get posterPath => text().nullable()();
  TextColumn? get backdropPath => text().nullable()();
  TextColumn? get releaseDate => text().nullable()();
  RealColumn? get voteAverage => real().nullable()();
  IntColumn? get voteCount => integer().nullable()();
  RealColumn? get popularity => real().nullable()();
  BoolColumn get isBookmarked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MovieDetailEntity')
class MovieDetails extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn? get overview => text().nullable()();
  TextColumn? get posterPath => text().nullable()();
  TextColumn? get backdropPath => text().nullable()();
  TextColumn? get releaseDate => text().nullable()();
  RealColumn? get voteAverage => real().nullable()();
  IntColumn? get voteCount => integer().nullable()();
  RealColumn? get popularity => real().nullable()();
  IntColumn? get runtime => integer().nullable()();
  TextColumn? get genres => text().nullable()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Movies, MovieDetails])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
  );

  Future<List<MovieEntity>> getTrendingMovies() {
    return (select(movies)..orderBy([(m) => OrderingTerm.desc(m.cachedAt)]))
        .get();
  }

  Future<List<MovieEntity>> getNowPlayingMovies() {
    return (select(movies)..orderBy([(m) => OrderingTerm.desc(m.cachedAt)]))
        .get();
  }

  Future<List<MovieEntity>> getBookmarkedMovies() {
    return (select(movies)
          ..where((m) => m.isBookmarked.equals(true))
          ..orderBy([(m) => OrderingTerm.desc(m.cachedAt)]))
        .get();
  }

  Future<MovieEntity?> getMovie(int id) {
    return (select(movies)..where((m) => m.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertMovies(List<MovieModel> movieModels, String category) {
    return batch((batch) {
      batch.insertAll(
        movies,
        movieModels.map((model) => MoviesCompanion(
              id: Value(model.id),
              title: Value(model.title),
              overview: Value(model.overview),
              posterPath: Value(model.posterPath),
              backdropPath: Value(model.backdropPath),
              releaseDate: Value(model.releaseDate),
              voteAverage: Value(model.voteAverage),
              voteCount: Value(model.voteCount),
              popularity: Value(model.popularity),
              cachedAt: Value(DateTime.now()),
            )),
        mode: InsertMode.replace,
      );
    });
  }

  Future<void> toggleBookmark(int movieId, bool isBookmarked) {
    return (update(movies)..where((m) => m.id.equals(movieId)))
        .write(MoviesCompanion(isBookmarked: Value(isBookmarked)));
  }

  Future<bool> isBookmarked(int movieId) async {
    final movie = await getMovie(movieId);
    return movie?.isBookmarked ?? false;
  }

  Future<void> insertMovieDetails(MovieDetailsModel details) {
    return into(movieDetails).insertOnConflictUpdate(
      MovieDetailsCompanion(
        id: Value(details.id),
        title: Value(details.title),
        overview: Value(details.overview),
        posterPath: Value(details.posterPath),
        backdropPath: Value(details.backdropPath),
        releaseDate: Value(details.releaseDate),
        voteAverage: Value(details.voteAverage),
        voteCount: Value(details.voteCount),
        popularity: Value(details.popularity),
        runtime: Value(details.runtime),
        genres: Value(details.genres?.map((g) => g.name).join(', ')),
        cachedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<MovieDetailEntity?> getMovieDetails(int id) {
    return (select(movieDetails)..where((m) => m.id.equals(id)))
        .getSingleOrNull();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'movies.db'));
    return NativeDatabase(file);
  });
}

