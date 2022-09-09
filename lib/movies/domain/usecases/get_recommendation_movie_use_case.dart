import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error_exceptions/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/recommendation.dart';
import '../repositories/base_movies_repo.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository moviesRepository;

  GetRecommendationUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await moviesRepository.getRecommendationMovie(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters(this.movieId);

  @override
  List<Object> get props => [movieId];
}
