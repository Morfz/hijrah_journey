import 'package:equatable/equatable.dart';
import 'package:hadist/data/models/list_hadist_model.dart';

class SurahDetailResponse extends Equatable {
  final ListHadistModel surahDetailModel;

  const SurahDetailResponse({required this.surahDetailModel});

  factory SurahDetailResponse.fromJson(Map<String, dynamic> json) =>
      SurahDetailResponse(
        surahDetailModel: ListHadistModel.fromJson(
          json["data"],
        ),
      );

  @override
  List<Object?> get props => [surahDetailModel];
}
