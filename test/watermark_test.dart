import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secure_image/features/watermark/domain/watermark_model.dart';
import 'package:secure_image/features/watermark/data/watermark_painter_service.dart';

void main() {
  group('WatermarkService Tests', () {
    test('Unique ID follows SI-YYYYMMDD-XXXXXX pattern', () {
      final id = WatermarkPainterService.generateId();
      expect(id.startsWith('SI-'), true);
      expect(id.length, 18);
    });

    test('Watermark lines include template and unique id', () {
      final config = WatermarkConfig(
        template: WatermarkTemplate.xBank,
        uniqueId: 'SI-20261006-A1B2C3',
        includeId: true,
        includeDate: true,
      );
      final lines = WatermarkPainterService.buildLines(config);
      expect(lines.isNotEmpty, true);
      expect(lines.first, 'ТОЛЬКО ДЛЯ X-BANK');
      expect(lines.last, 'ID: SI-20261006-A1B2C3');
    });
  });
}
