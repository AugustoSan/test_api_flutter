import 'package:flutter/material.dart';

class AlertInfoWidget extends StatelessWidget {
  final String title;
  final String message;
  const AlertInfoWidget({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [Text(message)],
    );
  }
}

class AlertErrorWidget extends StatelessWidget {
  final String title;
  final String message;
  const AlertErrorWidget({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '¡¡¡' + title + '!!!',
        style: TextStyle(color: Theme.of(context).errorColor),
      ),
      actions: [Text(message)],
    );
  }
}

class AlertWarningWidget extends StatelessWidget {
  final String title;
  final String message;
  const AlertWarningWidget(
      {Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).hoverColor),
      ),
      actions: [Text(message)],
    );
  }
}
