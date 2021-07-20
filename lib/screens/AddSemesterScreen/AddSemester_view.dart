import 'package:flutter/material.dart';

import '../view.dart';
import './AddSemester_viewmodel.dart';

class AddSemester extends StatelessWidget {
 static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AddSemester());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Semester',
      theme: ThemeData(
      primarySwatch: Colors.green
      ),
      home: AddSemesterForm(),
    );
    
  }
}

class AddSemesterForm extends StatelessWidget {
final formKey = GlobalKey<FormState>(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Semester'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: 'Semester'),
            validator: (value){
              if (value.trim().isEmpty) {
                return 'Semester Required';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Duration'),
              validator: (value){
              if (value.trim().isEmpty) {
                return 'Duration Required';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Target GPA'),
              validator: (value){
              if (value.trim().isEmpty) {
                return 'GPA Required';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Achieved GPA'),
              validator: (value){
              if (value.trim().isEmpty) {
                return 'GPA Required';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Total Credit'),
              validator: (value){
              if (value.trim().isEmpty) {
                return 'Total Credit Required';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Status (Completed/Ongong)'),
              validator: (value){
              if (value.trim().isEmpty) {
                return 'Status Required';
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState.validate()){
                print('The form is invalid');
              }
            },
              child: Text('Submit'),
              ),

        ],
      ),),
      ),
    );
    

}
}