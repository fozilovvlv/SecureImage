import 'dart:typed_data';
import 'package:image/image.dart' as img;
import '../domain/exif_metadata.dart';

class ExifCleanerService {
  /// Strips all EXIF, IPTC, and XMP segments by decoding and re-encoding raw image pixels.
  static Future<Uint8List> stripExif(Uint8List sourceBytes) async {
    final image = img.decodeImage(sourceBytes);
    if (image == null) {
      throw Exception('Не удалось декодировать изображение');
    }
    
    // Clear internal EXIF structure in the Image object
    image.exif.clear();
    
    // Encode pure clean JPEG without metadata tags
    final cleanBytes = img.encodeJpg(image, quality: 95);
    return Uint8List.fromList(cleanBytes);
  }

  /// Verifies whether any EXIF segment remains in the byte array
  static ExifMetadata verifyBytes(Uint8List bytes) {
    final image = img.decodeImage(bytes);
    if (image == null || image.exif.isEmpty) {
      return ExifMetadata(
        hasExif: false,
        rawTags: {},
        isCleaned: true,
      );
    }
    return ExifMetadata(
      hasExif: true,
      rawTags: {'remaining': 'Внимание: обнаружены остаточные теги'},
      isCleaned: false,
    );
  }
}
