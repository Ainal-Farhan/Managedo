import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditCourse {
  static final _formKey = GlobalKey<FormState>();

  static Future<dynamic> _asyncInputDialog({
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
              new Expanded(
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

  static Future<String> editCourseCode({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Course Code',
      inputFormatters: <TextInputFormatter>[],
      inputType: TextInputType.text,
      validator: (value) {
        Pattern pattern = r'^[a-zA-Z0-9]+$';
        RegExp re = RegExp(pattern);
        return value.isEmpty
            ? 'Please insert the edited course code value'
            : re.hasMatch(value)
                ? null
                : 'Only alphanumeric characters is accepted';
      },
    ).then(
      (value) => value == null ? null : '${value.toUpperCase()}',
    );
  }

  static Future<String> editCourseName({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Course Name',
      inputFormatters: <TextInputFormatter>[],
      inputType: TextInputType.text,
      validator: (value) =>
          value.isEmpty ? 'Please insert the edited course name value' : null,
    ).then(
      (value) => value == null ? null : value,
    );
  }

  static Future<String> editSection({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Section',
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      inputType: TextInputType.number,
      validator: (value) => value.isEmpty
          ? 'Please insert the edited section code value'
          : int.parse(value) == 0
              ? 'Zero is not accepted'
              : null,
    ).then(
      (value) => value == null ? null : (value.length > 1 ? '' : '0') + value,
    );
  }

  static Future<String> editCredit({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Credit',
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      inputType: TextInputType.number,
      validator: (value) => value.isEmpty
          ? 'Please insert the edited credit value'
          : int.parse(value) == 0
              ? 'Zero is not accepted'
              : null,
    ).then(
      (value) => value == null ? null : value,
    );
  }

  static Future<String> editTargetedGrade({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Targeted Grade',
      inputFormatters: <TextInputFormatter>[],
      inputType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) return 'Please insert the edited course code value';
        switch (value.toUpperCase()) {
          case 'A+':
          case 'A':
          case 'A-':
          case 'B+':
          case 'B':
          case 'B-':
          case 'C+':
          case 'C':
          case 'C-':
          case 'E':
            return null;
          default:
            return 'Invalid grade';
        }
      },
    ).then(
      (value) => value == null ? null : '${value.toUpperCase()}',
    );
  }

  static Future<String> editAchievedGrade({
    @required BuildContext context,
    @required String currentValue,
  }) async {
    return await _asyncInputDialog(
      context: context,
      currentValue: currentValue,
      labelText: 'Achieved Grade',
      inputFormatters: <TextInputFormatter>[],
      inputType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) return 'Please insert the edited course code value';
        switch (value.toUpperCase()) {
          case 'A+':
          case 'A':
          case 'A-':
          case 'B+':
          case 'B':
          case 'B-':
          case 'C+':
          case 'C':
          case 'C-':
          case 'E':
            return null;
          default:
            return 'Invalid grade';
        }
      },
    ).then(
      (value) => value == null ? null : '${value.toUpperCase()}',
    );
  }
}
