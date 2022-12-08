import 'package:addon/domain/entities/doa.dart';
import 'package:addon/domain/usecase/get_doa.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doa_event.dart';
part 'doa_state.dart';

class DoaBloc extends Bloc<DoaEvent, DoaState> {
  final GetDoa getDoaList;

  DoaBloc(this.getDoaList) : super(DoaEmpty()) {
    on<GetDoaListEvent>((event, emit) async {
      emit(DoaLoading());
      final result = await getDoaList.execute();

      result.fold((failure) {
        emit(DoaError(failure.message));
      }, (data) {
        emit(DoaLoaded(data));
      });
    });
  }
}
