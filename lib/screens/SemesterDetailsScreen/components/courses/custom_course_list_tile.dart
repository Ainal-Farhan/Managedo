import 'package:flutter/material.dart';

class CustomCourseListTile extends StatelessWidget {
  final String label;
  final String details;
  final Function onPressed;

  CustomCourseListTile({
    @required this.label,
    @required this.details,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: null,
      ),
      child: ListTile(
        isThreeLine: false,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 75,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          details,
          style: TextStyle(
            fontSize: 11,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        trailing: SizedBox(
          width: 20,
          child: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            color: Colors.black,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
