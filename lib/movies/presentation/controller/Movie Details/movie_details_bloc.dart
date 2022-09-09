import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_ddp_arch/movies/domain/entities/movie_details.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/recommendation.dart';
import '../../../domain/usecases/get_movie_details_use_case.dart';
import '../../../domain/usecases/get_recommendation_movie_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  //==============================================================================
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  //==============================================================================
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    //==========================================================================
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendationMovies);
    //==========================================================================
  }

//==============================================================================
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase.call(
      MovieDetailsParameters(movieId: event.id),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          movieDetailsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

//==============================================================================
  FutureOr<void> _getRecommendationMovies(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase.call(
      RecommendationParameters(event.id),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationMessage: l.message,
          recommendationState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
//==============================================================================
//==============================================================================
//==============================================================================

}
