import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  // final ListStudentsView _state;
  // Body({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListView(
        children: ['std-obj', 'std-obj2', 'std-obj3']
            .map(
              (stdObj) => Card(
                color: Colors.green[200],
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                elevation: 10,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(3, 4))
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://randomuser.me/api/portraits/thumb/men/75.jpg',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      '$stdObj.name',
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      '$stdObj.email',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () => {},
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
