import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_flutter/providers/providers.dart';
import 'package:test_api_flutter/screens/screens.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<SettingsProvider>(
        create: (_) => SettingsProvider(),
      ),
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RequestProvider>(
          create: (_) => RequestProvider(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: settingsProvider.getTheme(),
          debugShowCheckedModeBanner: false,
          title: 'Test API Flutter',
          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/result': (context) => const ResultScreen(),
            'settings': (context) => const SettingsScreen(),
          },
          //onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
