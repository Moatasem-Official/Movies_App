import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ErrorModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  @override
  List<Object?> get props => [success, statusCode, statusMessage];
}
