// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyLogModel _$MyLogModelFromJson(Map<String, dynamic> json) {
  return _MyLogModel.fromJson(json);
}

/// @nodoc
mixin _$MyLogModel {
  String? get id => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get game => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyLogModelCopyWith<MyLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyLogModelCopyWith<$Res> {
  factory $MyLogModelCopyWith(
          MyLogModel value, $Res Function(MyLogModel) then) =
      _$MyLogModelCopyWithImpl<$Res, MyLogModel>;
  @useResult
  $Res call(
      {String? id,
      String? productId,
      String? name,
      String? date,
      String? game,
      String? image,
      String? url});
}

/// @nodoc
class _$MyLogModelCopyWithImpl<$Res, $Val extends MyLogModel>
    implements $MyLogModelCopyWith<$Res> {
  _$MyLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? name = freezed,
    Object? date = freezed,
    Object? game = freezed,
    Object? image = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      game: freezed == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyLogModelImplCopyWith<$Res>
    implements $MyLogModelCopyWith<$Res> {
  factory _$$MyLogModelImplCopyWith(
          _$MyLogModelImpl value, $Res Function(_$MyLogModelImpl) then) =
      __$$MyLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? productId,
      String? name,
      String? date,
      String? game,
      String? image,
      String? url});
}

/// @nodoc
class __$$MyLogModelImplCopyWithImpl<$Res>
    extends _$MyLogModelCopyWithImpl<$Res, _$MyLogModelImpl>
    implements _$$MyLogModelImplCopyWith<$Res> {
  __$$MyLogModelImplCopyWithImpl(
      _$MyLogModelImpl _value, $Res Function(_$MyLogModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? name = freezed,
    Object? date = freezed,
    Object? game = freezed,
    Object? image = freezed,
    Object? url = freezed,
  }) {
    return _then(_$MyLogModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      game: freezed == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyLogModelImpl implements _MyLogModel {
  const _$MyLogModelImpl(
      {this.id,
      this.productId,
      this.name,
      this.date,
      this.game,
      this.image,
      this.url});

  factory _$MyLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyLogModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? productId;
  @override
  final String? name;
  @override
  final String? date;
  @override
  final String? game;
  @override
  final String? image;
  @override
  final String? url;

  @override
  String toString() {
    return 'MyLogModel(id: $id, productId: $productId, name: $name, date: $date, game: $game, image: $image, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyLogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, productId, name, date, game, image, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyLogModelImplCopyWith<_$MyLogModelImpl> get copyWith =>
      __$$MyLogModelImplCopyWithImpl<_$MyLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyLogModelImplToJson(
      this,
    );
  }
}

abstract class _MyLogModel implements MyLogModel {
  const factory _MyLogModel(
      {final String? id,
      final String? productId,
      final String? name,
      final String? date,
      final String? game,
      final String? image,
      final String? url}) = _$MyLogModelImpl;

  factory _MyLogModel.fromJson(Map<String, dynamic> json) =
      _$MyLogModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get productId;
  @override
  String? get name;
  @override
  String? get date;
  @override
  String? get game;
  @override
  String? get image;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$MyLogModelImplCopyWith<_$MyLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
