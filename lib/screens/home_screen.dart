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
                    if (requestProvider.getUrl.isNotEmpty) {
                      requestProvider.sendRequest();
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialog(
                              title: Text('Error'),
                              actions: [Text('Por favor ingrese la url')],
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
            ),
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
          child: TextButton(onPressed: () {}, child: const Text('Agregar')),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: _headers.length,
              itemBuilder: (_, index) {
                return const Text('data');
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
                return SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Switch(
                          value: _params[index].status,
                          onChanged: (value) {
                            requestProvider.updateParams(index, status: value);
                          }),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    actions: [
                                      const Text('Title'),
                                      InputWidget(
                                          title: _params[index].title,
                                          onChange: (String? v) {
                                            if (v != null) {
                                              requestProvider.updateParams(
                                                  index,
                                                  title: v);
                                            }
                                          }),
                                      InputWidget(
                                          title: _params[index].value,
                                          onChange: (String? v) {
                                            if (v != null) {
                                              requestProvider.updateParams(
                                                  index,
                                                  value: v);
                                            }
                                          }),
                                      Row(
                                        children: [
                                          TextButton.icon(
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor),
                                            onPressed: () {
                                              requestProvider.addParams(
                                                  requestProvider.getTitleParam,
                                                  requestProvider
                                                      .getValueParam);
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.update,
                                              color: Colors.white,
                                            ),
                                            label: Text(
                                              'Update',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ),
                                          TextButton.icon(
                                              onPressed: () {
                                                requestProvider.initVarParams();
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.cancel,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                              label: Text(
                                                'Cancel',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                              ),
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .errorColor)),
                                        ],
                                      )
                                    ],
                                  );
                                });
                          },
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: Text(_params[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3)),
                              Text(
                                _params[index].value,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
