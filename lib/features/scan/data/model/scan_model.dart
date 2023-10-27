// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'scan_model.freezed.dart';
part 'scan_model.g.dart';

@Freezed()
class InventoryItemModel with _$InventoryItemModel {
  const factory InventoryItemModel(
      {        
        String? id,
        
        // ignore: invalid_annotation_target
        @JsonKey(name: "project_id") String? projectId,
        String? sku,
        String? url,
        String? title,
        String? category,
        String? image,
        // ignore: invalid_annotation_target
        @JsonKey(name: "twin_url") String? twinUrl,
        // ignore: invalid_annotation_target
        @JsonKey(name: "twin_status") String? twinStatus,
        // ignore: invalid_annotation_target
        @JsonKey(name: "twin_image") String? twinImage,
        // ignore: invalid_annotation_target
        @JsonKey(name: "created_at") String? createdAt,
        // ignore: invalid_annotation_target
        @JsonKey(name: "update_at") String? updatedAt,

      }) = _InventoryItemModel;

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemModelFromJson(json);
}