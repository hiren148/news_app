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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsNetModel _$NewsNetModelFromJson(Map<String, dynamic> json) {
  return _NewsNetModel.fromJson(json);
}

/// @nodoc
mixin _$NewsNetModel {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  NewsSourceNetModel? get source => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get urlToImage => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsNetModelCopyWith<NewsNetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsNetModelCopyWith<$Res> {
  factory $NewsNetModelCopyWith(
          NewsNetModel value, $Res Function(NewsNetModel) then) =
      _$NewsNetModelCopyWithImpl<$Res, NewsNetModel>;
  @useResult
  $Res call(
      {String? title,
      String? description,
      NewsSourceNetModel? source,
      String? publishedAt,
      String? content,
      String? url,
      String? urlToImage,
      String? author});

  $NewsSourceNetModelCopyWith<$Res>? get source;
}

/// @nodoc
class _$NewsNetModelCopyWithImpl<$Res, $Val extends NewsNetModel>
    implements $NewsNetModelCopyWith<$Res> {
  _$NewsNetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? source = freezed,
    Object? publishedAt = freezed,
    Object? content = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as NewsSourceNetModel?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsSourceNetModelCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $NewsSourceNetModelCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsNetModelImplCopyWith<$Res>
    implements $NewsNetModelCopyWith<$Res> {
  factory _$$NewsNetModelImplCopyWith(
          _$NewsNetModelImpl value, $Res Function(_$NewsNetModelImpl) then) =
      __$$NewsNetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? description,
      NewsSourceNetModel? source,
      String? publishedAt,
      String? content,
      String? url,
      String? urlToImage,
      String? author});

  @override
  $NewsSourceNetModelCopyWith<$Res>? get source;
}

/// @nodoc
class __$$NewsNetModelImplCopyWithImpl<$Res>
    extends _$NewsNetModelCopyWithImpl<$Res, _$NewsNetModelImpl>
    implements _$$NewsNetModelImplCopyWith<$Res> {
  __$$NewsNetModelImplCopyWithImpl(
      _$NewsNetModelImpl _value, $Res Function(_$NewsNetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? source = freezed,
    Object? publishedAt = freezed,
    Object? content = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? author = freezed,
  }) {
    return _then(_$NewsNetModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as NewsSourceNetModel?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsNetModelImpl implements _NewsNetModel {
  const _$NewsNetModelImpl(
      {this.title,
      this.description,
      this.source,
      this.publishedAt,
      this.content,
      this.url,
      this.urlToImage,
      this.author});

  factory _$NewsNetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsNetModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final NewsSourceNetModel? source;
  @override
  final String? publishedAt;
  @override
  final String? content;
  @override
  final String? url;
  @override
  final String? urlToImage;
  @override
  final String? author;

  @override
  String toString() {
    return 'NewsNetModel(title: $title, description: $description, source: $source, publishedAt: $publishedAt, content: $content, url: $url, urlToImage: $urlToImage, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsNetModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, source,
      publishedAt, content, url, urlToImage, author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsNetModelImplCopyWith<_$NewsNetModelImpl> get copyWith =>
      __$$NewsNetModelImplCopyWithImpl<_$NewsNetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsNetModelImplToJson(
      this,
    );
  }
}

abstract class _NewsNetModel implements NewsNetModel {
  const factory _NewsNetModel(
      {final String? title,
      final String? description,
      final NewsSourceNetModel? source,
      final String? publishedAt,
      final String? content,
      final String? url,
      final String? urlToImage,
      final String? author}) = _$NewsNetModelImpl;

  factory _NewsNetModel.fromJson(Map<String, dynamic> json) =
      _$NewsNetModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  NewsSourceNetModel? get source;
  @override
  String? get publishedAt;
  @override
  String? get content;
  @override
  String? get url;
  @override
  String? get urlToImage;
  @override
  String? get author;
  @override
  @JsonKey(ignore: true)
  _$$NewsNetModelImplCopyWith<_$NewsNetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
