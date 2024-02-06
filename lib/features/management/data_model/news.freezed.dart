// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  String get newsId => throw _privateConstructorUsedError;
  String get newsTitle => throw _privateConstructorUsedError;
  String get newsMessage => throw _privateConstructorUsedError;
  List<String> get readUserId => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {String newsId,
      String newsTitle,
      String newsMessage,
      List<String> readUserId,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsId = null,
    Object? newsTitle = null,
    Object? newsMessage = null,
    Object? readUserId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      newsId: null == newsId
          ? _value.newsId
          : newsId // ignore: cast_nullable_to_non_nullable
              as String,
      newsTitle: null == newsTitle
          ? _value.newsTitle
          : newsTitle // ignore: cast_nullable_to_non_nullable
              as String,
      newsMessage: null == newsMessage
          ? _value.newsMessage
          : newsMessage // ignore: cast_nullable_to_non_nullable
              as String,
      readUserId: null == readUserId
          ? _value.readUserId
          : readUserId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String newsId,
      String newsTitle,
      String newsMessage,
      List<String> readUserId,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsId = null,
    Object? newsTitle = null,
    Object? newsMessage = null,
    Object? readUserId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$NewsImpl(
      newsId: null == newsId
          ? _value.newsId
          : newsId // ignore: cast_nullable_to_non_nullable
              as String,
      newsTitle: null == newsTitle
          ? _value.newsTitle
          : newsTitle // ignore: cast_nullable_to_non_nullable
              as String,
      newsMessage: null == newsMessage
          ? _value.newsMessage
          : newsMessage // ignore: cast_nullable_to_non_nullable
              as String,
      readUserId: null == readUserId
          ? _value._readUserId
          : readUserId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl implements _News {
  _$NewsImpl(
      {required this.newsId,
      required this.newsTitle,
      required this.newsMessage,
      required final List<String> readUserId,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : _readUserId = readUserId;

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

  @override
  final String newsId;
  @override
  final String newsTitle;
  @override
  final String newsMessage;
  final List<String> _readUserId;
  @override
  List<String> get readUserId {
    if (_readUserId is EqualUnmodifiableListView) return _readUserId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readUserId);
  }

  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'News(newsId: $newsId, newsTitle: $newsTitle, newsMessage: $newsMessage, readUserId: $readUserId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.newsId, newsId) || other.newsId == newsId) &&
            (identical(other.newsTitle, newsTitle) ||
                other.newsTitle == newsTitle) &&
            (identical(other.newsMessage, newsMessage) ||
                other.newsMessage == newsMessage) &&
            const DeepCollectionEquality()
                .equals(other._readUserId, _readUserId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newsId, newsTitle, newsMessage,
      const DeepCollectionEquality().hash(_readUserId), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(
      this,
    );
  }
}

abstract class _News implements News {
  factory _News(
      {required final String newsId,
      required final String newsTitle,
      required final String newsMessage,
      required final List<String> readUserId,
      @TimestampConverter() required final Timestamp createdAt,
      @TimestampConverter() required final Timestamp updatedAt}) = _$NewsImpl;

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  String get newsId;
  @override
  String get newsTitle;
  @override
  String get newsMessage;
  @override
  List<String> get readUserId;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
