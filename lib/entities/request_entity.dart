class RequestEntity {
  List<ItemHeader> listHeaders = [];
  List<ItemParams> listParams = [];
  String url = '';
  String method = 'GET';
  Uri getUri() {
    Uri uri = Uri();
    String temp = '';
    List<String> list = [];
    if (url.contains('https')) {
      print('es https');
      temp = url.replaceAll('https://', '');
      list = temp.split('/');
      temp = '';
      for (int i = 1; i < list.length; i++) {
        temp = temp + '/' + list[i];
      }
      return Uri.https(list[0], temp);
    } else if (url.contains('http')) {
      print('es http');
      temp = url.replaceAll('http://', '');
      list = temp.split('/');
      temp = '';
      for (int i = 1; i < list.length; i++) {
        temp = temp + '/' + list[i];
      }
      return Uri.https(list[0], temp);
    } else {
      return uri;
    }
  }
}

class ParamsRequest {
  String title = '';
  String value = '';
  bool status = true;
  ParamsRequest({
    required this.status,
    required this.title,
    required this.value,
  });
  set setTitle(String val) {
    title = val;
  }

  String get getTitle {
    return title;
  }

  set setValue(String val) {
    value = val;
  }

  String get getValue {
    return value;
  }

  set setStatus(bool val) {
    status = val;
  }

  bool get getStatus {
    return status;
  }
}

class ItemHeader extends ParamsRequest {
  ItemHeader(
      {required bool status, required String title, required String value})
      : super(status: status, title: title, value: value);
}

class ItemParams extends ParamsRequest {
  ItemParams(
      {required bool status, required String title, required String value})
      : super(status: status, title: title, value: value);

  String getStringAll() {
    if (status) {
      return title + '=' + value;
    }
    return '';
  }
}
