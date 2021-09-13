import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:immigratetocanada/models/Message.dart';
import 'package:immigratetocanada/pages/home/MyHomePage.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:immigratetocanada/pages/home/NoDataPage.dart';

import 'dataserver/dataServer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInAnonymously();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  //final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DataServer dataServer;
  late Future<Map<String, dynamic>> _data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataServer = DataServer();
    _data = dataServer.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(), // 你的翻译
      locale: Get.deviceLocale, // 将会按照此处指定的语言翻译
      fallbackLocale: Locale('en', ''), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
      debugShowCheckedModeBanner: false,
      title: 'app_name'.tr,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FutureBuilder(
          future: _data,
          builder: (
            BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot,
          ) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return MyHomePage(title: 'home_page_title'.tr);
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          }),
    );
  }
}
