import 'package:flutter/material.dart';

import '../view.dart';
import 'EducationInfo_viewmodel.dart';

class EducationInfoView extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => EducationInfoView());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('Education Information'),
            centerTitle: true,
          ),
          body: View<EducationInfoViewmodel>(
            initViewmodel: (viewmodel) =>
                viewmodel.getEducationListBasedOnStudentId(1),
            builder: (context, viewmodel, _) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final education = viewmodel.educations[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title:
                          Text(education.degreeLevel + ' - ' + education.field),
                      // subtitle: Text(education.universityName),
                      subtitle: Row(
                        children: [
                          CircleAvatar(
                            child:
                                Text(education.targetedCGPA.toStringAsFixed(2)),
                          ),
                          CircleAvatar(
                            child: Text(
                                education.calculatedCGPA.toStringAsFixed(2)),
                          ),
                        ],
                      ),
                      // trailing: Column(
                      //   children: [
                      //     CircleAvatar(
                      //       child:
                      //           Text(education.targetedCGPA.toStringAsFixed(2)),
                      //     ),
                      //     CircleAvatar(
                      //       child: Text(
                      //           education.calculatedCGPA.toStringAsFixed(2)),
                      //     ),
                      //   ],
                      // ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.blueGrey,
                      ),
                  itemCount: viewmodel.educations.length);
            },
          ),
        ),
      ),
    );
  }
}
