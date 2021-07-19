import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/router.dart';

import 'components/bar.dart';
//import '../view.dart';
//import './LoginScreen_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
            appBar: Bar(),
            body: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Managedo',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      //textColor: Colors.blue,
                      child: Text('Forgot Password'),
                    ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          //textColor: Colors.white,
                          //color: Colors.blue,
                          child: Text('Login'),
                          onPressed: () async => await Navigator.pushNamed(
                              context, allScreenRoute),
                        )),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        TextButton(
                          //textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
                  ],
                ))),
      ),
    );
  }
}
