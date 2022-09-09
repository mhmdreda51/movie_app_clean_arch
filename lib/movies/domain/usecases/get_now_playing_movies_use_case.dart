import 'package:dartz/dartz.dart';
import 'package:movie_app_ddp_arch/core/usecase/base_usecase.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/movies.dart';
import 'package:movie_app_ddp_arch/movies/domain/repositories/base_movies_repo.dart';

import '../../../core/error_exceptions/failure.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository moviesRepository;

  GetNowPlayingUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await moviesRepository.getNowPlayingMovies();
  }
}
