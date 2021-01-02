
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:mathxy/Serves/Ads.dart';
import 'package:mathxy/WIdget/Equition/Function/FunctionBody.dart';
class DesignFunction extends StatefulWidget {
  @override
  _DesignFunctionState createState() => _DesignFunctionState();
}

class _DesignFunctionState extends State<DesignFunction> {
  final _nativeAdController = NativeAdmobController();
  InterstitialAd _interstitialAd;
  final adm =  ManageAds() ;
  final b = TextEditingController();
  bool ShawPlot = false ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _interstitialAd = adm.createInterstitialAd()..load() ;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.limeAccent,
          title: Center(child: Text('رسم منحنى دالة' , style:  TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),)),

        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 90,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20.0),
              child: NativeAdmob(
                // Your ad unit id
                adUnitID: 'ca-app-pub-1803778669602445/9411421168',
                numberAds: 3,
                controller: _nativeAdController,
                type: NativeAdmobType.banner,
                loading: Container(),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                Card(
                    color: Colors.white30,
                    child: Container(
                      //padding: EdgeInsets.only(left: 20 ,top: 0 , right: 200),
                      //padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      //width: MediaQuery.of(context).size.width * 0.6,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            controller: b,
                            //print(text);
                            //print(masafa);
                            textAlign: TextAlign.center,
                            //controller: myController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '...',
                            ),
                          ),
                        ))),



                Text('=' ,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Expanded(
                  child: TeXView(

                      child: TeXViewColumn(children: [
                        TeXViewDocument(
                          '<h1> \\(' + 'f(x)' + '\\)</h1>',

                        )
                      ])),
                ) ,
                SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
              ],
            ),
            ShawPlot ? BodyFunction(b.text) : Container(),


            Container(
              //width: MediaQuery.of(context).size.width*0.01,
              margin: EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 20),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                //color: Color(0xff01A0C7),
                color: Colors.indigo,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  onPressed: () async {
                    _interstitialAd?.show();

                    setState(() {
                      //print('b ===================$b') ;
                      ShawPlot = true ;
                    });


                  },
                  child: Text(
                    "رسم المنحنى",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),






          ],





    ),
      );
  }
}
