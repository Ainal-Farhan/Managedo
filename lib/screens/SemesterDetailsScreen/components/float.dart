import 'package:flutter/material.dart';

class Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Icon(Icons.add),
      ),
    );
  }
}
