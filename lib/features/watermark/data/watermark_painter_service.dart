import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../domain/watermark_model.dart';

class WatermarkPainterService {
  static String generateId() {
    final now = DateTime.now();
    final dateStr = '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
    final randHex = Random().nextInt(0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
    return 'SI-$dateStr-$randHex';
  }

  static List<String> buildLines(WatermarkConfig config) {
    final lines = <String>[];
    switch (config.template) {
      case WatermarkTemplate.xBank:
        lines.add('ТОЛЬКО ДЛЯ X-BANK');
        break;
      case WatermarkTemplate.registration:
        lines.add('ТОЛЬКО ДЛЯ РЕГИСТРАЦИИ');
        break;
      case WatermarkTemplate.educational:
        lines.add('ТОЛЬКО ДЛЯ УЧЕБНЫХ ЦЕЛЕЙ');
        break;
      case WatermarkTemplate.organization:
        lines.add(config.organizationName.isNotEmpty ? 'ТОЛЬКО ДЛЯ ${config.organizationName.toUpperCase()}' : 'ТОЛЬКО ДЛЯ ОРГАНИЗАЦИИ');
        break;
      case WatermarkTemplate.custom:
        lines.add(config.customText.isNotEmpty ? config.customText.toUpperCase() : 'ЗАЩИЩЕНО SECUREIMAGE');
        break;
    }

    final now = DateTime.now();
    final parts = <String>[];
    if (config.includeDate) {
      parts.add('${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}');
    }
    if (config.includeTime) {
      parts.add('${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}');
    }
    if (parts.isNotEmpty) lines.add(parts.join(' '));
    if (config.includeId) lines.add('ID: ${config.uniqueId}');

    return lines;
  }
}
