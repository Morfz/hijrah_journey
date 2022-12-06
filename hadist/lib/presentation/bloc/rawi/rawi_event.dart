part of 'rawi_bloc.dart';

abstract class RawiEvent extends Equatable {
  const RawiEvent();

  @override
  List<Object> get props => [];
}

class FetchRawiEvent extends RawiEvent {}
