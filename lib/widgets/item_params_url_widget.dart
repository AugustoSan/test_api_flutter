import 'package:flutter/material.dart';
import 'package:test_api_flutter/entities/entities.dart';

class ItemParamsWidget extends StatelessWidget {
  final ItemParams params;
  final Function onUpdate;
  final Function onDelete;
  const ItemParamsWidget({
    Key? key,
    required this.params,
    required this.onUpdate,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Checkbox(
              value: params.status,
              onChanged: (bool? value) {
                onUpdate(value);
              }),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      params.title,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(params.value),
                  ),
                ),
                IconButton(
                  onPressed: () => updateData(context),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => deleteItem(context),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateData(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Actualizar los datos'),
            actions: [
              TextField(
                decoration: InputDecoration(
                  hintText: params.title,
                  label: const Text('Titulo'),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: params.value,
                  label: const Text('Valor'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.check),
                        label: const Text('Si, quiero actualizar.')),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).errorColor),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cancel,
                        ),
                        label: const Text(
                          'No, quiero cancelar.',
                        )),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void deleteItem(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Realmente desea eliminar la variable'),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel),
                        label: const Text('No, prefiero cancelar.')),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).errorColor),
                        onPressed: () {
                          onDelete;
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                        label: const Text(
                          'Si, quiero eliminar.',
                        )),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
