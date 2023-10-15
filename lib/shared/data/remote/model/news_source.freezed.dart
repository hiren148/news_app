// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsSourceNetModel _$NewsSourceNetModelFromJson(Map<String, dynamic> json) {
  return _NewsSourceNetModel.fromJson(json);
}

/// @nodoc
mixin _$NewsSourceNetModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsSourceNetModelCopyWith<NewsSourceNetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsSourceNetModelCopyWith<$Res> {
  factory $NewsSourceNetModelCopyWith(
          NewsSourceNetModel value, $Res Function(NewsSourceNetModel) then) =
      _$NewsSourceNetModelCopyWithImpl<$Res, NewsSourceNetModel>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$NewsSourceNetModelCopyWithImpl<$Res, $Val extends NewsSourceNetModel>
    implements $NewsSourceNetModelCopyWith<$Res> {
  _$NewsSourceNetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsSourceNetModelImplCopyWith<$Res>
    implements $NewsSourceNetModelCopyWith<$Res> {
  factory _$$NewsSourceNetModelImplCopyWith(_$NewsSourceNetModelImpl value,
          $Res Function(_$NewsSourceNetModelImpl) then) =
      __$$NewsSourceNetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$NewsSourceNetModelImplCopyWithImpl<$Res>
    extends _$NewsSourceNetModelCopyWithImpl<$Res, _$NewsSourceNetModelImpl>
    implements _$$NewsSourceNetModelImplCopyWith<$Res> {
  __$$NewsSourceNetModelImplCopyWithImpl(_$NewsSourceNetModelImpl _value,
      $Res Function(_$NewsSourceNetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$NewsSourceNetModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsSourceNetModelImpl implements _NewsSourceNetModel {
  const _$NewsSourceNetModelImpl({this.id, this.name});

  factory _$NewsSourceNetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsSourceNetModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'NewsSourceNetModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsSourceNetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsSourceNetModelImplCopyWith<_$NewsSourceNetModelImpl> get copyWith =>
      __$$NewsSourceNetModelImplCopyWithImpl<_$NewsSourceNetModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsSourceNetModelImplToJson(
      this,
    );
  }
}

abstract class _NewsSourceNetModel implements NewsSourceNetModel {
  const factory _NewsSourceNetModel({final String? id, final String? name}) =
      _$NewsSourceNetModelImpl;

  factory _NewsSourceNetModel.fromJson(Map<String, dynamic> json) =
      _$NewsSourceNetModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$NewsSourceNetModelImplCopyWith<_$NewsSourceNetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
