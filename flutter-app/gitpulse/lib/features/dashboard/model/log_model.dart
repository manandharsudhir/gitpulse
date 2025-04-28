// To parse this JSON data, do
//
//     final logModel = logModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'log_model.freezed.dart';
part 'log_model.g.dart';

LogModel logModelFromJson(String str) => LogModel.fromJson(json.decode(str));

String logModelToJson(LogModel data) => json.encode(data.toJson());

@freezed
class LogModel with _$LogModel {
  const factory LogModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") dynamic userId,
    @JsonKey(name: "project_id") String? projectId,
    @JsonKey(name: "hours_logged") int? hoursLogged,
    @JsonKey(name: "date_created") DateTime? dateCreated,
    @JsonKey(name: "description") String? description,
  }) = _LogModel;

  factory LogModel.fromJson(Map<String, dynamic> json) =>
      _$LogModelFromJson(json);
}
