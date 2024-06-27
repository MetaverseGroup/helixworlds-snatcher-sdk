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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  List<ImageInfo>? get images => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'images') List<ImageInfo>? images,
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
              as List<ImageInfo>?,
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
      @JsonKey(name: 'images') List<ImageInfo>? images,
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
              as List<ImageInfo>?,
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
      @JsonKey(name: 'images') final List<ImageInfo>? images,
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
  final List<ImageInfo>? _images;
  @override
  @JsonKey(name: 'images')
  List<ImageInfo>? get images {
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
  bool operator ==(dynamic other) {
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
      @JsonKey(name: 'images') final List<ImageInfo>? images,
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
  List<ImageInfo>? get images;
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

ImageInfo _$ImageInfoFromJson(Map<String, dynamic> json) {
  return _ImageInfo.fromJson(json);
}

/// @nodoc
mixin _$ImageInfo {
  @JsonKey(name: 'file')
  FileInfo get file => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageInfoCopyWith<ImageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageInfoCopyWith<$Res> {
  factory $ImageInfoCopyWith(ImageInfo value, $Res Function(ImageInfo) then) =
      _$ImageInfoCopyWithImpl<$Res, ImageInfo>;
  @useResult
  $Res call({@JsonKey(name: 'file') FileInfo file});

  $FileInfoCopyWith<$Res> get file;
}

/// @nodoc
class _$ImageInfoCopyWithImpl<$Res, $Val extends ImageInfo>
    implements $ImageInfoCopyWith<$Res> {
  _$ImageInfoCopyWithImpl(this._value, this._then);

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
abstract class _$$ImageInfoImplCopyWith<$Res>
    implements $ImageInfoCopyWith<$Res> {
  factory _$$ImageInfoImplCopyWith(
          _$ImageInfoImpl value, $Res Function(_$ImageInfoImpl) then) =
      __$$ImageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'file') FileInfo file});

  @override
  $FileInfoCopyWith<$Res> get file;
}

/// @nodoc
class __$$ImageInfoImplCopyWithImpl<$Res>
    extends _$ImageInfoCopyWithImpl<$Res, _$ImageInfoImpl>
    implements _$$ImageInfoImplCopyWith<$Res> {
  __$$ImageInfoImplCopyWithImpl(
      _$ImageInfoImpl _value, $Res Function(_$ImageInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$ImageInfoImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageInfoImpl implements _ImageInfo {
  const _$ImageInfoImpl({@JsonKey(name: 'file') required this.file});

  factory _$ImageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageInfoImplFromJson(json);

  @override
  @JsonKey(name: 'file')
  final FileInfo file;

  @override
  String toString() {
    return 'ImageInfo(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageInfoImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageInfoImplCopyWith<_$ImageInfoImpl> get copyWith =>
      __$$ImageInfoImplCopyWithImpl<_$ImageInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageInfoImplToJson(
      this,
    );
  }
}

abstract class _ImageInfo implements ImageInfo {
  const factory _ImageInfo(
      {@JsonKey(name: 'file') required final FileInfo file}) = _$ImageInfoImpl;

  factory _ImageInfo.fromJson(Map<String, dynamic> json) =
      _$ImageInfoImpl.fromJson;

  @override
  @JsonKey(name: 'file')
  FileInfo get file;
  @override
  @JsonKey(ignore: true)
  _$$ImageInfoImplCopyWith<_$ImageInfoImpl> get copyWith =>
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
  bool operator ==(dynamic other) {
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
