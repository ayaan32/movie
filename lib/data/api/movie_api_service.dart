import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/movie_model.dart';
import '../models/movie_details_model.dart';

part 'movie_api_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class MovieApiService {
  factory MovieApiService(Dio dio, {String baseUrl}) = _MovieApiService;

  @GET('trending/movie/day')
  Future<MovieResponse> getTrendingMovies(
    @Query('api_key') String apiKey,
  );

  @GET('movie/now_playing')
  Future<MovieResponse> getNowPlayingMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET('search/movie')
  Future<MovieResponse> searchMovies(
    @Query('api_key') String apiKey,
    @Query('query') String query,
    @Query('page') int page,
  );

  @GET('movie/{id}')
  Future<MovieDetailsModel> getMovieDetails(
    @Path('id') int id,
    @Query('api_key') String apiKey,
  );
}

