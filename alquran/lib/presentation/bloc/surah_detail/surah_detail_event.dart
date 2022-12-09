part of 'surah_detail_bloc.dart';

abstract class SurahDetailEvent extends Equatable {
  const SurahDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchSurahDetailEvent extends SurahDetailEvent {
  final int id;

  const FetchSurahDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
