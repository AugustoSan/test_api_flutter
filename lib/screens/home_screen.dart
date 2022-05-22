import 'package:carousel_slider/carousel_slider.dart';
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
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
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
          Expanded(
            child: CarouselSlider(
              items: [
                CardWidget(
                  title: 'Params',
                  child: _ParamsWidget(
                    params: requestProvider.getParams,
                  ),
                ),
                CardWidget(
                  title: 'Headers',
                  child: _HeadersWidget(
                    headers: requestProvider.getHeaders,
                  ),
                ),
              ],
              options: CarouselOptions(height: double.infinity),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeadersWidget extends StatelessWidget {
  final Map<String, String> headers;
  const _HeadersWidget({
    Key? key,
    required this.headers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        SizedBox(
          child: TextButton(onPressed: () {}, child: const Text('Agregar')),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: headers.length,
              itemBuilder: (_, index) {
                return Text('data');
              }),
        ),
      ],
    );
  }
}

class _ParamsWidget extends StatelessWidget {
  final Map<String, String> params;
  const _ParamsWidget({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        SizedBox(
          child: TextButton(onPressed: () {}, child: const Text('Agregar')),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: params.length,
              itemBuilder: (_, index) {
                return Text('data');
              }),
        ),
      ],
    );
  }
}
