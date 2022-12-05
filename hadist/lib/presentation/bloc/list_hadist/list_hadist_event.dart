part of 'list_hadist_bloc.dart';

abstract class SurahDetailEvent extends Equatable {
  const SurahDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchSurahDetailEvent extends SurahDetailEvent {
  final String id;

  const FetchSurahDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
