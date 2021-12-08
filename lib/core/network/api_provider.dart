import 'dart:convert' ;
import 'dart:io';
import 'package:flutter_core/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final http.Client client;
  ApiProvider(this.client);

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, dynamic> body, String accessToken) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // We will use response.body.toString() with no utf8 when response header has Content-Type: application/json;charset=utf-8
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;
      case 400:
        throw BadRequestException(
            json.decode(utf8.decode(response.bodyBytes).toString()));
      case 401:
        throw PermissionDeniedException(
            json.decode(utf8.decode(response.bodyBytes).toString()));
      case 403:
        throw UnauthorisedException(
            json.decode(utf8.decode(response.bodyBytes).toString()));
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
