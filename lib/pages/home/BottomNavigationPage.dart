import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:immigratetocanada/models/BottomNavigationModel.dart';
import 'package:immigratetocanada/pages/ads/AdHelper.dart';
import 'package:immigratetocanada/models/ListDetails.dart';
import 'package:immigratetocanada/pages/list/ListDetailsPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'GoogleNativeAd.dart';
import 'TopSwiper.dart';

class BottomNavigationPage extends StatefulWidget {
  final BottomNavigationModel bottomNavigationModel;
  final List<dynamic> data;

  BottomNavigationPage({
    required this.bottomNavigationModel,
    required this.data,
  });
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  static final _kAdIndex = 2;

  List<String> images = Get.deviceLocale?.languageCode == 'en'
      ? [
          "images/immigration-timeline-en.png",
          "images/ad-contact-info.jpg",
          "images/winnipeg.jpg",
        ]
      : [
          "images/immigration-timeline.png",
          "images/ad-contact-info.jpg",
          "images/winnipeg.jpg",
        ];

  bool _nativeAdIsLoaded = false;

  late NativeAd _nativeAd;

  void initState() {
    super.initState();

    _nativeAd = NativeAd(
      adUnitId: AdHelper.nativeAdUnitIdForNav,
      request: AdRequest(),
      factoryId: 'listTile',
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          print('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$NativeAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$NativeAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$NativeAd onAdClosed.'),
      ),
    );

    _nativeAd.load();
    // Load ads.
  }

  @override
  void dispose() {
    _nativeAd.dispose();
    super.dispose();
  }

  int _getDestinationItemIndex(int rawIndex) {
    if (rawIndex >= _kAdIndex && _nativeAdIsLoaded) {
      return rawIndex - 1;
    }
    return rawIndex;
  }

  @override
  Widget build(BuildContext context) {
    // get languagecode and get
    String path = Get.deviceLocale?.languageCode == 'en'
        ? widget.bottomNavigationModel.name
        : widget.bottomNavigationModel.nameInCH;

    if (path == 'Q&A' || path == '问答') {
      return CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return TopSwiper(images: images);
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (_nativeAdIsLoaded && index == _kAdIndex) {
                  return GoogleNativeAd(nativeAd: _nativeAd);
                } else {
                  final item = widget.data[_getDestinationItemIndex(index)];
                  return Card(
                    elevation: 30,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          focusColor: Colors.amber,
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.orange,
                            child: FaIcon(
                              FontAwesomeIcons.questionCircle,
                              size: 22,
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            item.question,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            item.answer,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              childCount: widget.data.length + (_nativeAdIsLoaded ? 1 : 0),
            ),
          ),
        ],
      );
    } else {
      return CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return TopSwiper(images: images);
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (_nativeAdIsLoaded && index == _kAdIndex) {
                  return GoogleNativeAd(nativeAd: _nativeAd);
                } else {
                  final item = widget.data[_getDestinationItemIndex(index)];
                  return Card(
                    elevation: 30,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => Get.to(
                        () => ListDetailsPage(
                          ListDetails(
                            item.name,
                            item.nameInOtherLanguage,
                            item.applicationURL,
                            item.introduction,
                            item.processTime,
                            item.imgURL,
                            item.guideURL,
                            item.documentLists,
                            item.eligibility,
                            item.cost,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            focusColor: Colors.amber,
                            leading: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.orange,
                              child: FaIcon(
                                FontAwesomeIcons.dragon,
                                size: 22,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              item.name,
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              "processTime".tr + item.processTime,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Text(
                              item.introduction,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
              childCount: widget.data.length + (_nativeAdIsLoaded ? 1 : 0),
            ),
          ),
        ],
      );
    }
  }
}
