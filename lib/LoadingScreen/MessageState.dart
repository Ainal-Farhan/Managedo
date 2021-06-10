import 'package:flutter/widgets.dart';

abstract class MessageState<T extends StatefulWidget> extends State<T> {
  @protected
  String _message = 'Loading . . .';

  /// The member variable is set as protected this it is not exposed to the
  /// widget state class. As a workaround a protected setter is set so it is
  /// not used outside the package
  @protected
  set initialMessage(String message) => _message = message;

  // setter for message variable
  set message(String message) => this._message = message;

  // getter for message variable
  String get message => _message;
}