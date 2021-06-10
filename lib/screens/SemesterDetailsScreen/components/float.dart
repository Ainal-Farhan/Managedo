import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/router.dart' as router;
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_view.dart';
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_view.dart';

class Float extends StatelessWidget {
  final SemesterDetailsState _state;

  Float({@required state}): _state = state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              colors: [
                Colors.white,
                Colors.green,
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            onPressed: () => Navigator.of(context).pushReplacementNamed(
              router.listSemestersRoute,
              arguments: SemesterListViewArguments(
                educationId: _state.widget.educationId,
                studentId: _state.widget.studentId,
              ),
            ),
            isExtended: true,
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
            heroTag: null,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              colors: [
                Colors.white,
                Colors.green,
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            onPressed: () {},
            isExtended: true,
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            heroTag: null,
          ),
        ),
      ],
    );
  }
}
