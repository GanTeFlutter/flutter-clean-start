import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
final class Response with EquatableMixin {
  const Response({this.title, this.body});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  final int? title;
  final String? body;

  Response copyWith({int? title, String? body}) {
    return Response(title: title ?? this.title, body: body ?? this.body);
  }

  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  @override
  List<Object?> get props => [title, body];
}
