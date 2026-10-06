import 'package:flutter/material.dart';

enum WatermarkTemplate {
  xBank,
  registration,
  educational,
  organization,
  custom,
}

enum WatermarkPosition {
  center,
  diagonalRepeat,
  fullGrid,
  corner,
}

class WatermarkConfig {
  final WatermarkTemplate template;
  final String organizationName;
  final String customText;
  final double fontSize;
  final double opacity;
  final double rotationAngle;
  final Color color;
  final WatermarkPosition position;
  final bool includeDate;
  final bool includeTime;
  final bool includeId;
  final String uniqueId;

  WatermarkConfig({
    required this.template,
    this.organizationName = '',
    this.customText = '',
    this.fontSize = 24.0,
    this.opacity = 0.45,
    this.rotationAngle = -30.0,
    this.color = Colors.white,
    this.position = WatermarkPosition.diagonalRepeat,
    this.includeDate = true,
    this.includeTime = true,
    this.includeId = true,
    required this.uniqueId,
  });
}
