// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyLogModelImpl _$$MyLogModelImplFromJson(Map<String, dynamic> json) =>
    _$MyLogModelImpl(
      id: json['id'] as String?,
      productId: json['productId'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      date: json['date'] as String?,
      game: json['game'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$MyLogModelImplToJson(_$MyLogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'description': instance.description,
      'name': instance.name,
      'date': instance.date,
      'game': instance.game,
      'image': instance.image,
      'url': instance.url,
    };
