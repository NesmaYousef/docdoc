import 'package:docdoc/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  @JsonKey(name: 'data')
  final Map<String, List<String>>? errors;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code, this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Utility method to get all error messages
  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) {
      return message ?? 'An unknown error occurred.';
    }
    final errorMessages = errors!.entries.map(
        (entry){
          final value = entry.value;
          return value.join(',');
        }
    ).join('\n');
    return errorMessages;

  }
}