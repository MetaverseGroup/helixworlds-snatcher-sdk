/// {@template Failure}
/// A class that handles exceptions that returns user friendly error
/// messages
/// {@endTemplate}
class Failure implements Exception {
  /// {@macro Failure}
  Failure({this.message});

  String? message = 'Item not detected';
}
