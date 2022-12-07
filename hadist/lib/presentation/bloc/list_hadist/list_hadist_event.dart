part of 'list_hadist_bloc.dart';

abstract class ListHadistEvent extends Equatable {
  const ListHadistEvent();

  @override
  List<Object> get props => [];
}

class FetchListHadistEvent extends ListHadistEvent {
  final String id;

  const FetchListHadistEvent(this.id);

  @override
  List<Object> get props => [id];
}
