import 'package:equatable/equatable.dart';
import 'package:alquran/data/models/juz_model.dart';

class JuzDetailResponse extends Equatable {
  final JuzDetailModel juzDetailModel;

  const JuzDetailResponse({required this.juzDetailModel});

  factory JuzDetailResponse.fromJson(Map<String, dynamic> json) =>
      JuzDetailResponse(
        juzDetailModel: JuzDetailModel.fromJson(
          json["data"],
        ),
      );

  @override
  List<Object?> get props => [juzDetailModel];
}
