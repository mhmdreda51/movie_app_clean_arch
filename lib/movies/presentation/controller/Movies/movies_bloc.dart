import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_ddp_arch/movies/domain/usecases/get_populer_movies_use_case.dart';
import 'package:movie_app_ddp_arch/movies/domain/usecases/get_top_rated_movies_use_case.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movies.dart';
import '../../../domain/usecases/get_now_playing_movies_use_case.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  //============================================================================

  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

//==============================================================================

  MoviesBloc(
    this.getNowPlayingUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(MoviesInitial()) {
    //==========================================================================
    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    //==========================================================================
    on<GetPopularMoviesEvent>(_getPopularMovies);
    //==========================================================================
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    //==========================================================================
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingMessage: l.message,
        nowPlayingState: RequestState.error,
      )),
      (r) {
        emit(
          state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        );
      },
    );
  }

  //============================================================================

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMessage: l.message,
          popularState: RequestState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            popularMovies: r,
            popularState: RequestState.loaded,
          ),
        );
      },
    );
  }

  //============================================================================
  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMessage: l.message,
          topRatedState: RequestState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            topRatedMovies: r,
            topRatedState: RequestState.loaded,
          ),
        );
      },
    );
  }
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

}
