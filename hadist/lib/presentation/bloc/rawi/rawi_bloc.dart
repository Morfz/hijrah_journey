import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/domain/entities/rawi.dart';
import 'package:hadist/domain/entities/list_hadist.dart';
import 'package:hadist/domain/usecase/get_rawi.dart';
import 'package:hadist/domain/usecase/get_list_hadist.dart';

part 'rawi_event.dart';
part 'rawi_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final GetSurah _getSurah;
  SurahBloc(
    this._getSurah,
  ) : super(SurahEmpty()) {
    on<SurahEvent>(
      (event, emit) async {
        if (event is FetchSurahEvent) {
          emit(SurahLoading());
          final result = await _getSurah.execute();

          result.fold(
            (failure) => emit(SurahError(failure.message)),
            (data) {
              if (data.isEmpty) {
                emit(SurahEmpty());
              } else {
                emit(SurahHasData(data));
              }
            },
          );
        }
      },
    );
  }
}
