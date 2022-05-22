import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:test_api_flutter/entities/request_entity.dart';

class RequestProvider extends ChangeNotifier {
  RequestEntity requestEntity = RequestEntity();
  bool onLoad = false;
  /*
  String _method = 'GET';
  String _url = '';
  Map<String, String> _paramsUrl = <String, String>{};
  Map<String, String> _headers = <String, String>{};

*/

  set setUrl(String url) {
    requestEntity.url = url;
  }

  String get getUrl {
    return requestEntity.url;
  }

  set setMethod(String m) {
    requestEntity.method = m;
    notifyListeners();
  }

  String get getMethod {
    return requestEntity.method;
  }

  Map<String, String> get getParams {
    return requestEntity.params;
  }

  Map<String, String> get getHeaders {
    return requestEntity.headers;
  }

  void addParams(String title, String value) {
    requestEntity.params.addAll(<String, String>{title: value});
  }

  void deleteParams(String title) {
    requestEntity.params.remove(title);
  }

  void deleteAllParams() {
    requestEntity.params.clear();
  }

  void addHeaders(String title, String value) {
    requestEntity.headers.addAll(<String, String>{title: value});
  }

  void deleteHeaders(String title) {
    requestEntity.headers.remove(title);
  }

  void deleteAllHeaders() {
    requestEntity.headers.clear();
  }

  Future<void> sendRequest() async {
    if (validUrl()) {
      switch (requestEntity.method) {
        case 'GET':
          print('get');
          break;
        case 'POST':
          print('post');
          break;
        case 'PUT':
          print('put');
          break;
        case 'DELETE':
          print('delete');
          break;
        default:
          print('default');
      }
    } else {
      print('Url is not valid');
    }
  }

  bool validUrl() {
    if (requestEntity.url.isNotEmpty) {
      if (requestEntity.url.startsWith('http')) {
        return true;
      }
    }
    return false;
  }

  Future<void> sendRequestGET() async {
    onLoad = true;
    print('sendRequest');

    Map<String, String> listHeaders = {};

    notifyListeners();
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      //return Post.fromJson(json.decode(response.body));
      //final body = response.body;
      Map<String, dynamic> body = jsonDecode(response.body);
      final headers = response.headers;
      body.forEach((item, value) {
        //print(item);
        if (headers.containsKey('content-type')) {
          print('si existe content-type');
        }
        print(item + ': ' + value.toString());
      });
      headers.forEach((key, value) {
        print(key + ': ' + value);
      });
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
    onLoad = false;
    notifyListeners();
  }

  Future<void> sendRequestPOST() async {
    onLoad = true;
    print('sendRequest');

    Map<String, String> listHeaders = {};

    notifyListeners();
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      //return Post.fromJson(json.decode(response.body));
      //final body = response.body;
      Map<String, dynamic> body = jsonDecode(response.body);
      final headers = response.headers;
      body.forEach((item, value) {
        //print(item);
        if (headers.containsKey('content-type')) {
          print('si existe content-type');
        }
        print(item + ': ' + value.toString());
      });
      headers.forEach((key, value) {
        print(key + ': ' + value);
      });
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
    onLoad = false;
    notifyListeners();
  }

  Future<void> sendRequestPUT() async {
    onLoad = true;
    print('sendRequest');

    Map<String, String> listHeaders = {};

    notifyListeners();
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      //return Post.fromJson(json.decode(response.body));
      //final body = response.body;
      Map<String, dynamic> body = jsonDecode(response.body);
      final headers = response.headers;
      body.forEach((item, value) {
        //print(item);
        if (headers.containsKey('content-type')) {
          print('si existe content-type');
        }
        print(item + ': ' + value.toString());
      });
      headers.forEach((key, value) {
        print(key + ': ' + value);
      });
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
    onLoad = false;
    notifyListeners();
  }

  Future<void> sendRequestDELETE() async {
    onLoad = true;
    print('sendRequest');

    Map<String, String> listHeaders = {};

    notifyListeners();
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      //return Post.fromJson(json.decode(response.body));
      //final body = response.body;
      Map<String, dynamic> body = jsonDecode(response.body);
      final headers = response.headers;
      body.forEach((item, value) {
        //print(item);
        if (headers.containsKey('content-type')) {
          print('si existe content-type');
        }
        print(item + ': ' + value.toString());
      });
      headers.forEach((key, value) {
        print(key + ': ' + value);
      });
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
    onLoad = false;
    notifyListeners();
  }
}
