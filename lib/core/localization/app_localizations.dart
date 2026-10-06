import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('ru'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'ru': {
      'app_title': 'SecureImage',
      'app_subtitle': 'Защитите персональные данные в изображениях',
      'pick_gallery': 'Выбрать из галереи',
      'take_photo': 'Сделать фото',
      'history': 'История',
      'settings': 'Настройки',
      'exif_status': 'EXIF статус',
      'clean_exif': 'Очистить EXIF',
      'add_watermark': 'Нанести водяной знак',
      'protect': 'Защитить изображение',
      'save_image': 'Сохранить защищённое фото',
      'privacy_notice': 'Все изображения обрабатываются локально на вашем устройстве без интернета.',
    },
    'uz': {
      'app_title': 'SecureImage',
      'app_subtitle': 'Rasmlardagi shaxsiy ma\'lumotlarni himoya qiling',
      'pick_gallery': 'Galereyadan tanlash',
      'take_photo': 'Rasmga olish',
      'history': 'Tarix',
      'settings': 'Sozlamalar',
      'exif_status': 'EXIF holati',
      'clean_exif': 'EXIF ni tozalash',
      'add_watermark': 'Suv belgisi qo\'yish',
      'protect': 'Rasmni himoyalash',
      'save_image': 'Himoyalangan rasmni saqlash',
      'privacy_notice': 'Barcha rasmlar qurilmangizda lokal ravishda internetsiz qayta ishlanadi.',
    },
    'en': {
      'app_title': 'SecureImage',
      'app_subtitle': 'Protect personal data in images before sharing',
      'pick_gallery': 'Choose from gallery',
      'take_photo': 'Take a photo',
      'history': 'History',
      'settings': 'Settings',
      'exif_status': 'EXIF Status',
      'clean_exif': 'Clean EXIF',
      'add_watermark': 'Add Watermark',
      'protect': 'Protect Image',
      'save_image': 'Save Protected Image',
      'privacy_notice': 'All images are processed locally on your device without internet.',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['ru']?[key] ??
        key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ru', 'uz', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async => AppLocalizations(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
