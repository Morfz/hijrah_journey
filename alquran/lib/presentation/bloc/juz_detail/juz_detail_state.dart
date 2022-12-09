part of 'juz_detail_bloc.dart';

abstract class JuzDetailState extends Equatable {
  const JuzDetailState();

  @override
  List<Object> get props => [];
}

class JuzDetailEmpty extends JuzDetailState {}

class JuzDetailLoading extends JuzDetailState {}

class JuzDetailHasData extends JuzDetailState {
  final JuzDetail result;

  const JuzDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

class JuzDetailError extends JuzDetailState {
  final String message;

  const JuzDetailError(this.message);
  @override
  List<Object> get props => [message];
}
