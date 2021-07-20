import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  // Change the baseUrl based on your laptop's IP address
  static const String baseHost = 'https://managedo-backend.herokuapp.com/api';
  // static const int basePort = 8080;
  // static const String baseUrl = 'http://$baseHost:$basePort';
  static const String baseUrl = '$baseHost';
  String get url => baseUrl;

  // get request
  Future get(String endpoint) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/$endpoint',
      ),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // post request
  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post(
        Uri.parse(
          '$baseUrl/$endpoint',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // patch request
  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch(
        Uri.parse(
          '$baseUrl/$endpoint',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // put request
  Future put(String endpoint, {dynamic data}) async {
    final response = await http.put(
        Uri.parse(
          '$baseUrl/$endpoint',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // delete request
  Future delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse(
        '$baseUrl/$endpoint',
      ),
    );

    if (response.statusCode == 200) {
      return;
    }
    throw response;
  }
}
