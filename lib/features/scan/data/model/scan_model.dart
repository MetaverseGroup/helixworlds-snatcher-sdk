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
        bool? isCoupon,
        String? creator,
        int? numberOfScans,
        String? code,
        int? quantityRemaining,
        int? maximumRedemptions,
      }) = _InventoryItemModel;

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemModelFromJson(json);
}

@Freezed()
class InventoryItemV4Model with _$InventoryItemV4Model {
  const factory InventoryItemV4Model(
      {        
        String? id,
        String? title,
        String? description,
        String? storeUrl,
        String? productUrl,
        List<InventoryItemV4ImageModel>? images

      }) = _InventoryItemV4Model;

  factory InventoryItemV4Model.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemV4ModelFromJson(json);
}

@Freezed()
class InventoryItemV4ImageModel with _$InventoryItemV4ImageModel {
  const factory InventoryItemV4ImageModel(
      {        
        FileInfo? file,

      }) = _InventoryItemV4ImageModel;

  factory InventoryItemV4ImageModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemV4ImageModelFromJson(json);
}

@Freezed()
class ScanVirtualItemModel with _$ScanVirtualItemModel {
  const factory ScanVirtualItemModel(
      {        
        String? id,
        String? title,
        String? description,
      }) = _ScanVirtualItemModel;

  factory ScanVirtualItemModel.fromJson(Map<String, dynamic> json) =>
      _$ScanVirtualItemModelFromJson(json);
}


@Freezed()
class ScanResponseModel with _$ScanResponseModel {
  const factory ScanResponseModel(
      {        
        ScanVirtualItemModel? virtualItem,
        InventoryItemV4Model? inventory,
        String? code,

      }) = _ScanResponseModel;

  factory ScanResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ScanResponseModelFromJson(json);
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
    @JsonKey(name: "download_url") String? downloadUrl,
  }) = _FileInfo;

  factory FileInfo.fromJson(Map<String, dynamic> json) => _$FileInfoFromJson(json);
}