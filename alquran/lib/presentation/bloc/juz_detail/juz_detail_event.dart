part of 'juz_detail_bloc.dart';

abstract class JuzDetailEvent extends Equatable {
  const JuzDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchJuzDetailEvent extends JuzDetailEvent {
  final int id;

  const FetchJuzDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
