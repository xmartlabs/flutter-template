import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_error.freezed.dart';

@freezed
class GeneralError with _$GeneralError {
  const factory GeneralError({
    String? title,
    required String description,
    dynamic cause,
  }) = _GeneralError;
}
