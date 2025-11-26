// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MoviesTable extends Movies with TableInfo<$MoviesTable, MovieEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
      'vote_average', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _voteCountMeta =
      const VerificationMeta('voteCount');
  @override
  late final GeneratedColumn<int> voteCount = GeneratedColumn<int>(
      'vote_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _popularityMeta =
      const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double> popularity = GeneratedColumn<double>(
      'popularity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isBookmarkedMeta =
      const VerificationMeta('isBookmarked');
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
      'is_bookmarked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_bookmarked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        releaseDate,
        voteAverage,
        voteCount,
        popularity,
        isBookmarked,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<MovieEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta));
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
          _isBookmarkedMeta,
          isBookmarked.isAcceptableOrUnknown(
              data['is_bookmarked']!, _isBookmarkedMeta));
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview']),
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path']),
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path']),
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date']),
      voteAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote_average']),
      voteCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vote_count']),
      popularity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}popularity']),
      isBookmarked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_bookmarked'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(attachedDatabase, alias);
  }
}

class MovieEntity extends DataClass implements Insertable<MovieEntity> {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final double? popularity;
  final bool isBookmarked;
  final DateTime cachedAt;
  const MovieEntity(
      {required this.id,
      required this.title,
      this.overview,
      this.posterPath,
      this.backdropPath,
      this.releaseDate,
      this.voteAverage,
      this.voteCount,
      this.popularity,
      required this.isBookmarked,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String>(releaseDate);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double>(voteAverage);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int>(voteCount);
    }
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double>(popularity);
    }
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: Value(id),
      title: Value(title),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      isBookmarked: Value(isBookmarked),
      cachedAt: Value(cachedAt),
    );
  }

  factory MovieEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieEntity(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String?>(json['overview']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      releaseDate: serializer.fromJson<String?>(json['releaseDate']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      voteCount: serializer.fromJson<int?>(json['voteCount']),
      popularity: serializer.fromJson<double?>(json['popularity']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String?>(overview),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'releaseDate': serializer.toJson<String?>(releaseDate),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'voteCount': serializer.toJson<int?>(voteCount),
      'popularity': serializer.toJson<double?>(popularity),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  MovieEntity copyWith(
          {int? id,
          String? title,
          Value<String?> overview = const Value.absent(),
          Value<String?> posterPath = const Value.absent(),
          Value<String?> backdropPath = const Value.absent(),
          Value<String?> releaseDate = const Value.absent(),
          Value<double?> voteAverage = const Value.absent(),
          Value<int?> voteCount = const Value.absent(),
          Value<double?> popularity = const Value.absent(),
          bool? isBookmarked,
          DateTime? cachedAt}) =>
      MovieEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        overview: overview.present ? overview.value : this.overview,
        posterPath: posterPath.present ? posterPath.value : this.posterPath,
        backdropPath:
            backdropPath.present ? backdropPath.value : this.backdropPath,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        voteAverage: voteAverage.present ? voteAverage.value : this.voteAverage,
        voteCount: voteCount.present ? voteCount.value : this.voteCount,
        popularity: popularity.present ? popularity.value : this.popularity,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  MovieEntity copyWithCompanion(MoviesCompanion data) {
    return MovieEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      overview: data.overview.present ? data.overview.value : this.overview,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      voteAverage:
          data.voteAverage.present ? data.voteAverage.value : this.voteAverage,
      voteCount: data.voteCount.present ? data.voteCount.value : this.voteCount,
      popularity:
          data.popularity.present ? data.popularity.value : this.popularity,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MovieEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('popularity: $popularity, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, overview, posterPath, backdropPath,
      releaseDate, voteAverage, voteCount, popularity, isBookmarked, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.releaseDate == this.releaseDate &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount &&
          other.popularity == this.popularity &&
          other.isBookmarked == this.isBookmarked &&
          other.cachedAt == this.cachedAt);
}

class MoviesCompanion extends UpdateCompanion<MovieEntity> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> overview;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<String?> releaseDate;
  final Value<double?> voteAverage;
  final Value<int?> voteCount;
  final Value<double?> popularity;
  final Value<bool> isBookmarked;
  final Value<DateTime> cachedAt;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.popularity = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.popularity = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    required DateTime cachedAt,
  })  : title = Value(title),
        cachedAt = Value(cachedAt);
  static Insertable<MovieEntity> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<String>? releaseDate,
    Expression<double>? voteAverage,
    Expression<int>? voteCount,
    Expression<double>? popularity,
    Expression<bool>? isBookmarked,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (releaseDate != null) 'release_date': releaseDate,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
      if (popularity != null) 'popularity': popularity,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  MoviesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? overview,
      Value<String?>? posterPath,
      Value<String?>? backdropPath,
      Value<String?>? releaseDate,
      Value<double?>? voteAverage,
      Value<int?>? voteCount,
      Value<double?>? popularity,
      Value<bool>? isBookmarked,
      Value<DateTime>? cachedAt}) {
    return MoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      popularity: popularity ?? this.popularity,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('popularity: $popularity, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $MovieDetailsTable extends MovieDetails
    with TableInfo<$MovieDetailsTable, MovieDetailEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
      'vote_average', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _voteCountMeta =
      const VerificationMeta('voteCount');
  @override
  late final GeneratedColumn<int> voteCount = GeneratedColumn<int>(
      'vote_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _popularityMeta =
      const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double> popularity = GeneratedColumn<double>(
      'popularity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _runtimeMeta =
      const VerificationMeta('runtime');
  @override
  late final GeneratedColumn<int> runtime = GeneratedColumn<int>(
      'runtime', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumn<String> genres = GeneratedColumn<String>(
      'genres', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        releaseDate,
        voteAverage,
        voteCount,
        popularity,
        runtime,
        genres,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movie_details';
  @override
  VerificationContext validateIntegrity(Insertable<MovieDetailEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta));
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    }
    if (data.containsKey('runtime')) {
      context.handle(_runtimeMeta,
          runtime.isAcceptableOrUnknown(data['runtime']!, _runtimeMeta));
    }
    if (data.containsKey('genres')) {
      context.handle(_genresMeta,
          genres.isAcceptableOrUnknown(data['genres']!, _genresMeta));
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieDetailEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieDetailEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview']),
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path']),
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path']),
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date']),
      voteAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote_average']),
      voteCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vote_count']),
      popularity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}popularity']),
      runtime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}runtime']),
      genres: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genres']),
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $MovieDetailsTable createAlias(String alias) {
    return $MovieDetailsTable(attachedDatabase, alias);
  }
}

class MovieDetailEntity extends DataClass
    implements Insertable<MovieDetailEntity> {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final double? popularity;
  final int? runtime;
  final String? genres;
  final DateTime cachedAt;
  const MovieDetailEntity(
      {required this.id,
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
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String>(releaseDate);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double>(voteAverage);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int>(voteCount);
    }
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double>(popularity);
    }
    if (!nullToAbsent || runtime != null) {
      map['runtime'] = Variable<int>(runtime);
    }
    if (!nullToAbsent || genres != null) {
      map['genres'] = Variable<String>(genres);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  MovieDetailsCompanion toCompanion(bool nullToAbsent) {
    return MovieDetailsCompanion(
      id: Value(id),
      title: Value(title),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      runtime: runtime == null && nullToAbsent
          ? const Value.absent()
          : Value(runtime),
      genres:
          genres == null && nullToAbsent ? const Value.absent() : Value(genres),
      cachedAt: Value(cachedAt),
    );
  }

  factory MovieDetailEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieDetailEntity(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String?>(json['overview']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      releaseDate: serializer.fromJson<String?>(json['releaseDate']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      voteCount: serializer.fromJson<int?>(json['voteCount']),
      popularity: serializer.fromJson<double?>(json['popularity']),
      runtime: serializer.fromJson<int?>(json['runtime']),
      genres: serializer.fromJson<String?>(json['genres']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String?>(overview),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'releaseDate': serializer.toJson<String?>(releaseDate),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'voteCount': serializer.toJson<int?>(voteCount),
      'popularity': serializer.toJson<double?>(popularity),
      'runtime': serializer.toJson<int?>(runtime),
      'genres': serializer.toJson<String?>(genres),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  MovieDetailEntity copyWith(
          {int? id,
          String? title,
          Value<String?> overview = const Value.absent(),
          Value<String?> posterPath = const Value.absent(),
          Value<String?> backdropPath = const Value.absent(),
          Value<String?> releaseDate = const Value.absent(),
          Value<double?> voteAverage = const Value.absent(),
          Value<int?> voteCount = const Value.absent(),
          Value<double?> popularity = const Value.absent(),
          Value<int?> runtime = const Value.absent(),
          Value<String?> genres = const Value.absent(),
          DateTime? cachedAt}) =>
      MovieDetailEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        overview: overview.present ? overview.value : this.overview,
        posterPath: posterPath.present ? posterPath.value : this.posterPath,
        backdropPath:
            backdropPath.present ? backdropPath.value : this.backdropPath,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        voteAverage: voteAverage.present ? voteAverage.value : this.voteAverage,
        voteCount: voteCount.present ? voteCount.value : this.voteCount,
        popularity: popularity.present ? popularity.value : this.popularity,
        runtime: runtime.present ? runtime.value : this.runtime,
        genres: genres.present ? genres.value : this.genres,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  MovieDetailEntity copyWithCompanion(MovieDetailsCompanion data) {
    return MovieDetailEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      overview: data.overview.present ? data.overview.value : this.overview,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      voteAverage:
          data.voteAverage.present ? data.voteAverage.value : this.voteAverage,
      voteCount: data.voteCount.present ? data.voteCount.value : this.voteCount,
      popularity:
          data.popularity.present ? data.popularity.value : this.popularity,
      runtime: data.runtime.present ? data.runtime.value : this.runtime,
      genres: data.genres.present ? data.genres.value : this.genres,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MovieDetailEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('popularity: $popularity, ')
          ..write('runtime: $runtime, ')
          ..write('genres: $genres, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      overview,
      posterPath,
      backdropPath,
      releaseDate,
      voteAverage,
      voteCount,
      popularity,
      runtime,
      genres,
      cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieDetailEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.releaseDate == this.releaseDate &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount &&
          other.popularity == this.popularity &&
          other.runtime == this.runtime &&
          other.genres == this.genres &&
          other.cachedAt == this.cachedAt);
}

class MovieDetailsCompanion extends UpdateCompanion<MovieDetailEntity> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> overview;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<String?> releaseDate;
  final Value<double?> voteAverage;
  final Value<int?> voteCount;
  final Value<double?> popularity;
  final Value<int?> runtime;
  final Value<String?> genres;
  final Value<DateTime> cachedAt;
  const MovieDetailsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.popularity = const Value.absent(),
    this.runtime = const Value.absent(),
    this.genres = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  MovieDetailsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.popularity = const Value.absent(),
    this.runtime = const Value.absent(),
    this.genres = const Value.absent(),
    required DateTime cachedAt,
  })  : title = Value(title),
        cachedAt = Value(cachedAt);
  static Insertable<MovieDetailEntity> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<String>? releaseDate,
    Expression<double>? voteAverage,
    Expression<int>? voteCount,
    Expression<double>? popularity,
    Expression<int>? runtime,
    Expression<String>? genres,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (releaseDate != null) 'release_date': releaseDate,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
      if (popularity != null) 'popularity': popularity,
      if (runtime != null) 'runtime': runtime,
      if (genres != null) 'genres': genres,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  MovieDetailsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? overview,
      Value<String?>? posterPath,
      Value<String?>? backdropPath,
      Value<String?>? releaseDate,
      Value<double?>? voteAverage,
      Value<int?>? voteCount,
      Value<double?>? popularity,
      Value<int?>? runtime,
      Value<String?>? genres,
      Value<DateTime>? cachedAt}) {
    return MovieDetailsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      popularity: popularity ?? this.popularity,
      runtime: runtime ?? this.runtime,
      genres: genres ?? this.genres,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    if (runtime.present) {
      map['runtime'] = Variable<int>(runtime.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(genres.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieDetailsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('popularity: $popularity, ')
          ..write('runtime: $runtime, ')
          ..write('genres: $genres, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MoviesTable movies = $MoviesTable(this);
  late final $MovieDetailsTable movieDetails = $MovieDetailsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies, movieDetails];
}

typedef $$MoviesTableCreateCompanionBuilder = MoviesCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> overview,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<String?> releaseDate,
  Value<double?> voteAverage,
  Value<int?> voteCount,
  Value<double?> popularity,
  Value<bool> isBookmarked,
  required DateTime cachedAt,
});
typedef $$MoviesTableUpdateCompanionBuilder = MoviesCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> overview,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<String?> releaseDate,
  Value<double?> voteAverage,
  Value<int?> voteCount,
  Value<double?> popularity,
  Value<bool> isBookmarked,
  Value<DateTime> cachedAt,
});

class $$MoviesTableFilterComposer
    extends Composer<_$AppDatabase, $MoviesTable> {
  $$MoviesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get overview => $composableBuilder(
      column: $table.overview, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get voteCount => $composableBuilder(
      column: $table.voteCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get popularity => $composableBuilder(
      column: $table.popularity, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
      column: $table.isBookmarked, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$MoviesTableOrderingComposer
    extends Composer<_$AppDatabase, $MoviesTable> {
  $$MoviesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get overview => $composableBuilder(
      column: $table.overview, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get voteCount => $composableBuilder(
      column: $table.voteCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get popularity => $composableBuilder(
      column: $table.popularity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
      column: $table.isBookmarked,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$MoviesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MoviesTable> {
  $$MoviesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => column);

  GeneratedColumn<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => column);

  GeneratedColumn<int> get voteCount =>
      $composableBuilder(column: $table.voteCount, builder: (column) => column);

  GeneratedColumn<double> get popularity => $composableBuilder(
      column: $table.popularity, builder: (column) => column);

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
      column: $table.isBookmarked, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$MoviesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoviesTable,
    MovieEntity,
    $$MoviesTableFilterComposer,
    $$MoviesTableOrderingComposer,
    $$MoviesTableAnnotationComposer,
    $$MoviesTableCreateCompanionBuilder,
    $$MoviesTableUpdateCompanionBuilder,
    (MovieEntity, BaseReferences<_$AppDatabase, $MoviesTable, MovieEntity>),
    MovieEntity,
    PrefetchHooks Function()> {
  $$MoviesTableTableManager(_$AppDatabase db, $MoviesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoviesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MoviesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoviesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> overview = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<double?> voteAverage = const Value.absent(),
            Value<int?> voteCount = const Value.absent(),
            Value<double?> popularity = const Value.absent(),
            Value<bool> isBookmarked = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
          }) =>
              MoviesCompanion(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            backdropPath: backdropPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            voteCount: voteCount,
            popularity: popularity,
            isBookmarked: isBookmarked,
            cachedAt: cachedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> overview = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<double?> voteAverage = const Value.absent(),
            Value<int?> voteCount = const Value.absent(),
            Value<double?> popularity = const Value.absent(),
            Value<bool> isBookmarked = const Value.absent(),
            required DateTime cachedAt,
          }) =>
              MoviesCompanion.insert(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            backdropPath: backdropPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            voteCount: voteCount,
            popularity: popularity,
            isBookmarked: isBookmarked,
            cachedAt: cachedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MoviesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MoviesTable,
    MovieEntity,
    $$MoviesTableFilterComposer,
    $$MoviesTableOrderingComposer,
    $$MoviesTableAnnotationComposer,
    $$MoviesTableCreateCompanionBuilder,
    $$MoviesTableUpdateCompanionBuilder,
    (MovieEntity, BaseReferences<_$AppDatabase, $MoviesTable, MovieEntity>),
    MovieEntity,
    PrefetchHooks Function()>;
typedef $$MovieDetailsTableCreateCompanionBuilder = MovieDetailsCompanion
    Function({
  Value<int> id,
  required String title,
  Value<String?> overview,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<String?> releaseDate,
  Value<double?> voteAverage,
  Value<int?> voteCount,
  Value<double?> popularity,
  Value<int?> runtime,
  Value<String?> genres,
  required DateTime cachedAt,
});
typedef $$MovieDetailsTableUpdateCompanionBuilder = MovieDetailsCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String?> overview,
  Value<String?> posterPath,
  Value<String?> backdropPath,
  Value<String?> releaseDate,
  Value<double?> voteAverage,
  Value<int?> voteCount,
  Value<double?> popularity,
  Value<int?> runtime,
  Value<String?> genres,
  Value<DateTime> cachedAt,
});

class $$MovieDetailsTableFilterComposer
    extends Composer<_$AppDatabase, $MovieDetailsTable> {
  $$MovieDetailsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get overview => $composableBuilder(
      column: $table.overview, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get voteCount => $composableBuilder(
      column: $table.voteCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get popularity => $composableBuilder(
      column: $table.popularity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get runtime => $composableBuilder(
      column: $table.runtime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get genres => $composableBuilder(
      column: $table.genres, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$MovieDetailsTableOrderingComposer
    extends Composer<_$AppDatabase, $MovieDetailsTable> {
  $$MovieDetailsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get overview => $composableBuilder(
      column: $table.overview, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get voteCount => $composableBuilder(
      column: $table.voteCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get popularity => $composableBuilder(
      column: $table.popularity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get runtime => $composableBuilder(
      column: $table.runtime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genres => $composableBuilder(
      column: $table.genres, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$MovieDetailsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MovieDetailsTable> {
  $$MovieDetailsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
      column: $table.backdropPath, builder: (column) => column);

  GeneratedColumn<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => column);

  GeneratedColumn<int> get voteCount =>
      $composableBuilder(column: $table.voteCount, builder: (column) => column);

  GeneratedColumn<double> get popularity => $composableBuilder(
      column: $table.popularity, builder: (column) => column);

  GeneratedColumn<int> get runtime =>
      $composableBuilder(column: $table.runtime, builder: (column) => column);

  GeneratedColumn<String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$MovieDetailsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MovieDetailsTable,
    MovieDetailEntity,
    $$MovieDetailsTableFilterComposer,
    $$MovieDetailsTableOrderingComposer,
    $$MovieDetailsTableAnnotationComposer,
    $$MovieDetailsTableCreateCompanionBuilder,
    $$MovieDetailsTableUpdateCompanionBuilder,
    (
      MovieDetailEntity,
      BaseReferences<_$AppDatabase, $MovieDetailsTable, MovieDetailEntity>
    ),
    MovieDetailEntity,
    PrefetchHooks Function()> {
  $$MovieDetailsTableTableManager(_$AppDatabase db, $MovieDetailsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MovieDetailsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MovieDetailsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MovieDetailsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> overview = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<double?> voteAverage = const Value.absent(),
            Value<int?> voteCount = const Value.absent(),
            Value<double?> popularity = const Value.absent(),
            Value<int?> runtime = const Value.absent(),
            Value<String?> genres = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
          }) =>
              MovieDetailsCompanion(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            backdropPath: backdropPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            voteCount: voteCount,
            popularity: popularity,
            runtime: runtime,
            genres: genres,
            cachedAt: cachedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> overview = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<String?> backdropPath = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<double?> voteAverage = const Value.absent(),
            Value<int?> voteCount = const Value.absent(),
            Value<double?> popularity = const Value.absent(),
            Value<int?> runtime = const Value.absent(),
            Value<String?> genres = const Value.absent(),
            required DateTime cachedAt,
          }) =>
              MovieDetailsCompanion.insert(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            backdropPath: backdropPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            voteCount: voteCount,
            popularity: popularity,
            runtime: runtime,
            genres: genres,
            cachedAt: cachedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MovieDetailsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MovieDetailsTable,
    MovieDetailEntity,
    $$MovieDetailsTableFilterComposer,
    $$MovieDetailsTableOrderingComposer,
    $$MovieDetailsTableAnnotationComposer,
    $$MovieDetailsTableCreateCompanionBuilder,
    $$MovieDetailsTableUpdateCompanionBuilder,
    (
      MovieDetailEntity,
      BaseReferences<_$AppDatabase, $MovieDetailsTable, MovieDetailEntity>
    ),
    MovieDetailEntity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MoviesTableTableManager get movies =>
      $$MoviesTableTableManager(_db, _db.movies);
  $$MovieDetailsTableTableManager get movieDetails =>
      $$MovieDetailsTableTableManager(_db, _db.movieDetails);
}
