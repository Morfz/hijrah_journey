import 'package:equatable/equatable.dart';
import 'package:hadist/data/models/list_hadist_model.dart';

class ListHadistResponse extends Equatable {
  final ListHadistModel surahDetailModel;

  const ListHadistResponse({required this.surahDetailModel});

  factory ListHadistResponse.fromJson(Map<String, dynamic> json) =>
      ListHadistResponse(
        surahDetailModel: ListHadistModel.fromJson(
          json["data"],
        ),
      );

  @override
  List<Object?> get props => [surahDetailModel];
}
