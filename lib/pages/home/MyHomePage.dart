import 'package:flutter/material.dart';
import 'package:immigratetocanada/dataserver/dataServer.dart';
import 'package:immigratetocanada/models/BottomNavigationModel.dart';
import 'package:immigratetocanada/models/ListDetails.dart';
import 'package:immigratetocanada/models/QuestionAndAnswer.dart';
import 'BottomNavigationPage.dart';
import 'package:get/get.dart';
import 'NoDataPage.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

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
  late DataServer dataServer;
  late dynamic data;

  late final List<Widget> pages;
  late final BottomNavigationModel immigrationPage;
  late final BottomNavigationModel livingPage;
  late final BottomNavigationModel studyPage;
  late final BottomNavigationModel questionAndAnswerPage;

  List<Widget> getPages() {
    if (data is String) {
      return [
        NoDataPage(),
      ];
    } else {
      return Get.deviceLocale?.languageCode == 'en'
          ? [
              BottomNavigationPage(
                  bottomNavigationModel: studyPage,
                  data: mapDataToList('study')),
              BottomNavigationPage(
                  bottomNavigationModel: livingPage,
                  data: mapDataToList('living')),
              BottomNavigationPage(
                  bottomNavigationModel: immigrationPage,
                  data: mapDataToList('immigration')),
              BottomNavigationPage(
                  bottomNavigationModel: questionAndAnswerPage,
                  data: mapDataToListQandA('Q&A')),
            ]
          : [
              BottomNavigationPage(
                  bottomNavigationModel: studyPage, data: mapDataToList('学习')),
              BottomNavigationPage(
                  bottomNavigationModel: livingPage, data: mapDataToList('生活')),
              BottomNavigationPage(
                  bottomNavigationModel: immigrationPage,
                  data: mapDataToList('移民')),
              BottomNavigationPage(
                  bottomNavigationModel: questionAndAnswerPage,
                  data: mapDataToListQandA('问答')),
            ];
    }
  }

  List<ListDetails> mapDataToList(String path) {
    var mapList = List.from(data[path]);
    return mapList
        .map((e) => ListDetails.fromRTDB(Map<String, dynamic>.from(e)))
        .toList();
  }

  List<QuestionAndAnswer> mapDataToListQandA(String path) {
    var mapList = List.from(data[path]);
    return mapList
        .map((e) => QuestionAndAnswer.fromRTDB(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    dataServer = DataServer();
    data = dataServer.getJsonData();

    print(data['study']);
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

    pages = getPages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
