import 'package:flutter/material.dart';

import './gradient_icon.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              children: [
                'sem1',
                'sem2',
                'sem3',
                'sem4',
                'sem5',
                'sem6',
                'sem7',
                'sem8',
              ]
                  .map(
                    (sem) => InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent[200],
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Card(
                          color: null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GradientIcon(
                                    icon: Icons.menu_book_rounded,
                                    size: 50,
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Colors.black45,
                                        Colors.green[300],
                                        Colors.white30,
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ),
                                  ),
                                  Text(
                                    '#$sem',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text('Real GPA: 3.78'),
                              Text('Targeted GPA: 3.78'),
                              Text('Status: Incomplete'),
                              Text('Total Credit: 15'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Container(
          height: 80,
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bookmarks_sharp,
                color: Colors.white,
              ),
              Text(
                ' List of Semester',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
