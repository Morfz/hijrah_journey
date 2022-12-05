import 'package:equatable/equatable.dart';

class Rawi extends Equatable {
  Rawi({
    required this.name,
    required this.id,
    required this.available,
  });

  String name;
  String id;
  int available;

  @override
  List<Object?> get props => [
    name,
    id,
    available,
  ];
}
