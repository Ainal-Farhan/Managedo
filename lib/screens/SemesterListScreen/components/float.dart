import 'package:flutter/material.dart';

class Float extends StatelessWidget {
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
            onPressed: () => Navigator.pop(context),
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
        ),
      ],
    );
  }
}
