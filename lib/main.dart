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
      theme: ThemeData.dark().copyWith(
        errorColor: Colors.red[900],
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
            button: TextStyle(color: Colors.white),
            caption: TextStyle(color: Colors.white),
            headline3: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
