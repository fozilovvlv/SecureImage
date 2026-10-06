class ExifMetadata {
  final bool hasExif;
  final double? latitude;
  final double? longitude;
  final String? deviceModel;
  final String? deviceMake;
  final String? dateTimeOriginal;
  final String? software;
  final Map<String, String> rawTags;
  final bool isCleaned;

  ExifMetadata({
    required this.hasExif,
    this.latitude,
    this.longitude,
    this.deviceModel,
    this.deviceMake,
    this.dateTimeOriginal,
    this.software,
    required this.rawTags,
    this.isCleaned = false,
  });

  bool get hasGps => latitude != null && longitude != null;
}
