import 'package:json_annotation/json_annotation.dart';

part 'report_ggamf.g.dart';

@JsonSerializable()
class ReportGgamf {
  String detail;
  int badUserId;
  int userId;
  int reasonCodeId;

  ReportGgamf({
    required this.badUserId,
    required this.userId,
    required this.detail,
    required this.reasonCodeId,
  });

  factory ReportGgamf.fromJson(Map<String, dynamic> json) => _$ReportGgamfFromJson(json);

  Map<String, dynamic> toJson() => _$ReportGgamfToJson(this);
}
