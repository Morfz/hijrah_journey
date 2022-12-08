part of 'doa_bloc.dart';

abstract class DoaEvent extends Equatable {
  const DoaEvent();

  @override
  List<Object> get props => [];
}

class GetDoaListEvent extends DoaEvent {}
