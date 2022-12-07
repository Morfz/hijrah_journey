part of 'list_hadist_bloc.dart';

abstract class ListHadistState extends Equatable {
  const ListHadistState();

  @override
  List<Object> get props => [];
}

class ListHadistEmpty extends ListHadistState {}

class ListHadistLoading extends ListHadistState {}

class ListHadistHasData extends ListHadistState {
  final ListHadist result;

  const ListHadistHasData(this.result);

  @override
  List<Object> get props => [result];
}

class ListHadistError extends ListHadistState {
  final String message;

  const ListHadistError(this.message);
  @override
  List<Object> get props => [message];
}
