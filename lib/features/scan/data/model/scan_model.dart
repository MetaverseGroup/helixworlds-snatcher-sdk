// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'scan_model.freezed.dart';
part 'scan_model.g.dart';

@Freezed()
class InventoryItemModel with _$InventoryItemModel {
  const factory InventoryItemModel(
      {        
        @JsonKey(name: "inventoryId") String? id,
        @JsonKey(name: "redirectUrl") String? url,
        @JsonKey(name: "name") String? title,
        @JsonKey(name: 'images') List<ImageInfo>? images,
        String? description,
      }) = _InventoryItemModel;

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemModelFromJson(json);
}

@freezed
abstract class ImageInfo with _$ImageInfo {
  const factory ImageInfo({
    @JsonKey(name: 'file') required FileInfo file,
  }) = _ImageInfo;

  factory ImageInfo.fromJson(Map<String, dynamic> json) => _$ImageInfoFromJson(json);
}

@freezed
abstract class FileInfo with _$FileInfo {
  const factory FileInfo({
    required String id,
    required String name,
    required String extension,
    required String path,
    required String downloadUrl,
    required int size,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _FileInfo;

  factory FileInfo.fromJson(Map<String, dynamic> json) => _$FileInfoFromJson(json);
}