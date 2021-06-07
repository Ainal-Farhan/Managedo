import 'package:flutter/material.dart';

import 'package:managedo_mobile_app/app/router.dart' as router;

import './gradient_icon.dart';

class Body extends StatelessWidget {
  final _viewmodel;

  Body({@required viewmodel}) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _viewmodel.semesterList != null
              ?Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              children:  (_viewmodel.semesterList as List)
                  .map((sem) => InkWell(
                      onTap: () => Navigator.pushNamed(context, router.semesterDetailsRoute,arguments: sem.id,),
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
                                    'Sem #${sem.semesterNo}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text('Achieved GPA: ${sem.targetedGPA.toStringAsFixed(2)}'),
                              Text('Targeted GPA: ${sem.achievedGPA.toStringAsFixed(2)}'),
                              Text('Status: ${sem.semesterStatus}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ): Container(),
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
