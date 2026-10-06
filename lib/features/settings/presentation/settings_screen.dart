import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Язык приложения'),
            subtitle: Text('Русский / O\'zbekcha / English'),
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Тема оформления'),
            subtitle: Text('Системная / Светлая / Тёмная'),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('О конфиденциальности'),
            subtitle: Text('100% Offline обработка без передачи на сервер'),
          ),
        ],
      ),
    );
  }
}
