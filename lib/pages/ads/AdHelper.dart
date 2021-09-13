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

  static String get nativeAdUnitIdForNav {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6809346835989107/9452774720';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6809346835989107/6396488707';
    }
    throw new UnsupportedError("Unsupported platform");
    // if (Platform.isAndroid) {
    //   return 'ca-app-pub-6809346835989107/4440053984';
    // } else if (Platform.isIOS) {
    //   return 'ca-app-pub-6809346835989107/6396488707';
    // }
    // throw new UnsupportedError("Unsupported platform");
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
