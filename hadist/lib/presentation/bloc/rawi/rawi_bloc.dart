import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/domain/entities/list_hadist.dart';
import 'package:hadist/domain/entities/rawi.dart';
import 'package:hadist/domain/usecase/get_rawi.dart';

part 'rawi_event.dart';
part 'rawi_state.dart';

class RawiBloc extends Bloc<RawiEvent, RawiState> {
  final GetRawi _getRawi;
  RawiBloc(
    this._getRawi,
  ) : super(RawiEmpty()) {
    on<RawiEvent>(
      (event, emit) async {
        if (event is FetchRawiEvent) {
          emit(RawiLoading());
          final result = await _getRawi.execute();

          result.fold(
            (failure) => emit(RawiError(failure.message)),
            (data) {
              if (data.isEmpty) {
                emit(RawiEmpty());
              } else {
                emit(RawiHasData(data));
              }
            },
          );
        }
      },
    );
  }
}
