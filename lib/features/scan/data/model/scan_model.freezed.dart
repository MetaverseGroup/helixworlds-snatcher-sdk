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
      String? description});
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
      String? description});
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
      this.description})
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
  String toString() {
    return 'InventoryItemModel(id: $id, url: $url, title: $title, images: $images, description: $description)';
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
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, title,
      const DeepCollectionEquality().hash(_images), description);

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
      final String? description}) = _$InventoryItemModelImpl;

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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get extension => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

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
  $Res call(
      {String id,
      String name,
      String extension,
      String path,
      String downloadUrl,
      int size,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
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
    Object? id = null,
    Object? name = null,
    Object? extension = null,
    Object? path = null,
    Object? downloadUrl = null,
    Object? size = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  $Res call(
      {String id,
      String name,
      String extension,
      String path,
      String downloadUrl,
      int size,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
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
    Object? id = null,
    Object? name = null,
    Object? extension = null,
    Object? path = null,
    Object? downloadUrl = null,
    Object? size = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$FileInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileInfoImpl implements _FileInfo {
  const _$FileInfoImpl(
      {required this.id,
      required this.name,
      required this.extension,
      required this.path,
      required this.downloadUrl,
      required this.size,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$FileInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String extension;
  @override
  final String path;
  @override
  final String downloadUrl;
  @override
  final int size;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'FileInfo(id: $id, name: $name, extension: $extension, path: $path, downloadUrl: $downloadUrl, size: $size, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, extension, path,
      downloadUrl, size, createdAt, updatedAt);

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
          {required final String id,
          required final String name,
          required final String extension,
          required final String path,
          required final String downloadUrl,
          required final int size,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$FileInfoImpl;

  factory _FileInfo.fromJson(Map<String, dynamic> json) =
      _$FileInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get extension;
  @override
  String get path;
  @override
  String get downloadUrl;
  @override
  int get size;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$FileInfoImplCopyWith<_$FileInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
