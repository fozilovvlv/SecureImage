import 'package:flutter/material.dart';

class ProtectionScreen extends StatelessWidget {
  const ProtectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Защита изображения')),
      body: const Center(
        child: Text('Модуль динамического водяного знака и очистки EXIF'),
      ),
    );
  }
}
