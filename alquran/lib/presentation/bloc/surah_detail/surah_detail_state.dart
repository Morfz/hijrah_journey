part of 'surah_detail_bloc.dart';

abstract class SurahDetailState extends Equatable {
  const SurahDetailState();

  @override
  List<Object> get props => [];
}

class SurahDetailEmpty extends SurahDetailState {}

class SurahDetailLoading extends SurahDetailState {}

class SurahDetailHasData extends SurahDetailState {
  final SurahDetail result;

  const SurahDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

class SurahDetailError extends SurahDetailState {
  final String message;

  const SurahDetailError(this.message);
  @override
  List<Object> get props => [message];
}
