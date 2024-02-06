import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:management_app_chat/component/timestamp.dart';

part 'userdata.freezed.dart';
part 'userdata.g.dart';

@freezed
class UserData with _$UserData {
  factory UserData({
    required String userId,
    required String userName,
    required String imageUrl,
    required String profile,
    required List<String> nameOption,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
