class RequestEntity {
  List<ItemHeader> listHeaders = [];
  List<ItemParams> listParams = [];
  String url = '';
  String method = 'GET';
}

class ItemHeader {
  String title = '';
  String value = '';
  bool status = true;
  ItemHeader({
    required this.status,
    required this.title,
    required this.value,
  });
}

class ItemParams {
  String title = '';
  String value = '';
  bool status = true;
  ItemParams({
    required this.status,
    required this.title,
    required this.value,
  });
}
