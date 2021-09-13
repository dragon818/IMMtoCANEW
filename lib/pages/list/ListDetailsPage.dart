import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:immigratetocanada/dataserver/dataServer.dart';
import 'package:immigratetocanada/models/ListDetails.dart';
import 'package:immigratetocanada/pages/ads/AdHelper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class ListDetailsPage extends StatefulWidget {
  final ListDetails listDetails;
  const ListDetailsPage(this.listDetails, {Key? key}) : super(key: key);

  @override
  _ListDetailsPageState createState() => _ListDetailsPageState();
}

class _ListDetailsPageState extends State<ListDetailsPage> {
  bool _nativeAdIsLoaded = false;
  _adOrContainer() {
    if (_nativeAdIsLoaded == true) {
      return StatefulBuilder(
        builder: (context, setState) => Column(
          children: [
            SizedBox(height: 10),
            Container(
              child: AdWidget(ad: _nativeAdNew),
              width: MediaQuery.of(context).size.width,
              height: 310,
              alignment: Alignment.center,
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    }
    return SizedBox(height: 10);
  }

  late NativeAd _nativeAdNew;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _nativeAdNew = NativeAd(
      adUnitId: AdHelper.nativeAdUnitIdForDetail,
      request: AdRequest(),
      factoryId: 'listTile',
      listener: NativeAdListener(
        onAdLoaded: (_) {
          print('$NativeAd loaded....');
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
    _nativeAdNew.load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nativeAdNew.dispose();
    super.dispose();
  }

  void _lanchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw "Could not launch";
  List<Padding> listOfPadding() {
    final listOfDocs = widget.listDetails.documentLists;

    final listOfPadding = listOfDocs
        .map((e) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                e,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ))
        .toList();

    return listOfPadding;
  }

  List<Padding> listOfRequimentPadings() {
    final listOfRequiments = widget.listDetails.eligibility;

    final listOfPadding = listOfRequiments
        .map((e) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                e,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ))
        .toList();

    return listOfPadding;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.listDetails.name),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
          color: Colors.grey[200],
          child: ListView(
            shrinkWrap: true,
            children: [
              Image.asset(
                widget.listDetails.imgURL,
                height: MediaQuery.of(context).size.width * 9 / 16,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text(
                      'application website'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      _lanchURL(widget.listDetails.applicationURL);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'guide website'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      _lanchURL(widget.listDetails.guideURL);
                    },
                  ),
                ],
              ),
              Text(
                "eligibility".tr,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background-1.jpg'),
                        fit: BoxFit.cover),
                    //color: Colors.brown[100],
                    //border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: listOfRequimentPadings(),
                ),
              ),
              SizedBox(height: 10),
              _adOrContainer(),
              Text(
                "documents".tr,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background-1.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: listOfPadding(),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "processTime".tr + widget.listDetails.processTime,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "cost".tr + "\$ " + widget.listDetails.cost,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
