import 'package:equatable/equatable.dart';
import 'package:hadist/data/models/rawi_model.dart';

class SurahResponse extends Equatable {
  final List<SurahModel> surahList;

  const SurahResponse({required this.surahList});

  factory SurahResponse.fromJson(Map<String, dynamic> json) => SurahResponse(
        surahList: List<SurahModel>.from(
          json["data"].map(
            (x) => SurahModel.fromJson(x),
          ),
        ),
      );

  @override
  List<Object?> get props => [surahList];
}
