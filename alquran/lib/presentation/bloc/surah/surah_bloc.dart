import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alquran/domain/entities/surah.dart';
import 'package:alquran/domain/entities/surah_detail.dart';
import 'package:alquran/domain/usecase/get_surah.dart';
import 'package:alquran/domain/usecase/get_surah_detail.dart';

part 'surah_event.dart';
part 'surah_state.dart';

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
