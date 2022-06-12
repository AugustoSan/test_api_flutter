import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_flutter/providers/providers.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const AboutListTile(
            child: Text('Ventana para cambiar las configuraciones del sistema'),
          ),
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: settingsProvider.getDarkMode,
            onChanged: (value) {
              settingsProvider.setDarkMode = value;
            },
          ),
        ],
      ),
    );
  }
}
