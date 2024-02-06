// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draftnews.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DraftNews _$DraftNewsFromJson(Map<String, dynamic> json) {
  return _DraftNews.fromJson(json);
}

/// @nodoc
mixin _$DraftNews {
  String get draftNewsId => throw _privateConstructorUsedError;
  String get draftNewsTitle => throw _privateConstructorUsedError;
  String get draftNewsMessage => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DraftNewsCopyWith<DraftNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftNewsCopyWith<$Res> {
  factory $DraftNewsCopyWith(DraftNews value, $Res Function(DraftNews) then) =
      _$DraftNewsCopyWithImpl<$Res, DraftNews>;
  @useResult
  $Res call(
      {String draftNewsId,
      String draftNewsTitle,
      String draftNewsMessage,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class _$DraftNewsCopyWithImpl<$Res, $Val extends DraftNews>
    implements $DraftNewsCopyWith<$Res> {
  _$DraftNewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftNewsId = null,
    Object? draftNewsTitle = null,
    Object? draftNewsMessage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      draftNewsId: null == draftNewsId
          ? _value.draftNewsId
          : draftNewsId // ignore: cast_nullable_to_non_nullable
              as String,
      draftNewsTitle: null == draftNewsTitle
          ? _value.draftNewsTitle
          : draftNewsTitle // ignore: cast_nullable_to_non_nullable
              as String,
      draftNewsMessage: null == draftNewsMessage
          ? _value.draftNewsMessage
          : draftNewsMessage // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$DraftNewsImplCopyWith<$Res>
    implements $DraftNewsCopyWith<$Res> {
  factory _$$DraftNewsImplCopyWith(
          _$DraftNewsImpl value, $Res Function(_$DraftNewsImpl) then) =
      __$$DraftNewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String draftNewsId,
      String draftNewsTitle,
      String draftNewsMessage,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class __$$DraftNewsImplCopyWithImpl<$Res>
    extends _$DraftNewsCopyWithImpl<$Res, _$DraftNewsImpl>
    implements _$$DraftNewsImplCopyWith<$Res> {
  __$$DraftNewsImplCopyWithImpl(
      _$DraftNewsImpl _value, $Res Function(_$DraftNewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftNewsId = null,
    Object? draftNewsTitle = null,
    Object? draftNewsMessage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DraftNewsImpl(
      draftNewsId: null == draftNewsId
          ? _value.draftNewsId
          : draftNewsId // ignore: cast_nullable_to_non_nullable
              as String,
      draftNewsTitle: null == draftNewsTitle
          ? _value.draftNewsTitle
          : draftNewsTitle // ignore: cast_nullable_to_non_nullable
              as String,
      draftNewsMessage: null == draftNewsMessage
          ? _value.draftNewsMessage
          : draftNewsMessage // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$DraftNewsImpl implements _DraftNews {
  _$DraftNewsImpl(
      {required this.draftNewsId,
      required this.draftNewsTitle,
      required this.draftNewsMessage,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt});

  factory _$DraftNewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftNewsImplFromJson(json);

  @override
  final String draftNewsId;
  @override
  final String draftNewsTitle;
  @override
  final String draftNewsMessage;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'DraftNews(draftNewsId: $draftNewsId, draftNewsTitle: $draftNewsTitle, draftNewsMessage: $draftNewsMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftNewsImpl &&
            (identical(other.draftNewsId, draftNewsId) ||
                other.draftNewsId == draftNewsId) &&
            (identical(other.draftNewsTitle, draftNewsTitle) ||
                other.draftNewsTitle == draftNewsTitle) &&
            (identical(other.draftNewsMessage, draftNewsMessage) ||
                other.draftNewsMessage == draftNewsMessage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, draftNewsId, draftNewsTitle,
      draftNewsMessage, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftNewsImplCopyWith<_$DraftNewsImpl> get copyWith =>
      __$$DraftNewsImplCopyWithImpl<_$DraftNewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftNewsImplToJson(
      this,
    );
  }
}

abstract class _DraftNews implements DraftNews {
  factory _DraftNews(
          {required final String draftNewsId,
          required final String draftNewsTitle,
          required final String draftNewsMessage,
          @TimestampConverter() required final Timestamp createdAt,
          @TimestampConverter() required final Timestamp updatedAt}) =
      _$DraftNewsImpl;

  factory _DraftNews.fromJson(Map<String, dynamic> json) =
      _$DraftNewsImpl.fromJson;

  @override
  String get draftNewsId;
  @override
  String get draftNewsTitle;
  @override
  String get draftNewsMessage;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DraftNewsImplCopyWith<_$DraftNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
