import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_view.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';

class SemesterDetails extends StatelessWidget {
  final SemesterDetailsState _state;
  final SemesterDetailsViewmodel _viewmodel;

  SemesterDetails({@required state, @required viewmodel})
      : _state = state,
        _viewmodel = viewmodel;

  final _formKey = GlobalKey<FormState>();

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
      (value) => value == null
          ? null
          : '$value week' + (int.parse(value) > 1 ? 's' : ''),
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

  @override
  Widget build(BuildContext context) {
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
                  ': ' + _viewmodel.semesterDetails[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              trailing: index != 0 && index != 4
                  ? IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      color: Colors.black,
                      onPressed: () async => await (index == 1
                              ? _editDuration(
                                  context: context,
                                  currentValue:
                                      _viewmodel.semesterDetails[index],
                                )
                              : index == 2
                                  ? _editTargetedGPA(
                                      context: context,
                                      currentValue:
                                          _viewmodel.semesterDetails[index],
                                    )
                                  : index == 3
                                      ? _editAchievedGPA(
                                          context: context,
                                          currentValue:
                                              _viewmodel.semesterDetails[index],
                                        )
                                      : index == 5
                                          ? _editSemesterStatus(
                                              context: context,
                                              currentValue: _viewmodel
                                                  .semesterDetails[index],
                                            )
                                          : null)
                          .then(
                        (value) {
                          if (value != null) {
                            _viewmodel.semesterDetails[index] =
                                value.toString();
                            _state.rebuildState();
                          }
                          return null;
                        },
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
        itemCount: _viewmodel.semesterDetails.length,
      ),
    );
  }
}
