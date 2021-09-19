import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitIdForStudy {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6809346835989107/9452774720';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6809346835989107/6396488707';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitIdForLiving {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6809346835989107/2243334704';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6809346835989107/6209472203';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitIdForImmigration {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6809346835989107/4422296552';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6809346835989107/6190673795';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitIdForQandA {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6809346835989107/8800525260';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6809346835989107/3659879226';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitIdForDetail {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6809346835989107/8777647993';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6809346835989107/4750645793';
    }
    throw new UnsupportedError("Unsupported platform");
  }
}
