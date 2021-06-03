import 'package:flutter/material.dart';

class Float extends StatelessWidget {
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
            onPressed: () => Navigator.pop(context),
            isExtended: true,
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
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
          ),
        ),
      ],
    );
  }
}
