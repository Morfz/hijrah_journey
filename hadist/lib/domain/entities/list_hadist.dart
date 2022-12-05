import 'package:equatable/equatable.dart';

class ListHadist extends Equatable {
  const ListHadist({
    required this.name,
    required this.id,
    required this.available,
    required this.requested,
    required this.hadiths,
});

  final String name;
  final String id;
  final int available;
  final int requested;
  final List<Hadith> hadiths;

  @override
  List<Object?> get props => [
    name,
    id,
    available,
    requested,
    hadiths
  ];
}

class Hadith extends Equatable {
  Hadith({
    required this.number,
    required this.arab,
    required this.id,
  });

  final int number;
  final String arab;
  final String id;

  @override
  List<Object?> get props => [
    number,
    arab,
    id,
  ];
}
