import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../data/api/movie_api_service.dart';
import '../../data/database/app_database.dart';
import '../../data/repository/movie_repository.dart';
import '../../presentation/bloc/home/home_bloc.dart';
import '../../presentation/bloc/movie_details/movie_details_bloc.dart';
import '../../presentation/bloc/search/search_bloc.dart';
import '../../presentation/bloc/bookmarks/bookmarks_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // External dependencies
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<Connectivity>(Connectivity());

  // Database
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // API Service
  getIt.registerSingleton<MovieApiService>(
    MovieApiService(getIt<Dio>()),
  );

  // Repository
  getIt.registerSingleton<MovieRepository>(
    MovieRepository(
      getIt<MovieApiService>(),
      getIt<AppDatabase>(),
      getIt<Connectivity>(),
    ),
  );

  // BLoCs
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(getIt<MovieRepository>()),
  );

  getIt.registerFactory<MovieDetailsBloc>(
    () => MovieDetailsBloc(getIt<MovieRepository>()),
  );

  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(getIt<MovieRepository>()),
  );

  getIt.registerSingleton<BookmarksBloc>(
    BookmarksBloc(getIt<MovieRepository>()),
  );
}

