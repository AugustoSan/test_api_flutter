import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final double? height;
  const CardWidget(
      {Key? key, required this.title, required this.child, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: height,
      //width: double.infinity - 20,
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: 20,
        child: ClipRRect(
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            subtitle: child,
          ),
        ),
      ),
    );
  }
}
