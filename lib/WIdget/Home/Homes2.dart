import 'dart:io';
import 'dart:math';

import 'package:applovin_max/applovin_max.dart';
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

  var _interstitialRetryAttempt = 0;

  void initializeInterstitialAds() {

    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialReady(_interstitial_ad_unit_id) will now return 'true'
        print('Interstitial ad loaded from ' + ad.networkName);

        // Reset retry attempt
        _interstitialRetryAttempt = 0;
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        // Interstitial ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        _interstitialRetryAttempt = _interstitialRetryAttempt + 1;

        int retryDelay = pow(2, min(6, _interstitialRetryAttempt)).toInt();

        print('Interstitial ad failed to load with code ' + error.code.toString() + ' - retrying in ' + retryDelay.toString() + 's');

        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadInterstitial(AdsAppLovine.inistat_ad_unit_id);
        });
      },
      onAdDisplayedCallback: (ad) {

      },
      onAdDisplayFailedCallback: (ad, error) {
       print('error : $error') ;
      },
      onAdClickedCallback: (ad) {

      },
      onAdHiddenCallback: (ad) {

      },
    ));

    // Load the first interstitial
    AppLovinMAX.loadInterstitial(AdsAppLovine.inistat_ad_unit_id);
  }
  Future<void>_showInterstitialAd()async  {
    bool isReady = (await AppLovinMAX.isInterstitialReady(AdsAppLovine.inistat_ad_unit_id));
    if (isReady) {
      AppLovinMAX.showInterstitial(AdsAppLovine.inistat_ad_unit_id);
    }else {
      initializeInterstitialAds() ;
    }

  }
  initializeBannerAds()
  {
    // Banners are automatically sized to 320x50 on phones and 728x90 on tablets
    AppLovinMAX.createBanner(AdsAppLovine.banner_ad_unit_id, AdViewPosition.bottomCenter);
    AppLovinMAX.setBannerBackgroundColor(AdsAppLovine.banner_ad_unit_id, "0xFFFFFF");
    // For example, to set a white background, set the background color to 0xFFFFFF.


  }


  ////////////









  @override
  void dispose() {
    super.dispose();
    //_anchoredBanner?.dispose();

  }



  @override
  void initState() {
    initializeInterstitialAds() ;
    initializeBannerAds() ;
    AppLovinMAX.showBanner(AdsAppLovine.banner_ad_unit_id);
    super.initState();

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
        /*
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
        ) ,

         */




      ]),
    );
  }
}
