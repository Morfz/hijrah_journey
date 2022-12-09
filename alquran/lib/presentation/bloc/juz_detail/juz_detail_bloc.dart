import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alquran/domain/entities/juz_detail.dart';
import 'package:alquran/domain/usecase/get_juz_detail.dart';

part 'juz_detail_event.dart';
part 'juz_detail_state.dart';

class JuzDetailBloc extends Bloc<JuzDetailEvent, JuzDetailState> {
  final GetJuzDetail _getJuzDetail;

  JuzDetailBloc(this._getJuzDetail) : super(JuzDetailEmpty()) {
    on<JuzDetailEvent>(
      (event, emit) async {
        if (event is FetchJuzDetailEvent) {
          emit(JuzDetailLoading());
          final result = await _getJuzDetail.execute(event.id);

          result.fold(
            (failure) => emit(JuzDetailError(failure.message)),
            (data) => emit(JuzDetailHasData(data)),
          );
        }
      },
    );
  }
}
