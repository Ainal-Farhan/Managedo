import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:managedo_mobile_app/models/semester.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_view.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';

class SemesterDetails extends StatelessWidget {
  final SemesterDetailsState _state;
  final SemesterDetailsViewmodel _viewmodel;

  SemesterDetails({@required state, @required viewmodel})
      : _state = state,
        _viewmodel = viewmodel;

  final _formKey = GlobalKey<FormState>();

  _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete This Semester Information?'),
          content: Text("Are You Sure Want To Proceed?"),
          actions: <Widget>[
            TextButton(
              child: Text("YES"),
              onPressed: () => _state.deleteSemester(),
            ),
            TextButton(
              child: Text("NO"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _asyncInputDialog({
    @required BuildContext context,
    String currentValue,
    String labelText,
    TextInputType inputType,
    List<TextInputFormatter> inputFormatters,
    String validator(value),
  }) async {
    String editedValue = '';
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter edited value'),
          content: Row(
            children: <Widget>[
              Expanded(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: TextFormField(
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: labelText,
                      hintText: 'current: $currentValue',
                    ),
                    validator: validator,
                    onChanged: (value) {
                      editedValue = value;
                    },
                    keyboardType:
                        inputType != null ? inputType : TextInputType.text,
                    inputFormatters:
                        inputFormatters != null ? inputFormatters : [],
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                _formKey.currentState.validate()
                    ? Navigator.of(context).pop(editedValue)
                    : debugPrint('Error');
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> _editDuration({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Duration (weeks)',
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      inputType: TextInputType.number,
      validator: (value) => value.isEmpty
          ? 'Please insert the edited duration value'
          : int.parse(value) == 0
              ? 'Zero input is not accepted'
              : int.parse(value) <= 20
                  ? null
                  : 'Maximum Duration of Semester is 20 weeks',
    ).then(
      (value) => value == null ? null : value,
    );
  }

  Future<String> _editTargetedGPA({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Targeted GPA (MAX: 4.00)',
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(4),
      ],
      inputType: TextInputType.number,
      validator: (value) => value.isEmpty
          ? 'Please insert the targeted GPA value'
          : double.parse(value) <= 4.00 && double.parse(value) > .0
              ? null
              : 'Please Insert a valid GPA value',
    ).then(
      (value) => value == null ? null : double.parse(value).toStringAsFixed(2),
    );
  }

  Future<String> _editAchievedGPA({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Achieved GPA (MAX: 4.00)',
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(4),
      ],
      inputType: TextInputType.number,
      validator: (value) => value.isEmpty
          ? 'Please insert the achieved GPA value'
          : double.parse(value) <= 4.0 && double.parse(value) > .0
              ? null
              : 'Please insert a valid GPA Value',
    ).then(
      (value) => value == null ? null : double.parse(value).toStringAsFixed(2),
    );
  }

  Future<String> _editSemesterStatus({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Semester Status (Complete/ Incomplete)',
      inputFormatters: <TextInputFormatter>[],
      inputType: TextInputType.text,
      validator: (value) => value.isEmpty ||
              (value.toLowerCase() != 'complete' &&
                  value.toLowerCase() != 'incomplete')
          ? 'Only Complete or Incomplete is accepted'
          : null,
    ).then((value) => value == null
        ? null
        : '${value[0].toUpperCase()}${value.substring(1).toLowerCase()}');
  }

  _updateSemesterInfo({String updatedInfo, int index}) {
    Semester semester = _viewmodel.sem;

    if (updatedInfo != null) {
      switch (index) {
        case 1:
          semester.durationInWeek = int.parse(updatedInfo);
          break;
        case 2:
          semester.targetedGPA = double.parse(updatedInfo);
          break;
        case 3:
          semester.achievedGPA = double.parse(updatedInfo);
          break;
        case 5:
          semester.semesterStatus = updatedInfo;
          break;
      }
      _state.updateSemester(semester: semester);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    int totalCredit = 0;

    if (_viewmodel.courses != null)
      _viewmodel.courses.forEach((course) {
        totalCredit += course.credit;
      });

    final List<String> details = [
      _viewmodel.sem.semesterNo.toString(),
      _viewmodel.sem.durationInWeek.toString(),
      _viewmodel.sem.targetedGPA.toStringAsFixed(2),
      _viewmodel.sem.achievedGPA.toStringAsFixed(2),
      _viewmodel.courses != null ? totalCredit.toString() : 'N/A',
      _viewmodel.sem.semesterStatus
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.separated(
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.black87,
                Colors.green,
                Colors.white54,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Container(
            height: 50,
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      _viewmodel.semesterLabels[index].toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              title: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  ': ' + details[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              trailing: index != 4
                  ? index == 0
                      ? IconButton(
                          onPressed: () => _showAlert(context),
                          icon: Icon(Icons.delete_forever_outlined),
                          color: Colors.black,
                        )
                      : IconButton(
                          icon: Icon(Icons.keyboard_arrow_right),
                          color: Colors.black,
                          onPressed: () async => await (index == 1
                                  ? _editDuration(
                                      context: context,
                                      currentValue: _viewmodel
                                          .sem.durationInWeek
                                          .toString(),
                                    )
                                  : index == 2
                                      ? _editTargetedGPA(
                                          context: context,
                                          currentValue: _viewmodel
                                              .sem.targetedGPA
                                              .toStringAsFixed(2),
                                        )
                                      : index == 3
                                          ? _editAchievedGPA(
                                              context: context,
                                              currentValue: _viewmodel
                                                  .sem.achievedGPA
                                                  .toStringAsFixed(2),
                                            )
                                          : index == 5
                                              ? _editSemesterStatus(
                                                  context: context,
                                                  currentValue: _viewmodel
                                                      .sem.semesterStatus,
                                                )
                                              : null)
                              .then(
                            (value) => _updateSemesterInfo(
                              index: index,
                              updatedInfo: value,
                            ),
                          ),
                        )
                  : Text(''),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          color: null,
          thickness: 0,
          endIndent: 0,
          height: 1,
          indent: 0,
        ),
        itemCount: 6,
      ),
    );
  }
}
