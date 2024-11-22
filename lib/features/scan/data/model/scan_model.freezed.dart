// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryItemModel _$InventoryItemModelFromJson(Map<String, dynamic> json) {
  return _InventoryItemModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryItemModel {
  @JsonKey(name: "inventoryId")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "redirectUrl")
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<HelixImageInfo>? get images => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isCoupon => throw _privateConstructorUsedError;
  String? get creator => throw _privateConstructorUsedError;
  int? get numberOfScans => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  int? get quantityRemaining => throw _privateConstructorUsedError;
  int? get maximumRedemptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryItemModelCopyWith<InventoryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryItemModelCopyWith<$Res> {
  factory $InventoryItemModelCopyWith(
          InventoryItemModel value, $Res Function(InventoryItemModel) then) =
      _$InventoryItemModelCopyWithImpl<$Res, InventoryItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "inventoryId") String? id,
      @JsonKey(name: "redirectUrl") String? url,
      @JsonKey(name: "name") String? title,
      @JsonKey(name: 'images') List<HelixImageInfo>? images,
      String? description,
      bool? isCoupon,
      String? creator,
      int? numberOfScans,
      String? code,
      int? quantityRemaining,
      int? maximumRedemptions});
}

/// @nodoc
class _$InventoryItemModelCopyWithImpl<$Res, $Val extends InventoryItemModel>
    implements $InventoryItemModelCopyWith<$Res> {
  _$InventoryItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? title = freezed,
    Object? images = freezed,
    Object? description = freezed,
    Object? isCoupon = freezed,
    Object? creator = freezed,
    Object? numberOfScans = freezed,
    Object? code = freezed,
    Object? quantityRemaining = freezed,
    Object? maximumRedemptions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<HelixImageInfo>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCoupon: freezed == isCoupon
          ? _value.isCoupon
          : isCoupon // ignore: cast_nullable_to_non_nullable
              as bool?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfScans: freezed == numberOfScans
          ? _value.numberOfScans
          : numberOfScans // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityRemaining: freezed == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      maximumRedemptions: freezed == maximumRedemptions
          ? _value.maximumRedemptions
          : maximumRedemptions // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryItemModelImplCopyWith<$Res>
    implements $InventoryItemModelCopyWith<$Res> {
  factory _$$InventoryItemModelImplCopyWith(_$InventoryItemModelImpl value,
          $Res Function(_$InventoryItemModelImpl) then) =
      __$$InventoryItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "inventoryId") String? id,
      @JsonKey(name: "redirectUrl") String? url,
      @JsonKey(name: "name") String? title,
      @JsonKey(name: 'images') List<HelixImageInfo>? images,
      String? description,
      bool? isCoupon,
      String? creator,
      int? numberOfScans,
      String? code,
      int? quantityRemaining,
      int? maximumRedemptions});
}

/// @nodoc
class __$$InventoryItemModelImplCopyWithImpl<$Res>
    extends _$InventoryItemModelCopyWithImpl<$Res, _$InventoryItemModelImpl>
    implements _$$InventoryItemModelImplCopyWith<$Res> {
  __$$InventoryItemModelImplCopyWithImpl(_$InventoryItemModelImpl _value,
      $Res Function(_$InventoryItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? title = freezed,
    Object? images = freezed,
    Object? description = freezed,
    Object? isCoupon = freezed,
    Object? creator = freezed,
    Object? numberOfScans = freezed,
    Object? code = freezed,
    Object? quantityRemaining = freezed,
    Object? maximumRedemptions = freezed,
  }) {
    return _then(_$InventoryItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<HelixImageInfo>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCoupon: freezed == isCoupon
          ? _value.isCoupon
          : isCoupon // ignore: cast_nullable_to_non_nullable
              as bool?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfScans: freezed == numberOfScans
          ? _value.numberOfScans
          : numberOfScans // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityRemaining: freezed == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      maximumRedemptions: freezed == maximumRedemptions
          ? _value.maximumRedemptions
          : maximumRedemptions // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryItemModelImpl implements _InventoryItemModel {
  const _$InventoryItemModelImpl(
      {@JsonKey(name: "inventoryId") this.id,
      @JsonKey(name: "redirectUrl") this.url,
      @JsonKey(name: "name") this.title,
      @JsonKey(name: 'images') final List<HelixImageInfo>? images,
      this.description,
      this.isCoupon,
      this.creator,
      this.numberOfScans,
      this.code,
      this.quantityRemaining,
      this.maximumRedemptions})
      : _images = images;

  factory _$InventoryItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryItemModelImplFromJson(json);

  @override
  @JsonKey(name: "inventoryId")
  final String? id;
  @override
  @JsonKey(name: "redirectUrl")
  final String? url;
  @override
  @JsonKey(name: "name")
  final String? title;
  final List<HelixImageInfo>? _images;
  @override
  @JsonKey(name: 'images')
  List<HelixImageInfo>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;
  @override
  final bool? isCoupon;
  @override
  final String? creator;
  @override
  final int? numberOfScans;
  @override
  final String? code;
  @override
  final int? quantityRemaining;
  @override
  final int? maximumRedemptions;

  @override
  String toString() {
    return 'InventoryItemModel(id: $id, url: $url, title: $title, images: $images, description: $description, isCoupon: $isCoupon, creator: $creator, numberOfScans: $numberOfScans, code: $code, quantityRemaining: $quantityRemaining, maximumRedemptions: $maximumRedemptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCoupon, isCoupon) ||
                other.isCoupon == isCoupon) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.numberOfScans, numberOfScans) ||
                other.numberOfScans == numberOfScans) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.quantityRemaining, quantityRemaining) ||
                other.quantityRemaining == quantityRemaining) &&
            (identical(other.maximumRedemptions, maximumRedemptions) ||
                other.maximumRedemptions == maximumRedemptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      url,
      title,
      const DeepCollectionEquality().hash(_images),
      description,
      isCoupon,
      creator,
      numberOfScans,
      code,
      quantityRemaining,
      maximumRedemptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryItemModelImplCopyWith<_$InventoryItemModelImpl> get copyWith =>
      __$$InventoryItemModelImplCopyWithImpl<_$InventoryItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryItemModelImplToJson(
      this,
    );
  }
}

abstract class _InventoryItemModel implements InventoryItemModel {
  const factory _InventoryItemModel(
      {@JsonKey(name: "inventoryId") final String? id,
      @JsonKey(name: "redirectUrl") final String? url,
      @JsonKey(name: "name") final String? title,
      @JsonKey(name: 'images') final List<HelixImageInfo>? images,
      final String? description,
      final bool? isCoupon,
      final String? creator,
      final int? numberOfScans,
      final String? code,
      final int? quantityRemaining,
      final int? maximumRedemptions}) = _$InventoryItemModelImpl;

  factory _InventoryItemModel.fromJson(Map<String, dynamic> json) =
      _$InventoryItemModelImpl.fromJson;

  @override
  @JsonKey(name: "inventoryId")
  String? get id;
  @override
  @JsonKey(name: "redirectUrl")
  String? get url;
  @override
  @JsonKey(name: "name")
  String? get title;
  @override
  @JsonKey(name: 'images')
  List<HelixImageInfo>? get images;
  @override
  String? get description;
  @override
  bool? get isCoupon;
  @override
  String? get creator;
  @override
  int? get numberOfScans;
  @override
  String? get code;
  @override
  int? get quantityRemaining;
  @override
  int? get maximumRedemptions;
  @override
  @JsonKey(ignore: true)
  _$$InventoryItemModelImplCopyWith<_$InventoryItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryItemV4Model _$InventoryItemV4ModelFromJson(Map<String, dynamic> json) {
  return _InventoryItemV4Model.fromJson(json);
}

/// @nodoc
mixin _$InventoryItemV4Model {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get storeUrl => throw _privateConstructorUsedError;
  String? get productUrl => throw _privateConstructorUsedError;
  List<InventoryItemV4ImageModel>? get images =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryItemV4ModelCopyWith<InventoryItemV4Model> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryItemV4ModelCopyWith<$Res> {
  factory $InventoryItemV4ModelCopyWith(InventoryItemV4Model value,
          $Res Function(InventoryItemV4Model) then) =
      _$InventoryItemV4ModelCopyWithImpl<$Res, InventoryItemV4Model>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      String? storeUrl,
      String? productUrl,
      List<InventoryItemV4ImageModel>? images});
}

/// @nodoc
class _$InventoryItemV4ModelCopyWithImpl<$Res,
        $Val extends InventoryItemV4Model>
    implements $InventoryItemV4ModelCopyWith<$Res> {
  _$InventoryItemV4ModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? storeUrl = freezed,
    Object? productUrl = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      storeUrl: freezed == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: freezed == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<InventoryItemV4ImageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryItemV4ModelImplCopyWith<$Res>
    implements $InventoryItemV4ModelCopyWith<$Res> {
  factory _$$InventoryItemV4ModelImplCopyWith(_$InventoryItemV4ModelImpl value,
          $Res Function(_$InventoryItemV4ModelImpl) then) =
      __$$InventoryItemV4ModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      String? storeUrl,
      String? productUrl,
      List<InventoryItemV4ImageModel>? images});
}

/// @nodoc
class __$$InventoryItemV4ModelImplCopyWithImpl<$Res>
    extends _$InventoryItemV4ModelCopyWithImpl<$Res, _$InventoryItemV4ModelImpl>
    implements _$$InventoryItemV4ModelImplCopyWith<$Res> {
  __$$InventoryItemV4ModelImplCopyWithImpl(_$InventoryItemV4ModelImpl _value,
      $Res Function(_$InventoryItemV4ModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? storeUrl = freezed,
    Object? productUrl = freezed,
    Object? images = freezed,
  }) {
    return _then(_$InventoryItemV4ModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      storeUrl: freezed == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: freezed == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<InventoryItemV4ImageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryItemV4ModelImpl implements _InventoryItemV4Model {
  const _$InventoryItemV4ModelImpl(
      {this.id,
      this.title,
      this.description,
      this.storeUrl,
      this.productUrl,
      final List<InventoryItemV4ImageModel>? images})
      : _images = images;

  factory _$InventoryItemV4ModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryItemV4ModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? storeUrl;
  @override
  final String? productUrl;
  final List<InventoryItemV4ImageModel>? _images;
  @override
  List<InventoryItemV4ImageModel>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InventoryItemV4Model(id: $id, title: $title, description: $description, storeUrl: $storeUrl, productUrl: $productUrl, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryItemV4ModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.storeUrl, storeUrl) ||
                other.storeUrl == storeUrl) &&
            (identical(other.productUrl, productUrl) ||
                other.productUrl == productUrl) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, storeUrl,
      productUrl, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryItemV4ModelImplCopyWith<_$InventoryItemV4ModelImpl>
      get copyWith =>
          __$$InventoryItemV4ModelImplCopyWithImpl<_$InventoryItemV4ModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryItemV4ModelImplToJson(
      this,
    );
  }
}

abstract class _InventoryItemV4Model implements InventoryItemV4Model {
  const factory _InventoryItemV4Model(
          {final String? id,
          final String? title,
          final String? description,
          final String? storeUrl,
          final String? productUrl,
          final List<InventoryItemV4ImageModel>? images}) =
      _$InventoryItemV4ModelImpl;

  factory _InventoryItemV4Model.fromJson(Map<String, dynamic> json) =
      _$InventoryItemV4ModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get storeUrl;
  @override
  String? get productUrl;
  @override
  List<InventoryItemV4ImageModel>? get images;
  @override
  @JsonKey(ignore: true)
  _$$InventoryItemV4ModelImplCopyWith<_$InventoryItemV4ModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryItemV4ImageModel _$InventoryItemV4ImageModelFromJson(
    Map<String, dynamic> json) {
  return _InventoryItemV4ImageModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryItemV4ImageModel {
  FileInfo? get file => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryItemV4ImageModelCopyWith<InventoryItemV4ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryItemV4ImageModelCopyWith<$Res> {
  factory $InventoryItemV4ImageModelCopyWith(InventoryItemV4ImageModel value,
          $Res Function(InventoryItemV4ImageModel) then) =
      _$InventoryItemV4ImageModelCopyWithImpl<$Res, InventoryItemV4ImageModel>;
  @useResult
  $Res call({FileInfo? file});

  $FileInfoCopyWith<$Res>? get file;
}

/// @nodoc
class _$InventoryItemV4ImageModelCopyWithImpl<$Res,
        $Val extends InventoryItemV4ImageModel>
    implements $InventoryItemV4ImageModelCopyWith<$Res> {
  _$InventoryItemV4ImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileInfoCopyWith<$Res>? get file {
    if (_value.file == null) {
      return null;
    }

    return $FileInfoCopyWith<$Res>(_value.file!, (value) {
      return _then(_value.copyWith(file: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InventoryItemV4ImageModelImplCopyWith<$Res>
    implements $InventoryItemV4ImageModelCopyWith<$Res> {
  factory _$$InventoryItemV4ImageModelImplCopyWith(
          _$InventoryItemV4ImageModelImpl value,
          $Res Function(_$InventoryItemV4ImageModelImpl) then) =
      __$$InventoryItemV4ImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FileInfo? file});

  @override
  $FileInfoCopyWith<$Res>? get file;
}

/// @nodoc
class __$$InventoryItemV4ImageModelImplCopyWithImpl<$Res>
    extends _$InventoryItemV4ImageModelCopyWithImpl<$Res,
        _$InventoryItemV4ImageModelImpl>
    implements _$$InventoryItemV4ImageModelImplCopyWith<$Res> {
  __$$InventoryItemV4ImageModelImplCopyWithImpl(
      _$InventoryItemV4ImageModelImpl _value,
      $Res Function(_$InventoryItemV4ImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(_$InventoryItemV4ImageModelImpl(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryItemV4ImageModelImpl implements _InventoryItemV4ImageModel {
  const _$InventoryItemV4ImageModelImpl({this.file});

  factory _$InventoryItemV4ImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryItemV4ImageModelImplFromJson(json);

  @override
  final FileInfo? file;

  @override
  String toString() {
    return 'InventoryItemV4ImageModel(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryItemV4ImageModelImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryItemV4ImageModelImplCopyWith<_$InventoryItemV4ImageModelImpl>
      get copyWith => __$$InventoryItemV4ImageModelImplCopyWithImpl<
          _$InventoryItemV4ImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryItemV4ImageModelImplToJson(
      this,
    );
  }
}

abstract class _InventoryItemV4ImageModel implements InventoryItemV4ImageModel {
  const factory _InventoryItemV4ImageModel({final FileInfo? file}) =
      _$InventoryItemV4ImageModelImpl;

  factory _InventoryItemV4ImageModel.fromJson(Map<String, dynamic> json) =
      _$InventoryItemV4ImageModelImpl.fromJson;

  @override
  FileInfo? get file;
  @override
  @JsonKey(ignore: true)
  _$$InventoryItemV4ImageModelImplCopyWith<_$InventoryItemV4ImageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ScanVirtualItemModel _$ScanVirtualItemModelFromJson(Map<String, dynamic> json) {
  return _ScanVirtualItemModel.fromJson(json);
}

/// @nodoc
mixin _$ScanVirtualItemModel {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanVirtualItemModelCopyWith<ScanVirtualItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanVirtualItemModelCopyWith<$Res> {
  factory $ScanVirtualItemModelCopyWith(ScanVirtualItemModel value,
          $Res Function(ScanVirtualItemModel) then) =
      _$ScanVirtualItemModelCopyWithImpl<$Res, ScanVirtualItemModel>;
  @useResult
  $Res call({String? id, String? title, String? description});
}

/// @nodoc
class _$ScanVirtualItemModelCopyWithImpl<$Res,
        $Val extends ScanVirtualItemModel>
    implements $ScanVirtualItemModelCopyWith<$Res> {
  _$ScanVirtualItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanVirtualItemModelImplCopyWith<$Res>
    implements $ScanVirtualItemModelCopyWith<$Res> {
  factory _$$ScanVirtualItemModelImplCopyWith(_$ScanVirtualItemModelImpl value,
          $Res Function(_$ScanVirtualItemModelImpl) then) =
      __$$ScanVirtualItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? title, String? description});
}

/// @nodoc
class __$$ScanVirtualItemModelImplCopyWithImpl<$Res>
    extends _$ScanVirtualItemModelCopyWithImpl<$Res, _$ScanVirtualItemModelImpl>
    implements _$$ScanVirtualItemModelImplCopyWith<$Res> {
  __$$ScanVirtualItemModelImplCopyWithImpl(_$ScanVirtualItemModelImpl _value,
      $Res Function(_$ScanVirtualItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$ScanVirtualItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanVirtualItemModelImpl implements _ScanVirtualItemModel {
  const _$ScanVirtualItemModelImpl({this.id, this.title, this.description});

  factory _$ScanVirtualItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanVirtualItemModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;

  @override
  String toString() {
    return 'ScanVirtualItemModel(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanVirtualItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanVirtualItemModelImplCopyWith<_$ScanVirtualItemModelImpl>
      get copyWith =>
          __$$ScanVirtualItemModelImplCopyWithImpl<_$ScanVirtualItemModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanVirtualItemModelImplToJson(
      this,
    );
  }
}

abstract class _ScanVirtualItemModel implements ScanVirtualItemModel {
  const factory _ScanVirtualItemModel(
      {final String? id,
      final String? title,
      final String? description}) = _$ScanVirtualItemModelImpl;

  factory _ScanVirtualItemModel.fromJson(Map<String, dynamic> json) =
      _$ScanVirtualItemModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ScanVirtualItemModelImplCopyWith<_$ScanVirtualItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ScanResponseModel _$ScanResponseModelFromJson(Map<String, dynamic> json) {
  return _ScanResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ScanResponseModel {
  ScanVirtualItemModel? get virtualItem => throw _privateConstructorUsedError;
  InventoryItemV4Model? get inventory => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanResponseModelCopyWith<ScanResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanResponseModelCopyWith<$Res> {
  factory $ScanResponseModelCopyWith(
          ScanResponseModel value, $Res Function(ScanResponseModel) then) =
      _$ScanResponseModelCopyWithImpl<$Res, ScanResponseModel>;
  @useResult
  $Res call(
      {ScanVirtualItemModel? virtualItem,
      InventoryItemV4Model? inventory,
      String? code});

  $ScanVirtualItemModelCopyWith<$Res>? get virtualItem;
  $InventoryItemV4ModelCopyWith<$Res>? get inventory;
}

/// @nodoc
class _$ScanResponseModelCopyWithImpl<$Res, $Val extends ScanResponseModel>
    implements $ScanResponseModelCopyWith<$Res> {
  _$ScanResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? virtualItem = freezed,
    Object? inventory = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      virtualItem: freezed == virtualItem
          ? _value.virtualItem
          : virtualItem // ignore: cast_nullable_to_non_nullable
              as ScanVirtualItemModel?,
      inventory: freezed == inventory
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as InventoryItemV4Model?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScanVirtualItemModelCopyWith<$Res>? get virtualItem {
    if (_value.virtualItem == null) {
      return null;
    }

    return $ScanVirtualItemModelCopyWith<$Res>(_value.virtualItem!, (value) {
      return _then(_value.copyWith(virtualItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InventoryItemV4ModelCopyWith<$Res>? get inventory {
    if (_value.inventory == null) {
      return null;
    }

    return $InventoryItemV4ModelCopyWith<$Res>(_value.inventory!, (value) {
      return _then(_value.copyWith(inventory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScanResponseModelImplCopyWith<$Res>
    implements $ScanResponseModelCopyWith<$Res> {
  factory _$$ScanResponseModelImplCopyWith(_$ScanResponseModelImpl value,
          $Res Function(_$ScanResponseModelImpl) then) =
      __$$ScanResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScanVirtualItemModel? virtualItem,
      InventoryItemV4Model? inventory,
      String? code});

  @override
  $ScanVirtualItemModelCopyWith<$Res>? get virtualItem;
  @override
  $InventoryItemV4ModelCopyWith<$Res>? get inventory;
}

/// @nodoc
class __$$ScanResponseModelImplCopyWithImpl<$Res>
    extends _$ScanResponseModelCopyWithImpl<$Res, _$ScanResponseModelImpl>
    implements _$$ScanResponseModelImplCopyWith<$Res> {
  __$$ScanResponseModelImplCopyWithImpl(_$ScanResponseModelImpl _value,
      $Res Function(_$ScanResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? virtualItem = freezed,
    Object? inventory = freezed,
    Object? code = freezed,
  }) {
    return _then(_$ScanResponseModelImpl(
      virtualItem: freezed == virtualItem
          ? _value.virtualItem
          : virtualItem // ignore: cast_nullable_to_non_nullable
              as ScanVirtualItemModel?,
      inventory: freezed == inventory
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as InventoryItemV4Model?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanResponseModelImpl implements _ScanResponseModel {
  const _$ScanResponseModelImpl({this.virtualItem, this.inventory, this.code});

  factory _$ScanResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanResponseModelImplFromJson(json);

  @override
  final ScanVirtualItemModel? virtualItem;
  @override
  final InventoryItemV4Model? inventory;
  @override
  final String? code;

  @override
  String toString() {
    return 'ScanResponseModel(virtualItem: $virtualItem, inventory: $inventory, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanResponseModelImpl &&
            (identical(other.virtualItem, virtualItem) ||
                other.virtualItem == virtualItem) &&
            (identical(other.inventory, inventory) ||
                other.inventory == inventory) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, virtualItem, inventory, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanResponseModelImplCopyWith<_$ScanResponseModelImpl> get copyWith =>
      __$$ScanResponseModelImplCopyWithImpl<_$ScanResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ScanResponseModel implements ScanResponseModel {
  const factory _ScanResponseModel(
      {final ScanVirtualItemModel? virtualItem,
      final InventoryItemV4Model? inventory,
      final String? code}) = _$ScanResponseModelImpl;

  factory _ScanResponseModel.fromJson(Map<String, dynamic> json) =
      _$ScanResponseModelImpl.fromJson;

  @override
  ScanVirtualItemModel? get virtualItem;
  @override
  InventoryItemV4Model? get inventory;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$ScanResponseModelImplCopyWith<_$ScanResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HelixImageInfo _$HelixImageInfoFromJson(Map<String, dynamic> json) {
  return _HelixImageInfo.fromJson(json);
}

/// @nodoc
mixin _$HelixImageInfo {
  @JsonKey(name: 'file')
  FileInfo get file => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HelixImageInfoCopyWith<HelixImageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelixImageInfoCopyWith<$Res> {
  factory $HelixImageInfoCopyWith(
          HelixImageInfo value, $Res Function(HelixImageInfo) then) =
      _$HelixImageInfoCopyWithImpl<$Res, HelixImageInfo>;
  @useResult
  $Res call({@JsonKey(name: 'file') FileInfo file});

  $FileInfoCopyWith<$Res> get file;
}

/// @nodoc
class _$HelixImageInfoCopyWithImpl<$Res, $Val extends HelixImageInfo>
    implements $HelixImageInfoCopyWith<$Res> {
  _$HelixImageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileInfoCopyWith<$Res> get file {
    return $FileInfoCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HelixImageInfoImplCopyWith<$Res>
    implements $HelixImageInfoCopyWith<$Res> {
  factory _$$HelixImageInfoImplCopyWith(_$HelixImageInfoImpl value,
          $Res Function(_$HelixImageInfoImpl) then) =
      __$$HelixImageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'file') FileInfo file});

  @override
  $FileInfoCopyWith<$Res> get file;
}

/// @nodoc
class __$$HelixImageInfoImplCopyWithImpl<$Res>
    extends _$HelixImageInfoCopyWithImpl<$Res, _$HelixImageInfoImpl>
    implements _$$HelixImageInfoImplCopyWith<$Res> {
  __$$HelixImageInfoImplCopyWithImpl(
      _$HelixImageInfoImpl _value, $Res Function(_$HelixImageInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$HelixImageInfoImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HelixImageInfoImpl implements _HelixImageInfo {
  const _$HelixImageInfoImpl({@JsonKey(name: 'file') required this.file});

  factory _$HelixImageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HelixImageInfoImplFromJson(json);

  @override
  @JsonKey(name: 'file')
  final FileInfo file;

  @override
  String toString() {
    return 'HelixImageInfo(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelixImageInfoImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HelixImageInfoImplCopyWith<_$HelixImageInfoImpl> get copyWith =>
      __$$HelixImageInfoImplCopyWithImpl<_$HelixImageInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HelixImageInfoImplToJson(
      this,
    );
  }
}

abstract class _HelixImageInfo implements HelixImageInfo {
  const factory _HelixImageInfo(
          {@JsonKey(name: 'file') required final FileInfo file}) =
      _$HelixImageInfoImpl;

  factory _HelixImageInfo.fromJson(Map<String, dynamic> json) =
      _$HelixImageInfoImpl.fromJson;

  @override
  @JsonKey(name: 'file')
  FileInfo get file;
  @override
  @JsonKey(ignore: true)
  _$$HelixImageInfoImplCopyWith<_$HelixImageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileInfo _$FileInfoFromJson(Map<String, dynamic> json) {
  return _FileInfo.fromJson(json);
}

/// @nodoc
mixin _$FileInfo {
  @JsonKey(name: "download_url")
  String? get downloadUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileInfoCopyWith<FileInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileInfoCopyWith<$Res> {
  factory $FileInfoCopyWith(FileInfo value, $Res Function(FileInfo) then) =
      _$FileInfoCopyWithImpl<$Res, FileInfo>;
  @useResult
  $Res call({@JsonKey(name: "download_url") String? downloadUrl});
}

/// @nodoc
class _$FileInfoCopyWithImpl<$Res, $Val extends FileInfo>
    implements $FileInfoCopyWith<$Res> {
  _$FileInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileInfoImplCopyWith<$Res>
    implements $FileInfoCopyWith<$Res> {
  factory _$$FileInfoImplCopyWith(
          _$FileInfoImpl value, $Res Function(_$FileInfoImpl) then) =
      __$$FileInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "download_url") String? downloadUrl});
}

/// @nodoc
class __$$FileInfoImplCopyWithImpl<$Res>
    extends _$FileInfoCopyWithImpl<$Res, _$FileInfoImpl>
    implements _$$FileInfoImplCopyWith<$Res> {
  __$$FileInfoImplCopyWithImpl(
      _$FileInfoImpl _value, $Res Function(_$FileInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadUrl = freezed,
  }) {
    return _then(_$FileInfoImpl(
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileInfoImpl implements _FileInfo {
  const _$FileInfoImpl({@JsonKey(name: "download_url") this.downloadUrl});

  factory _$FileInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileInfoImplFromJson(json);

  @override
  @JsonKey(name: "download_url")
  final String? downloadUrl;

  @override
  String toString() {
    return 'FileInfo(downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileInfoImpl &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, downloadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileInfoImplCopyWith<_$FileInfoImpl> get copyWith =>
      __$$FileInfoImplCopyWithImpl<_$FileInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileInfoImplToJson(
      this,
    );
  }
}

abstract class _FileInfo implements FileInfo {
  const factory _FileInfo(
          {@JsonKey(name: "download_url") final String? downloadUrl}) =
      _$FileInfoImpl;

  factory _FileInfo.fromJson(Map<String, dynamic> json) =
      _$FileInfoImpl.fromJson;

  @override
  @JsonKey(name: "download_url")
  String? get downloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$FileInfoImplCopyWith<_$FileInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
