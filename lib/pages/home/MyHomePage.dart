import 'dart:io';

import 'package:flutter/material.dart';
import 'package:immigratetocanada/models/BottomNavigationModel.dart';
import 'package:immigratetocanada/models/ListDetails.dart';
import 'package:immigratetocanada/models/QuestionAndAnswer.dart';
import 'package:immigratetocanada/pages/ads/AdHelper.dart';
import 'BottomNavigationPage.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final Map<String, dynamic> data;

  MyHomePage({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.school_outlined), label: 'navigation_label_study'.tr),
    BottomNavigationBarItem(
        icon: Icon(Icons.house_outlined), label: 'navigation_label_living'.tr),
    BottomNavigationBarItem(
        icon: Icon(Icons.alt_route_outlined),
        label: 'navigation_label_immigration'.tr),
    BottomNavigationBarItem(
        icon: Icon(Icons.question_answer_outlined),
        label: 'navigation_qestion_answer'.tr),
  ];

  late int currentIndex;

  late final List<Widget> pages;
  late final BottomNavigationModel immigrationPage;
  late final BottomNavigationModel livingPage;
  late final BottomNavigationModel studyPage;
  late final BottomNavigationModel questionAndAnswerPage;

  List<ListDetails> mapDataToList(String path) {
    var mapList = List.from(widget.data[path]);
    return mapList
        .map((e) => ListDetails.fromRTDB(Map<String, dynamic>.from(e)))
        .toList();
  }

  List<QuestionAndAnswer> mapDataToListQandA(String path) {
    var mapList = List.from(widget.data[path]);
    return mapList
        .map((e) => QuestionAndAnswer.fromRTDB(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    currentIndex = 0;

    immigrationPage = BottomNavigationModel(
      'immigration',
      '移民',
      'images/4.png',
    );

    livingPage = BottomNavigationModel(
      'living',
      '生活',
      'images/2.jpg',
    );
    studyPage = BottomNavigationModel(
      'study',
      '学习',
      'images/1.jpg',
    );
    questionAndAnswerPage = BottomNavigationModel(
      'Q&A',
      '问答',
      'images/1.jpg',
    );

    pages = Get.deviceLocale?.languageCode == 'en'
        ? [
            BottomNavigationPage(
                bottomNavigationModel: studyPage,
                data: mapDataToList('study'),
                nativeAdId: AdHelper.nativeAdUnitIdForStudy),
            BottomNavigationPage(
                bottomNavigationModel: livingPage,
                data: mapDataToList('living'),
                nativeAdId: AdHelper.nativeAdUnitIdForLiving),
            BottomNavigationPage(
                bottomNavigationModel: immigrationPage,
                data: mapDataToList('immigration'),
                nativeAdId: AdHelper.nativeAdUnitIdForImmigration),
            BottomNavigationPage(
                bottomNavigationModel: questionAndAnswerPage,
                data: mapDataToListQandA('Q&A'),
                nativeAdId: AdHelper.nativeAdUnitIdForQandA),
          ]
        : [
            BottomNavigationPage(
                bottomNavigationModel: studyPage,
                data: mapDataToList('学习'),
                nativeAdId: AdHelper.nativeAdUnitIdForStudy),
            BottomNavigationPage(
                bottomNavigationModel: livingPage,
                data: mapDataToList('生活'),
                nativeAdId: AdHelper.nativeAdUnitIdForLiving),
            BottomNavigationPage(
                bottomNavigationModel: immigrationPage,
                data: mapDataToList('移民'),
                nativeAdId: AdHelper.nativeAdUnitIdForImmigration),
            BottomNavigationPage(
                bottomNavigationModel: questionAndAnswerPage,
                data: mapDataToListQandA('问答'),
                nativeAdId: AdHelper.nativeAdUnitIdForQandA),
          ];
  }

  // void shareDownLink() {
  //   if (Platform.isAndroid) {
  //     Share.share(
  //         'https://play.google.com/store/apps/details?id=awesome.yaolilong.immigratetocanadaPro');
  //   } else if (Platform.isIOS) {
  //     Share.share('https://apps.apple.com/ca/app/imm-to-ca/id1583523483');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.share_outlined))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
