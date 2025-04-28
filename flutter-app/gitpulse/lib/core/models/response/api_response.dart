// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    bool? success,
    dynamic payload,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
