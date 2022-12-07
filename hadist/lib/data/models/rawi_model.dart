import 'package:equatable/equatable.dart';
import 'package:hadist/domain/entities/rawi.dart';

class RawiModel extends Equatable {
  RawiModel({
    required this.name,
    required this.id,
    required this.available,
  });

  String? name;
  String id;
  int? available;

  factory RawiModel.fromJson(Map<String, dynamic> json) => RawiModel(
        name: json["name"],
        id: json["id"],
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "available": available,
      };

  Rawi toEntity() {
    return Rawi(
      name: name ?? "",
      id: id,
      available: available ?? 0,
    );
  }

  @override
  List<Object?> get props => [
    name,
    id,
    available,
  ];
}
