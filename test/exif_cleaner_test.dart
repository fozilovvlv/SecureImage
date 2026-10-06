import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:secure_image/features/exif/domain/exif_metadata.dart';
import 'package:secure_image/features/exif/data/exif_cleaner_service.dart';

void main() {
  group('ExifCleanerService Tests', () {
    test('Verify empty metadata returns isCleaned=true', () {
      final dummyBytes = Uint8List(0);
      final meta = ExifCleanerService.verifyBytes(dummyBytes);
      expect(meta.isCleaned, true);
    });

    test('ExifMetadata correctly identifies GPS presence', () {
      final metaWithGps = ExifMetadata(
        hasExif: true,
        latitude: 41.311086,
        longitude: 69.240562,
        rawTags: {},
      );
      expect(metaWithGps.hasGps, true);

      final metaWithoutGps = ExifMetadata(
        hasExif: false,
        rawTags: {},
      );
      expect(metaWithoutGps.hasGps, false);
    });
  });
}
