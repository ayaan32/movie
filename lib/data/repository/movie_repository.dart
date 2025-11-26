import 'package:connectivity_plus/connectivity_plus.dart';
import '../api/movie_api_service.dart';
import '../database/app_database.dart';
import '../models/movie_model.dart';
import '../models/movie_details_model.dart';

class MovieRepository {
  final MovieApiService _apiService;
  final AppDatabase _database;
  final Connectivity _connectivity;
  static const String _apiKey = 'YOUR_API_KEY_HERE'; // Replace with your TMDB API key

  MovieRepository(
    this._apiService,
    this._database,
    this._connectivity,
  );

  Future<bool> _hasInternetConnection() async {
    final result = await _connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  Future<List<MovieModel>> getTrendingMovies() async {
    try {
      final hasInternet = await _hasInternetConnection();
      
      if (hasInternet) {
        final response = await _apiService.getTrendingMovies(_apiKey);
        await _database.insertMovies(response.results, 'trending');
        return response.results;
      } else {
        // Load from database
        final movies = await _database.getTrendingMovies();
        return movies.map((m) => MovieModel(
          id: m.id,
          title: m.title,
          overview: m.overview,
          posterPath: m.posterPath,
          backdropPath: m.backdropPath,
          releaseDate: m.releaseDate,
          voteAverage: m.voteAverage,
          voteCount: m.voteCount,
          popularity: m.popularity,
        )).toList();
      }
    } catch (e) {
      // Fallback to database on error
      final movies = await _database.getTrendingMovies();
      return movies.map((m) => MovieModel(
        id: m.id,
        title: m.title,
        overview: m.overview,
        posterPath: m.posterPath,
        backdropPath: m.backdropPath,
        releaseDate: m.releaseDate,
        voteAverage: m.voteAverage,
        voteCount: m.voteCount,
        popularity: m.popularity,
      )).toList();
    }
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final hasInternet = await _hasInternetConnection();
      
      if (hasInternet) {
        final response = await _apiService.getNowPlayingMovies(_apiKey, 1);
        await _database.insertMovies(response.results, 'now_playing');
        return response.results;
      } else {
        final movies = await _database.getNowPlayingMovies();
        return movies.map((m) => MovieModel(
          id: m.id,
          title: m.title,
          overview: m.overview,
          posterPath: m.posterPath,
          backdropPath: m.backdropPath,
          releaseDate: m.releaseDate,
          voteAverage: m.voteAverage,
          voteCount: m.voteCount,
          popularity: m.popularity,
        )).toList();
      }
    } catch (e) {
      final movies = await _database.getNowPlayingMovies();
      return movies.map((m) => MovieModel(
        id: m.id,
        title: m.title,
        overview: m.overview,
        posterPath: m.posterPath,
        backdropPath: m.backdropPath,
        releaseDate: m.releaseDate,
        voteAverage: m.voteAverage,
        voteCount: m.voteCount,
        popularity: m.popularity,
      )).toList();
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final hasInternet = await _hasInternetConnection();
      
      if (hasInternet) {
        final response = await _apiService.searchMovies(_apiKey, query, 1);
        return response.results;
      } else {
        // For offline, return empty or cached search results
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<MovieDetailsModel> getMovieDetails(int id) async {
    try {
      final hasInternet = await _hasInternetConnection();
      
      if (hasInternet) {
        final details = await _apiService.getMovieDetails(id, _apiKey);
        await _database.insertMovieDetails(details);
        return details;
      } else {
        final cached = await _database.getMovieDetails(id);
        if (cached != null) {
          // Convert cached data to MovieDetailsModel
          final genreNames = cached.genres?.split(', ') ?? [];
          final genres = genreNames.map((name) => Genre(id: 0, name: name)).toList();
          return MovieDetailsModel(
            id: cached.id,
            title: cached.title,
            overview: cached.overview,
            posterPath: cached.posterPath,
            backdropPath: cached.backdropPath,
            releaseDate: cached.releaseDate,
            voteAverage: cached.voteAverage,
            voteCount: cached.voteCount,
            popularity: cached.popularity,
            runtime: cached.runtime,
            genres: genres.isNotEmpty ? genres : null,
          );
        }
        throw Exception('Movie details not found in cache');
      }
    } catch (e) {
      final cached = await _database.getMovieDetails(id);
      if (cached != null) {
        final genreNames = cached.genres?.split(', ') ?? [];
        final genres = genreNames.map((name) => Genre(id: 0, name: name)).toList();
        return MovieDetailsModel(
          id: cached.id,
          title: cached.title,
          overview: cached.overview,
          posterPath: cached.posterPath,
          backdropPath: cached.backdropPath,
          releaseDate: cached.releaseDate,
          voteAverage: cached.voteAverage,
          voteCount: cached.voteCount,
          popularity: cached.popularity,
          runtime: cached.runtime,
          genres: genres.isNotEmpty ? genres : null,
        );
      }
      rethrow;
    }
  }

  Future<List<MovieModel>> getBookmarkedMovies() async {
    final movies = await _database.getBookmarkedMovies();
    return movies.map((m) => MovieModel(
      id: m.id,
      title: m.title,
      overview: m.overview,
      posterPath: m.posterPath,
      backdropPath: m.backdropPath,
      releaseDate: m.releaseDate,
      voteAverage: m.voteAverage,
      voteCount: m.voteCount,
      popularity: m.popularity,
    )).toList();
  }

  Future<void> toggleBookmark(int movieId) async {
    final isBookmarked = await _database.isBookmarked(movieId);
    await _database.toggleBookmark(movieId, !isBookmarked);
  }

  Future<bool> isBookmarked(int movieId) async {
    return await _database.isBookmarked(movieId);
  }
}

