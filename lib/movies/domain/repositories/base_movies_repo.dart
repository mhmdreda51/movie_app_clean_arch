import 'package:dartz/dartz.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/movies.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/recommendation.dart';
import 'package:movie_app_ddp_arch/movies/domain/usecases/get_recommendation_movie_use_case.dart';

import '../../../core/error_exceptions/failure.dart';
import '../usecases/get_movie_details_use_case.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
    MovieDetailsParameters parameters,
  );

  Future<Either<Failure, List<Recommendation>>> getRecommendationMovie(
    RecommendationParameters parameters,
  );
}
