import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'response.g.dart';

@JsonSerializable()
@immutable
final class Response with EquatableMixin {
  final int? title;
  final String? body;

  const Response({this.title, this.body});

  Response copyWith({int? title, String? body}) {
    return Response(title: title ?? this.title, body: body ?? this.body);
  }

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  @override
  List<Object?> get props => [title, body];
}
