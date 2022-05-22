import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_flutter/providers/request_provider.dart';
import 'package:test_api_flutter/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Test API Flutter',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<RequestProvider>(
              create: (_) => RequestProvider()),
        ],
        child: const HomeScreen(),
      ),
      routes: {
        '/home': (_) => const HomeScreen(),
        '/result': (_) => const ResultScreen(),
        '/settings': (_) => const SettingsScreen(),
      },
    );
  }
}
