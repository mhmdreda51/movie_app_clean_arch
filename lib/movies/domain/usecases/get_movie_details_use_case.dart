import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_ddp_arch/core/error_exceptions/failure.dart';
import 'package:movie_app_ddp_arch/core/usecase/base_usecase.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/movie_details.dart';

import '../repositories/base_movies_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository moviesRepository;

  GetMovieDetailsUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
    MovieDetailsParameters parameters,
  ) async {
    return await moviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
