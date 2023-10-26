import 'package:freezed_annotation/freezed_annotation.dart';
part 'scan_model.freezed.dart';
part 'scan_model.g.dart';

@Freezed()
class InventoryItemModel with _$InventoryItemModel {
  const factory InventoryItemModel(
      {        
        String? id,
        @JsonKey(name: "project_id") String? projectId,
        String? sku,
        String? url,
        String? title,
        String? category,
        String? image,
        @JsonKey(name: "twin_url") String? twinUrl,
        @JsonKey(name: "twin_status") String? twinStatus,
        @JsonKey(name: "twin_image") String? twinImage,
        @JsonKey(name: "created_at") String? createdAt,
        @JsonKey(name: "update_at") String? updatedAt,

      }) = _InventoryItemModel;

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemModelFromJson(json);
}