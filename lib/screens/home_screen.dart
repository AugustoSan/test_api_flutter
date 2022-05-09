import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_api_flutter/widgets/widgets.dart';
import 'package:test_api_flutter/providers/providers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<RequestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test API'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CardWidget(
            title: 'Consulta',
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DropdownButton(
                      key: Key(requestProvider.getMethod),
                      underline: Container(),
                      value: requestProvider.getMethod,
                      items: <String>['GET', 'POST', 'PUT', 'DELETE']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          requestProvider.setMethod = newValue;
                        }

                        print(requestProvider.getMethod);
                      },
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'https://www.algo.com',
                        ),
                        onChanged: (String? value) {
                          if (value != null) {
                            requestProvider.setUrl = value;
                            print(requestProvider.getURL);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    //Aqui se envian los datos para validar
                    requestProvider.sendRequest();
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Ir',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            height: 150,
          ),
          CardWidget(
            height: 200,
            title: 'Parametros',
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Agregar')),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const ItemParamsUrlWidget();
                  },
                )),
              ],
            ),
          ),
          const CardWidget(
              height: 400,
              title: 'Response',
              child: WebView(
                initialUrl: 'https://flutter.dev',
              )),
        ],
      ),
    );
  }
}
