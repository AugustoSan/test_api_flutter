import 'package:flutter/material.dart';

class RequestProvider extends ChangeNotifier {
  String _method = 'GET';
  String _url = '';
  bool onLoad = false;
  Map<String, String> _paramsUrl = <String, String>{};

  set setMethod(String methodRequest) {
    _method = methodRequest;
    notifyListeners();
  }

  String get getMethod {
    return _method;
  }

  set setUrl(String url) {
    _url = url;
    notifyListeners();
  }

  String get getURL {
    return _url;
  }

  void addMapParamsUrl(String title, String value) {
    final nuevo = <String, String>{title: value};
    _paramsUrl.addAll(nuevo);
    notifyListeners();
  }

  Map<String, String> get getParamsUrl {
    return _paramsUrl;
  }

  Future<void> sendRequest() async {
    onLoad = true;
    print('sendRequest');
    notifyListeners();
    onLoad = false;
    notifyListeners();
  }
}
