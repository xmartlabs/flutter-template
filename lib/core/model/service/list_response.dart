import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ListResponse<T> with _$ListResponse<T> {
  factory ListResponse({
    required int count,
    required List<T> data,
  }) = _ListResponse<T>;

  factory ListResponse.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonModel) {
    final items = json['data'] as List<Map<String, dynamic>>;
    return ListResponse(
      count: json['count'],
      data: items.map(fromJsonModel).toList(),
    );
  }
}
