import 'package:dio/dio.dart';
import 'package:movie_app_ddp_arch/movies/data/models/movies_model.dart';

import '../../../core/error_exceptions/error_exceptions.dart';
import '../../../core/network/error_handel_model.dart';
import '../../../core/utils/app_constant.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import '../../domain/usecases/get_recommendation_movie_use_case.dart';
import '../models/movie_details_model.dart';
import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendationMovies(
    RecommendationParameters parameters,
  );
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstants.nowPlayingPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorHandelModel: ErrorHandelModel.fromMap(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorHandelModel: ErrorHandelModel.fromMap(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorHandelModel: ErrorHandelModel.fromMap(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(AppConstants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        errorHandelModel: ErrorHandelModel.fromMap(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameters parameters) async {
    final response = await Dio()
        .get(AppConstants.movieRecommendationPath(parameters.movieId));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorHandelModel: ErrorHandelModel.fromMap(response.data),
      );
    }
  }
}
