import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:management_app_chat/component/timestamp.dart';

part 'draftnews.freezed.dart';
part 'draftnews.g.dart';

@freezed
class DraftNews with _$DraftNews {
  factory DraftNews({
    required String draftNewsId,
    required String draftNewsTitle,
    required String draftNewsMessage,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _DraftNews;

  factory DraftNews.fromJson(Map<String, dynamic> json) =>
      _$DraftNewsFromJson(json);
}
