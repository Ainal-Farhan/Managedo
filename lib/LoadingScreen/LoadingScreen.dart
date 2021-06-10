import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:managedo_mobile_app/LoadingScreen/LoadingScreenArguments.dart';
import 'package:managedo_mobile_app/LoadingScreen/MessageState.dart';

/// Loading Screen Widget that updates the screen once all inistializer methods
/// are called
class LoadingScreen extends LoadingScreenArguments {
  /// Constructor for the LoadingScreen widget with all the required
  /// initializers
  LoadingScreen({
    @required processes,
    @required nextScreenRoute,
    @required nextScreenArguments,
    loaderColor,
    image,
    title,
    backgroundColor,
    styleTextUnderTheLoader = const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    initialMessage,
  }) : super(
          processes: processes,
          nextScreenRoute: nextScreenRoute,
          nextScreenArguments: nextScreenArguments,
          loaderColor: loaderColor,
          image: image,
          title: title,
          backgroundColor: backgroundColor,
          styleTextUnderTheLoader: styleTextUnderTheLoader,
          initialMessage: initialMessage,
        );

  /// Bind the Widget to the custom State object
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends MessageState<LoadingScreen> {
  /// public rebuild Screen method
  void rebuildScreen() {
    setState(() {});
  }

  /// Initialise the state
  @override
  void initState() {
    super.initState();

    /// If the LoadingScreen widget has an initial message set, then the default
    /// message in the MessageState class needs to be updated
    if (widget.initialMessage != null) {
      initialMessage = widget.initialMessage;
    }

    /// We require the initializers to run after the loading screen is rendered
    SchedulerBinding.instance.addPostFrameCallback((_) {
      runInitTasks();
    });
  }

  /// This method calls the initializers and once they complete redirects to
  /// the widget provided in navigateAfterInit
  @protected
  Future runInitTasks() async {
    /// Run each initializer method sequentially
    Future.forEach(widget.processes, (process) => process(this))
        .whenComplete(() {
      // When all the initializers has been called and terminated their
      // execution. The screen is navigated to the next scaffolding widget
      if (widget.nextScreenRoute is String) {
        // It's fairly safe to assume this is using the in-built material
        // named route component
        Navigator.of(context).pushReplacementNamed(
          widget.nextScreenRoute,
          arguments: widget.nextScreenArguments,
        );
      } else {
        throw new ArgumentError(
            'widget.nextScreenRoute must either be a route for the next screen in String datatype');
      }
    });
  }

  /// Render the LoadingScreen widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            /// Paint the area where the inner widgets are loaded with the
            /// background to keep consistency with the screen background
            Container(
              decoration: BoxDecoration(color: widget.backgroundColor),
            ),

            /// Render the background image
            /// If the image is not set (null), it will
            /// return empty Container
            widget.image != null
                ? Container(
                    child: widget.image,
                  )
                : Container(),

            /// Render the Title widget, loader and messages below each other
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 0,
                  child: new Container(
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                      ),
                      RichText(text: TextSpan(text: widget.title)),
                    ],
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /// Loader Animation Widget
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            widget.loaderColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      Text(message, style: widget.styleTextUnderTheLoader),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
