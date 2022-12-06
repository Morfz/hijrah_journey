import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/domain/entities/list_hadist.dart';
import 'package:hadist/domain/usecase/get_list_hadist.dart';

part 'list_hadist_event.dart';
part 'list_hadist_state.dart';

class ListHadistBloc extends Bloc<ListHadistEvent, ListHadistState> {
  final GetListHadist _getListHadist;

  ListHadistBloc(this._getListHadist) : super(ListHadistEmpty()) {
    on<ListHadistEvent>(
      (event, emit) async {
        if (event is FetchListHadistEvent) {
          emit(ListHadistLoading());
          final result = await _getListHadist.execute(event.id);

          result.fold(
            (failure) => emit(ListHadistError(failure.message)),
            (data) => emit(ListHadistHasData(data)),
          );
        }
      },
    );
  }
}
