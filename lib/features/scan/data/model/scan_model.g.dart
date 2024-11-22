// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryItemModelImpl _$$InventoryItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryItemModelImpl(
      id: json['inventoryId'] as String?,
      url: json['redirectUrl'] as String?,
      title: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => HelixImageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      isCoupon: json['isCoupon'] as bool?,
      creator: json['creator'] as String?,
      numberOfScans: (json['numberOfScans'] as num?)?.toInt(),
      code: json['code'] as String?,
      quantityRemaining: (json['quantityRemaining'] as num?)?.toInt(),
      maximumRedemptions: (json['maximumRedemptions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InventoryItemModelImplToJson(
        _$InventoryItemModelImpl instance) =>
    <String, dynamic>{
      'inventoryId': instance.id,
      'redirectUrl': instance.url,
      'name': instance.title,
      'images': instance.images,
      'description': instance.description,
      'isCoupon': instance.isCoupon,
      'creator': instance.creator,
      'numberOfScans': instance.numberOfScans,
      'code': instance.code,
      'quantityRemaining': instance.quantityRemaining,
      'maximumRedemptions': instance.maximumRedemptions,
    };

_$InventoryItemV4ModelImpl _$$InventoryItemV4ModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryItemV4ModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      storeUrl: json['storeUrl'] as String?,
      productUrl: json['productUrl'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) =>
              InventoryItemV4ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InventoryItemV4ModelImplToJson(
        _$InventoryItemV4ModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'storeUrl': instance.storeUrl,
      'productUrl': instance.productUrl,
      'images': instance.images,
    };

_$InventoryItemV4ImageModelImpl _$$InventoryItemV4ImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryItemV4ImageModelImpl(
      file: json['file'] == null
          ? null
          : FileInfo.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InventoryItemV4ImageModelImplToJson(
        _$InventoryItemV4ImageModelImpl instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

_$ScanVirtualItemModelImpl _$$ScanVirtualItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanVirtualItemModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ScanVirtualItemModelImplToJson(
        _$ScanVirtualItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };

_$ScanResponseModelImpl _$$ScanResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanResponseModelImpl(
      virtualItem: json['virtualItem'] == null
          ? null
          : ScanVirtualItemModel.fromJson(
              json['virtualItem'] as Map<String, dynamic>),
      inventory: json['inventory'] == null
          ? null
          : InventoryItemV4Model.fromJson(
              json['inventory'] as Map<String, dynamic>),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$ScanResponseModelImplToJson(
        _$ScanResponseModelImpl instance) =>
    <String, dynamic>{
      'virtualItem': instance.virtualItem,
      'inventory': instance.inventory,
      'code': instance.code,
    };

_$HelixImageInfoImpl _$$HelixImageInfoImplFromJson(Map<String, dynamic> json) =>
    _$HelixImageInfoImpl(
      file: FileInfo.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HelixImageInfoImplToJson(
        _$HelixImageInfoImpl instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

_$FileInfoImpl _$$FileInfoImplFromJson(Map<String, dynamic> json) =>
    _$FileInfoImpl(
      downloadUrl: json['download_url'] as String?,
    );

Map<String, dynamic> _$$FileInfoImplToJson(_$FileInfoImpl instance) =>
    <String, dynamic>{
      'download_url': instance.downloadUrl,
    };
