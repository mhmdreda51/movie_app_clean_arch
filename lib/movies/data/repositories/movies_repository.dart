import 'package:dartz/dartz.dart';
import 'package:movie_app_ddp_arch/core/error_exceptions/error_exceptions.dart';
import 'package:movie_app_ddp_arch/core/error_exceptions/failure.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/movie_details.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/movies.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/recommendation.dart';
import 'package:movie_app_ddp_arch/movies/domain/repositories/base_movies_repo.dart';
import 'package:movie_app_ddp_arch/movies/domain/usecases/get_recommendation_movie_use_case.dart';

import '../../domain/usecases/get_movie_details_use_case.dart';
import '../datasources/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.errorHandelModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.errorHandelModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.errorHandelModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMoviesDetails(parameters);
    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.errorHandelModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovie(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendationMovies(parameters);
    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.errorHandelModel.statusMassage));
    }
  }
}
