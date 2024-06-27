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
          ?.map((e) => ImageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      isCoupon: json['isCoupon'] as bool?,
      creator: json['creator'] as String?,
      numberOfScans: json['numberOfScans'] as int?,
      code: json['code'] as String?,
      quantityRemaining: json['quantityRemaining'] as int?,
      maximumRedemptions: json['maximumRedemptions'] as int?,
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

_$ImageInfoImpl _$$ImageInfoImplFromJson(Map<String, dynamic> json) =>
    _$ImageInfoImpl(
      file: FileInfo.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ImageInfoImplToJson(_$ImageInfoImpl instance) =>
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
