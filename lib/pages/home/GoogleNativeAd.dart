import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleNativeAd extends StatelessWidget {
  const GoogleNativeAd({
    Key? key,
    required NativeAd nativeAd,
  })  : _nativeAd = nativeAd,
        super(key: key);

  final NativeAd _nativeAd;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Card(
        child: Container(
          child: AdWidget(ad: _nativeAd),
          width: MediaQuery.of(context).size.width,
          height: 310,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
