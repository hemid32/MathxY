import 'dart:io';

import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mathxy/Screen/devision/screenintegral.dart';
import 'package:mathxy/Screen/integral/screenintegral.dart';
import 'package:mathxy/WIdget/Equition/Function/FunctionDesign.dart';
import 'package:mathxy/WIdget/Equition/eq1.dart';
import 'package:mathxy/WIdget/Equition/eqt2.dart';
import 'package:mathxy/WIdget/Equition/pgcd.dart';
import 'package:mathxy/api/ads.dart';
import 'package:mathxy/thems.dart';

class HomePage extends StatefulWidget {
  //InterstitialAd _interstitialAd;
  //final adm =  AdManager() ;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ////////////

  BannerAd _anchoredBanner;
  bool _loadingAnchoredBanner = false;
  Future<void> _createAnchoredBanner(BuildContext context) async {
    print(Ads.banner) ;
    final AnchoredAdaptiveBannerAdSize size =
    await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: AdSize.mediumRectangle,
      request: AdRequest(),
      adUnitId:
      Ads.banner, //'ca-app-pub-1803778669602445/6884931764',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }



   ////////////

  bool _isInterstitialAdLoaded = false;


  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      // placementId: "YOUR_PLACEMENT_ID",
      placementId: AdsFacebook.instit,
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }






  @override
  void dispose() {
    super.dispose();
    //_anchoredBanner?.dispose();

  }



  @override
  void initState() {
    _loadInterstitialAd() ;
    super.initState();

  }

  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();
    else
      print("Interstial Ad not yet loaded!");
  }


  @override
  Widget build(BuildContext context) {
    /*
    if (!_loadingAnchoredBanner) {
      _loadingAnchoredBanner = true;
      _createAnchoredBanner(context);
    }

     */

    return WillPopScope(
      onWillPop: () async {
        //print('exiiiiiiiiiiiiiiit');
        await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        return false ;

      },
      child: Column(children: [




        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 80.0,
              child: GestureDetector(
                onTap: () {
                  //Provider.of<MyProvider>(context, listen: false).GetFunctionDesign(true);
                  //Provider.of<MyProvider>(context, listen: false).GetStringAppAbar('رسم دالة ');
                  //DesignFunction
                  _showInterstitialAd() ;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DesignFunction()),
                  );


                },
                child: new Container(

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Colors.lime,
                        Colors.limeAccent,
                        Colors.limeAccent[100],
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    //color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(children: [
                    Expanded(child: Image.asset('issues/images/Cosine.ico')),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        'رسم دالة ',
                        style: txtStyle
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 80.0,
              child: GestureDetector(
                onTap: () {
                  print('Pgcd');
                  //Provider.of<MyProvider>(context, listen: false).get_Pgcd(true);
                  //Provider.of<MyProvider>(context, listen: false)
                  //    .GetStringAppAbar('حساب PGCD');
                  //_showInterstitialAd();
                  _showInterstitialAd() ;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculePgcd()),
                  );

                },
                child: new Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Colors.lime,
                        Colors.limeAccent,
                        Colors.limeAccent[100],
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(children: [
                    Expanded(child: Image.asset('issues/images/calculation.ico')),

                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        'حساب PGCD',
                        style: txtStyle
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 80.0,
              child: GestureDetector(
                onTap: () {
                  //Provider.of<MyProvider>(context, listen: false).get_Eq1(true);
                  //Provider.of<MyProvider>(context, listen: false).GetStringAppAbar('حل معادلات من درجة 1 ');
                  //Eqution1
                  //_showInterstitialAd();
                  _showInterstitialAd() ;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Eqution1()),
                  );
                },
                child: new Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Colors.lime,
                        Colors.limeAccent,
                        Colors.limeAccent[100],
                      ],
                    ),

                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(children: [
                    Expanded(child: Image.asset('issues/images/square.ico')),

                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      child: Text(
                        'حل معادلات من درجة 1 ',
                        style:txtStyle
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 80.0,
              child: GestureDetector(
                onTap: () {
                  //Provider.of<MyProvider>(context, listen: false).get_Eq2(true);
                  //Provider.of<MyProvider>(context, listen: false).GetStringAppAbar('حل معادلات من درجة 2 ');
                  //_showInterstitialAd();
                  _showInterstitialAd() ;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Equation2()),
                  );

                },
                child: new Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Colors.lime,
                        Colors.limeAccent,
                        Colors.limeAccent[100],
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.lime.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.orangeAccent[100],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(children: [
                    Expanded(child: Image.asset('issues/images/Emc.ico')),

                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      child: Text(
                        'حل معادلات من درجة 2',
                        style:txtStyle
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 80.0,
              child: GestureDetector(
                onTap: () {
                  //Provider.of<MyProvider>(context, listen: false).get_Eq1(true);
                  //Provider.of<MyProvider>(context, listen: false).GetStringAppAbar('حل معادلات من درجة 1 ');
                  //Eqution1
                  //_showInterstitialAd();

                  _showInterstitialAd() ;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Calculator()),
                  );



                  print('equation deferrencial');
                },
                child: new Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Colors.lime,
                        Colors.limeAccent,
                        Colors.limeAccent[100],
                      ],
                    ),

                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(children: [
                    Expanded(child: Image.asset('issues/images/integrate.png')),

                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      child: Text(
                          'حل معادلات التفاضل ',
                          style:txtStyle
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 80.0,
              child: GestureDetector(
                onTap: () {
                  //Provider.of<MyProvider>(context, listen: false).get_Eq2(true);
                  //Provider.of<MyProvider>(context, listen: false).GetStringAppAbar('حل معادلات من درجة 2 ');
                  print('ggg');
                  //_showInterstitialAd();
                  _showInterstitialAd() ;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Devision()),
                  );

                },
                child: new Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Colors.lime,
                        Colors.limeAccent,
                        Colors.limeAccent[100],
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.lime.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.orangeAccent[100],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(children: [
                    Expanded(child: Image.asset('issues/images/der.png')),

                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      child: Text(
                          'الاشتقاق',
                          style:txtStyle
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,) ,
        Container(
          alignment: Alignment(0.5, 1),
          child: FacebookBannerAd(
            placementId: AdsFacebook.banner,
            bannerSize: BannerSize.MEDIUM_RECTANGLE,
            listener: (result, value) {
              switch (result) {
                case BannerAdResult.ERROR:
                  print("Error: $value");
                  break;
                case BannerAdResult.LOADED:
                  print("Loaded: $value");
                  break;
                case BannerAdResult.CLICKED:
                  print("Clicked: $value");
                  break;
                case BannerAdResult.LOGGING_IMPRESSION:
                  print("Logging Impression: $value");
                  break;
              }
            },
          ),
        )

      ]),
    );
  }
}
