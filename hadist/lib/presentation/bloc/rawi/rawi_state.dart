part of 'rawi_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class SurahEmpty extends SurahState {}

class SurahLoading extends SurahState {}

class SurahHasData extends SurahState {
  final List<Rawi> result;

  const SurahHasData(this.result);

  @override
  List<Object> get props => [result];
}

class SurahError extends SurahState {
  final String message;

  const SurahError(this.message);
  @override
  List<Object> get props => [message];
}

class SurahDetailHasData extends SurahState {
  final ListHadist result;

  const SurahDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}
