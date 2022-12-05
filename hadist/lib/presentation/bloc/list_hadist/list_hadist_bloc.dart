import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/domain/entities/list_hadist.dart';
import 'package:hadist/domain/usecase/get_list_hadist.dart';

part 'list_hadist_event.dart';
part 'list_hadist_state.dart';

class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  final GetSurahDetail _getSurahDetail;

  SurahDetailBloc(this._getSurahDetail) : super(SurahDetailEmpty()) {
    on<SurahDetailEvent>(
      (event, emit) async {
        if (event is FetchSurahDetailEvent) {
          emit(SurahDetailLoading());
          final result = await _getSurahDetail.execute(event.id);

          result.fold(
            (failure) => emit(SurahDetailError(failure.message)),
            (data) => emit(SurahDetailHasData(data)),
          );
        }
      },
    );
  }
}
