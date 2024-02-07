// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draftnews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DraftNewsImpl _$$DraftNewsImplFromJson(Map<String, dynamic> json) =>
    _$DraftNewsImpl(
      draftNewsId: json['draftNewsId'] as String,
      draftNewsTitle: json['draftNewsTitle'] as String,
      draftNewsMessage: json['draftNewsMessage'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$DraftNewsImplToJson(_$DraftNewsImpl instance) =>
    <String, dynamic>{
      'draftNewsId': instance.draftNewsId,
      'draftNewsTitle': instance.draftNewsTitle,
      'draftNewsMessage': instance.draftNewsMessage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
