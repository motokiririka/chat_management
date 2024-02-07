import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:management_app_chat/component/timestamp.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  factory News({
    required String newsId,
    required String newsTitle,
    required String newsMessage,
    required List<String> readUserId,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
