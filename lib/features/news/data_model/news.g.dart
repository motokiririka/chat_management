// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      newsId: json['newsId'] as String,
      newsTitle: json['newsTitle'] as String,
      newsMessage: json['newsMessage'] as String,
      readUserId: (json['readUserId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'newsId': instance.newsId,
      'newsTitle': instance.newsTitle,
      'newsMessage': instance.newsMessage,
      'readUserId': instance.readUserId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
