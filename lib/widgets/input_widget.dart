import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final Function(String?)? onChange;
  final Function(String)? onSubmmited;
  const InputWidget({
    Key? key,
    required this.title,
    this.onChange,
    this.onSubmmited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: title,
        label: Text(title),
      ),
      onChanged: onChange,
      onSubmitted: onSubmmited,
    );
  }
}
