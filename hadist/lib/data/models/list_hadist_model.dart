import 'package:equatable/equatable.dart';
import 'package:hadist/domain/entities/list_hadist.dart';

class ListHadistModel extends Equatable {
  const ListHadistModel({
    this.name,
    required this.id,
    this.available,
    this.requested,
    this.hadiths,
  });

  final String? name;
  final String id;
  final int? available;
  final int? requested;
  final List<HadistModel>? hadiths;

  factory ListHadistModel.fromJson(Map<String, dynamic> json) => ListHadistModel(
    name: json["name"],
    id: json["id"],
    available: json["available"],
    requested: json["requested"],
    hadiths: List<HadistModel>.from(json["hadiths"].map((x) => HadistModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "available": available,
    "requested": requested,
    "hadiths": List<dynamic>.from(hadiths!.map((x) => x.toJson())),
  };

  ListHadist toEntity() {
    return ListHadist(
      name: name  ?? "",
      id: id,
      available: available ?? 0,
      requested: requested ?? 0,
      hadiths: hadiths!
          .map(
              (hadits) => Hadith(
                number: hadits.number ?? 0,
                arab: hadits.arab ?? "",
                id: hadits.id ?? "",
              ),
      ).toList(),
    );
  }

  @override
  List<Object?> get props => [
    name,
    id,
    available,
    requested,
    hadiths,
  ];
}

class HadistModel extends Equatable {
  const HadistModel({
    this.number,
    this.arab,
    this.id,
  });

  final int? number;
  final String? arab;
  final String? id;

  factory HadistModel.fromJson(Map<String, dynamic> json) => HadistModel(
    number: json["number"],
    arab: json["arab"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "arab": arab,
    "id": id,
  };

  Hadith toEntity() {
    return Hadith(
      number: number ?? 0,
      arab: arab ?? "",
      id: id ?? "",
    );
  }

  @override
  List<Object?> get props => [
    number,
    arab,
    id,
  ];
}

