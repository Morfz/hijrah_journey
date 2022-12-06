import 'package:equatable/equatable.dart';
import 'package:hadist/data/models/rawi_model.dart';

class RawiResponse extends Equatable {
  final List<RawiModel> surahList;

  const RawiResponse({required this.surahList});

  factory RawiResponse.fromJson(Map<String, dynamic> json) => RawiResponse(
        surahList: List<RawiModel>.from(
          json["data"].map(
            (x) => RawiModel.fromJson(x),
          ),
        ),
      );

  @override
  List<Object?> get props => [surahList];
}
