import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/router.dart' as router;
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_view.dart';

class Float extends StatelessWidget {
  final SemesterListView _state;

  const Float({@required state}): _state = state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
          child: FloatingActionButton(
            child: Icon(Icons.arrow_back_outlined),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 10.0,
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
              router.educationRoute, 
              (route) => false, 
              arguments:  _state.studentId,
              ),
            heroTag: null,
          ),
        ),
        FloatingActionButton(
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => {},
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 10.0,
          onPressed: () => {},
          heroTag: null,
        ),
      ],
    );
  }
}
