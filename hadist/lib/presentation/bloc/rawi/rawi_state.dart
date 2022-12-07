part of 'rawi_bloc.dart';

abstract class RawiState extends Equatable {
  const RawiState();

  @override
  List<Object> get props => [];
}

class RawiEmpty extends RawiState {}

class RawiLoading extends RawiState {}

class RawiHasData extends RawiState {
  final List<Rawi> result;

  const RawiHasData(this.result);

  @override
  List<Object> get props => [result];
}

class RawiError extends RawiState {
  final String message;

  const RawiError(this.message);
  @override
  List<Object> get props => [message];
}

class RawiDetailHasData extends RawiState {
  final ListHadist result;

  const RawiDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}
