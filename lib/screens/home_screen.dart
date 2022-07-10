import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_flutter/entities/entities.dart';

import 'package:test_api_flutter/widgets/widgets.dart';
import 'package:test_api_flutter/providers/providers.dart';
//import 'package:webview_flutter/webview_flutter.dart';

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
              onPressed: () => Navigator.pushNamed(context, 'settings'),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          CardWidget(
            title: 'Consulta',
            child: _RequestWidget(requestProvider: requestProvider),
            height: 150,
          ),
          Expanded(
            child: CarouselSlider(
              items: const [
                CardWidget(
                  title: 'Params',
                  child: _ParamsWidget(),
                ),
                CardWidget(
                  title: 'Headers',
                  child: _HeadersWidget(),
                ),
                CardWidget(
                  title: 'Body',
                  child: _BodyWidget(),
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

class _RequestWidget extends StatelessWidget {
  const _RequestWidget({
    Key? key,
    required this.requestProvider,
  }) : super(key: key);

  final RequestProvider requestProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            if (requestProvider.getUrl.isNotEmpty) {
              final response = await requestProvider.sendRequest();
              print(response.statusCode);
              print(response.body);
            } else {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertErrorWidget(
                      title: 'Error',
                      message: 'Por favor ingrese la url',
                    );
                  });
            }
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
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    Key? key,
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
      ],
    );
  }
}

class _HeadersWidget extends StatelessWidget {
  const _HeadersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<RequestProvider>(context);
    final List<ItemHeader> _headers = requestProvider.getHeaders;
    return Column(
      children: [
        const Divider(),
        SizedBox(
          child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        actions: [
                          const Text('Title'),
                          InputWidget(
                              title: 'title',
                              onChange: (String? v) {
                                if (v != null) {
                                  requestProvider.setTitleParam = v;
                                }
                              }),
                          InputWidget(
                              title: 'value',
                              onChange: (String? v) {
                                if (v != null) {
                                  requestProvider.setValueParam = v;
                                }
                              }),
                          Row(
                            children: [
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor),
                                onPressed: () {
                                  requestProvider.addHeaders(
                                      requestProvider.getTitleParam,
                                      requestProvider.getValueParam);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Add',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                              TextButton.icon(
                                  onPressed: () {
                                    requestProvider.initVarParams();
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  label: Text(
                                    'Cancel',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).errorColor)),
                            ],
                          )
                        ],
                      );
                    });
              },
              child: const Text('Agregar')),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: _headers.length,
              itemBuilder: (_, index) {
                 return ItemParamsWidget(
                  params: _headers[index],
                  onUpdate: (bool? value) {
                    requestProvider.updateParams(index, status: value);
                  },
                  onDelete: () {
                    requestProvider.deleteParams(index);
                    Navigator.pop(context);
                  },
                );
              }),
        ),
      ],
    );
  }
}

class _ParamsWidget extends StatelessWidget {
  const _ParamsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<RequestProvider>(context);
    final List<ItemParams> _params = requestProvider.getParams;
    return Column(
      children: [
        const Divider(),
        SizedBox(
          child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        actions: [
                          const Text('Title'),
                          InputWidget(
                              title: 'title',
                              onChange: (String? v) {
                                if (v != null) {
                                  requestProvider.setTitleParam = v;
                                }
                              }),
                          InputWidget(
                              title: 'value',
                              onChange: (String? v) {
                                if (v != null) {
                                  requestProvider.setValueParam = v;
                                }
                              }),
                          Row(
                            children: [
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor),
                                onPressed: () {
                                  requestProvider.addParams(
                                      requestProvider.getTitleParam,
                                      requestProvider.getValueParam);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Add',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                              TextButton.icon(
                                  onPressed: () {
                                    requestProvider.initVarParams();
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  label: Text(
                                    'Cancel',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).errorColor)),
                            ],
                          )
                        ],
                      );
                    });
              },
              child: const Text('Agregar')),
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _params.length,
              itemBuilder: (_, index) {
                return ItemParamsWidget(
                  params: _params[index],
                  onUpdate: (bool? value) {
                    requestProvider.updateParams(index, status: value);
                  },
                  onDelete: () {
                    requestProvider.deleteParams(index);
                    Navigator.pop(context);
                  },
                );
              }),
        ),
      ],
    );
  }
}
