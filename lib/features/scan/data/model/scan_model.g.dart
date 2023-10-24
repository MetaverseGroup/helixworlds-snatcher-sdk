// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryItemModelImpl _$$InventoryItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryItemModelImpl(
      id: json['id'] as String?,
      projectId: json['project_id'] as String?,
      sku: json['sku'] as String?,
      url: json['url'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      twinUrl: json['twin_url'] as String?,
      twinStatus: json['twin_status'] as String?,
      twinImage: json['twin_image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['update_at'] as String?,
    );

Map<String, dynamic> _$$InventoryItemModelImplToJson(
        _$InventoryItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'sku': instance.sku,
      'url': instance.url,
      'title': instance.title,
      'category': instance.category,
      'image': instance.image,
      'twin_url': instance.twinUrl,
      'twin_status': instance.twinStatus,
      'twin_image': instance.twinImage,
      'created_at': instance.createdAt,
      'update_at': instance.updatedAt,
    };
