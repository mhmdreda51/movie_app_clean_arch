import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tvs_state.dart';

class TvsCubit extends Cubit<TvsState> {
  TvsCubit() : super(TvsInitial());
}
