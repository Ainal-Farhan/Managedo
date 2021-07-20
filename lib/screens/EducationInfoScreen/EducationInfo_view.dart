import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/LoadingScreen/LoadingScreen.dart';
import 'package:managedo_mobile_app/app/router.dart' as router;
import './components/body.dart';

import '../view.dart';
import 'EducationInfo_viewmodel.dart';

class EducationInfo extends StatefulWidget {
  final int studentId;

  EducationInfo({@required this.studentId});

  static Route<dynamic> route({@required studentId}) => MaterialPageRoute(
        builder: (_) => EducationInfo(
          studentId: studentId,
        ),
      );

  @override
  EducationInfoState createState() => EducationInfoState();
}

class EducationInfoState extends State<EducationInfo> {
  int currentPage = 2;

  Future<void> deleteSelectedEducation({@required int educationId}) {
    final load = LoadingScreen(
      processes: [
        (LoadingScreenState loadState) async {
          final isDeleted =
              await EducationInfoViewmodel.deleteSelectedEducation(
                  educationId: educationId);

          loadState.message = 'Delete ' + (isDeleted ? 'Success' : 'Failed');
          loadState.rebuildScreen();

          await Future.delayed(Duration(milliseconds: 500));
        },
        (LoadingScreenState loadState) async {
          loadState.message = 'Navigating to Education Info List Screen';
          loadState.rebuildScreen();
          await Future.delayed(Duration(milliseconds: 500));
        }
      ],
      nextScreenArguments: widget.studentId,
      nextScreenRoute: router.educationRoute,
      title: 'Delete Selected Education Information',
      initialMessage: 'Deleting ...',
    );

    return Navigator.pushNamed(
      context,
      router.loadingScreenRoute,
      arguments: load,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu_book_rounded),
            title: Text('Education Information'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Logout"),
                          content: Text("You want to Logout?"),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () =>
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      router.loginScreenRoute,
                                      (route) => false),
                            ),
                            TextButton(
                              child: Text("CANCEL"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.login_rounded))
            ],
          ),
          body: View<EducationInfoViewmodel>(
            initViewmodel: (viewmodel) =>
                viewmodel.init(studentId: widget.studentId),
            builder: (context, viewmodel, _) {
              return Body(state: this, viewmodel: viewmodel);
            },
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => {},
            ),
          ),
          bottomNavigationBar: FancyBottomNavigation(
            circleColor: Colors.green,
            initialSelection: currentPage,
            tabs: [
              TabData(
                iconData: Icons.person,
                title: 'Profile',
              ),
              TabData(
                iconData: Icons.home,
                title: 'Home',
              ),
              TabData(
                iconData: Icons.menu_book_rounded,
                title: 'Education',
              ),
            ],
            onTabChangedListener: (int position) {
              switch (position) {
                case 0:
                  return Navigator.of(context).pushReplacementNamed('');
                case 1:
                  return Navigator.of(context).pushReplacementNamed('');
              }
            },
          ),
        ),
      ),
    );
  }
}
