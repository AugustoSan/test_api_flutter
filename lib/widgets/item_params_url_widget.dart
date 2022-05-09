import 'package:flutter/material.dart';

class ItemParamsUrlWidget extends StatelessWidget {
  const ItemParamsUrlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (bool? value) {}),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Titulo'),
              ),
            ),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: 'Valor'),
            ),
          ),
        ],
      ),
    );
  }
}
