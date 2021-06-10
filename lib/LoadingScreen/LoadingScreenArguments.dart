import 'package:flutter/material.dart';

abstract class LoadingScreenArguments extends StatefulWidget {
  /// List of methods that are called once the Loading Screen is rendered
  /// for the first time. These are the methods that can update the messages
  /// that are shown under the loading symbol, delete, update,
  /// and insert data from or to databse,
  final List<dynamic> processes;

  /// The name of the application that is shown at the top of the loading screen
  final String title;

  /// The background colour which is used as a filler when the image doesn't
  /// occupy the full screen
  final Color backgroundColor;

  /// The styling that is used with the text (messages) that are displayed under
  /// the loader symbol
  final TextStyle styleTextUnderTheLoader;

  /// The Next Screen that is loaded once all the initializer methods
  /// have been executed
  final String nextScreenRoute;

  /// The class that is contain the arguments required
  /// by the next screen
  final dynamic nextScreenArguments;

  /// The colour that is used for the loader symbol
  final Color loaderColor;

  /// The image widget that is used as a background cover to the loading screen
  final Image image;

  /// The message that is displayed on the first load of the widget
  final String initialMessage;

  /// Constructor for the LoadingScreen widget with all the required
  /// initializers
  LoadingScreenArguments({
    @required this.processes,
    @required this.nextScreenRoute,
    @required this.nextScreenArguments,
    this.loaderColor,
    this.image,
    this.title,
    this.backgroundColor,
    this.styleTextUnderTheLoader,
    this.initialMessage,
  });
}