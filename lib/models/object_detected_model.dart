/// {@template ObjectDetectedModel}
/// The model class for the onject detected on the app
/// {@endTemplate}
class ObjectDetectedModel {
  /// {@macro ObjectDetectedModel}
  const ObjectDetectedModel({
    required this.id,
    required this.image,
    required this.name,
    required this.marketUrl,
    required this.game,
  });

  /// The id of the object
  final String id;

  /// The image url or path of the object
  final String image;

  /// The name of the object
  final String name;

  /// The url of the marketplace
  final String marketUrl;

  /// The game the object was detected
  final String game;
}
