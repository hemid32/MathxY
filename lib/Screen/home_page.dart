import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:mathxy/WIdget/Home/Homes2.dart';
import 'package:flutter_share/flutter_share.dart';

class GotoHomesPages extends StatefulWidget {
  //final ponits =  ;

  //var url ;

  @override
  _GotoHomesPagesState createState() => _GotoHomesPagesState();
}

class _GotoHomesPagesState extends State<GotoHomesPages> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nativeAdController = NativeAdmobController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_pageController = PageController();

    //print(Provider.of<MyListCont>(context , listen: false).precent[0]);
  }

  Future<void> shar() async {
    await FlutterShare.share(
        title: 'حل معادلات',
        text: 'حل مشاكل الرياضيات',
        linkUrl:
            'https://play.google.com/store/apps/details?id=dz.hemidi.mathxy',
        chooserTitle: 'مشاركة التطبيق');
  }

  //PageController _pageController;

  @override
  void dispose() {
    // TODO: implement dispose
    //_pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'MathXy',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.limeAccent,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.share,
            ),
            onTap: () async {
              print('shar');
              await shar();
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: Image.asset('issues/images/panner.png'),
          ),
          HomePage(),
        ],
      ),
    );
  }

  //SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');

  //Navigator.pop(context) ;

  // To do

}
