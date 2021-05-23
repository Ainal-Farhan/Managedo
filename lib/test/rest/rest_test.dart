import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../../app/dependencies.dart';
import '../../services/rest_service.dart';

class RestTest {
  final rest = dependency<RestService>();

  // Testing the rest api (get request)
  void testGetRequest() async {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');

    // set the variables value
    // "request": "validity"
    //
    // request -> the endpoint
    // validity -> valid/ invalid request
    Map<String, String> requestList = {
      "loginCredentials": "valid",
      "users": "valid",
      "request": "students",
      "students": "valid",
      "parents": "valid",
      "studentRelations": "valid",
      "educations": "valid",
      "semesters": "valid",
      "courses": "valid",
      "students/1": "valid",
      "students/peace-yall": "invalid",
    };

    // Get the base url from the rest_service.dart
    String baseUrl = RestService().url;

    requestList.forEach((request, expected) async {
      await rest.get(request).then((data) {
        debugPrint(
            '-----------TEST REST REQUEST (GET $baseUrl/$request) START-------------------------');
        debugPrint('summary: ' +
            encoder.convert(json.decode(
                '{"request":"$request","expected result":"$expected","real result":"valid"}')));

        debugPrint('\n$request: ' + encoder.convert(data));
        debugPrint(
            '-------------TEST REST REQUEST (GET $baseUrl/$request) END-------------------------');
      }).catchError((onError) {
        if (onError is Response) {
          debugPrint(
              '-----------TEST REST REQUEST (GET $baseUrl/$request) START-------------------------');
          debugPrint('summary: ' +
              encoder.convert(json.decode(
                  '{"request":"$request","expected result":"$expected","real result":"invalid"}')));
          debugPrint('message: Failed to get the data');
          debugPrint('body: ' + onError.body);
          debugPrint('bodyBytes: ' + onError.bodyBytes.toString());
          debugPrint('contentLength: ' + onError.contentLength.toString());
          debugPrint('headers: ' + encoder.convert(onError.headers));
          debugPrint('isRedirect: ' + onError.isRedirect.toString());
          debugPrint('persistentConnection: ' +
              onError.persistentConnection.toString());
          debugPrint('reasonPhrase: ' + onError.reasonPhrase.toString());
          debugPrint('statusCode: ' + onError.statusCode.toString());
          debugPrint(
              '-------------TEST REST REQUEST (GET $baseUrl/$request) END-------------------------');
        }
      });
    });
  }
}
