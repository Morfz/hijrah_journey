part of 'doa_bloc.dart';

abstract class DoaState extends Equatable {
  const DoaState();

  @override
  List<Object> get props => [];
}

class DoaEmpty extends DoaState {
  final String message = 'No Data';
}

class DoaLoading extends DoaState {}

class DoaError extends DoaState {
  final String message;

  const DoaError(this.message);

  @override
  List<Object> get props => [message];
}

class DoaLoaded extends DoaState {
  final List<Doa> result;

  const DoaLoaded(this.result);

  @override
  List<Object> get props => [result];
}
