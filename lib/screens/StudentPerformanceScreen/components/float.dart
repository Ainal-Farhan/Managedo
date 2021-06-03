import 'package:flutter/material.dart';

class Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          child: Icon(Icons.arrow_back_outlined),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 10.0,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
