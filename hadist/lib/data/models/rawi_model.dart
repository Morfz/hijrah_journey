import 'package:equatable/equatable.dart';
import 'package:hadist/domain/entities/rawi.dart';

class SurahModel extends Equatable {
  SurahModel({
    required this.name,
    required this.id,
    required this.available,
  });

  String? name;
  String id;
  int? available;

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
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
