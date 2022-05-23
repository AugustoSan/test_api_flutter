import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:test_api_flutter/entities/request_entity.dart';

class RequestProvider extends ChangeNotifier {
  RequestEntity requestEntity = RequestEntity();
  bool onLoad = false;
  String _titleParam = '';
  String _valueParam = '';
  /*
  String _method = 'GET';
  String _url = '';
  Map<String, String> _paramsUrl = <String, String>{};
  Map<String, String> _headers = <String, String>{};

*/

  set setTitleParam(String title) {
    _titleParam = title;
  }

  String get getTitleParam {
    return _titleParam;
  }

  set setValueParam(String value) {
    _valueParam = value;
  }

  String get getValueParam {
    return _valueParam;
  }

  void initVarParams() {
    _titleParam = _valueParam = '';
  }

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

  List<ItemParams> get getParams {
    return requestEntity.listParams;
  }

  List<ItemHeader> get getHeaders {
    return requestEntity.listHeaders;
  }

  void addParams(String title, String value) {
    ItemParams item = ItemParams(status: true, title: title, value: value);
    requestEntity.listParams.add(item);
    notifyListeners();
  }

  void deleteParams(String title) {
    for (var item in requestEntity.listParams) {
      if (item.title == title) {
        requestEntity.listParams.remove(item);
      }
    }
  }

  void deleteAllParams() {
    requestEntity.listParams.clear();
  }

  void addHeaders(String title, String value) {
    ItemHeader item = ItemHeader(status: true, title: title, value: value);
    requestEntity.listHeaders.add(item);
  }

  void deleteHeaders(String title) {
    for (var item in requestEntity.listHeaders) {
      if (item.title == title) {
        requestEntity.listHeaders.remove(item);
      }
    }
  }

  void deleteAllHeaders() {
    requestEntity.listHeaders.clear();
  }

  void updateParams(int index, {bool? status, String? title, String? value}) {
    if (status != null) {
      requestEntity.listParams[index].status = status;
    }
    if (title != null) {
      requestEntity.listParams[index].title = title;
    }
    if (value != null) {
      requestEntity.listParams[index].value = value;
    }
    notifyListeners();
  }

  void updateHeaders(int index, bool? status, String? title, String? value) {
    if (status != null) {
      requestEntity.listHeaders[index].status = status;
    }
    if (title != null) {
      requestEntity.listHeaders[index].title = title;
    }
    if (value != null) {
      requestEntity.listHeaders[index].value = value;
    }
    notifyListeners();
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
