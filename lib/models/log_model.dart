import 'dart:convert';

class LogModel {
  LogModel({
    required this.id,
    required this.name,
    required this.date,
    required this.game,
    required this.image,
  });

  final String id, name, date, game, image;

  factory LogModel.fromJson(Map<String, dynamic> jsonData) {
    return LogModel(
      id: jsonData['id'],
      name: jsonData['name'],
      date: jsonData['date'],
      game: jsonData['game'],
      image: jsonData['image'],
    );
  }

  static Map<String, dynamic> toMap(LogModel model) => {
        'id': model.id,
        'name': model.name,
        'date': model.date,
        'game': model.game,
        'image': model.image,
      };

  static String encode(List<LogModel> models) => json.encode(
        models
            .map<Map<String, dynamic>>((model) => LogModel.toMap(model))
            .toList(),
      );

  static List<LogModel> decode(String model) =>
      (json.decode(model) as List<dynamic>)
          .map<LogModel>((item) => LogModel.fromJson(item))
          .toList();
}
