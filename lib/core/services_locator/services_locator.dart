import 'package:get_it/get_it.dart';
import 'package:movie_app_ddp_arch/movies/data/repositories/movies_repository.dart';
import 'package:movie_app_ddp_arch/movies/domain/repositories/base_movies_repo.dart';
import 'package:movie_app_ddp_arch/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app_ddp_arch/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movie_app_ddp_arch/movies/domain/usecases/get_populer_movies_use_case.dart';

import '../../movies/data/datasources/movie_remote_data_source.dart';
import '../../movies/domain/usecases/get_recommendation_movie_use_case.dart';
import '../../movies/domain/usecases/get_top_rated_movies_use_case.dart';
import '../../movies/presentation/controller/Movie Details/movie_details_bloc.dart';
import '../../movies/presentation/controller/Movies/movies_bloc.dart';

//==============================================================================
final sl = GetIt.instance;
//==============================================================================

class ServicesLocator {
  void init() {
    //==========================================================================
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    //==========================================================================

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
    //==========================================================================

    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
    );
    //==========================================================================
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    //==========================================================================
    //==========================================================================
    //==========================================================================
    //==========================================================================
    //==========================================================================
    //==========================================================================
    //==========================================================================
    //==========================================================================
  }
}
