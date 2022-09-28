import 'dart:io';

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

  BannerAd _anchoredAdaptiveAd;
  bool _isLoaded = false;
   Orientation _currentOrientation;
  ////////////

  InterstitialAd _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId:Ads.instit,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < 5) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd.show();
    _interstitialAd = null;
  }



   ////////////



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentOrientation = MediaQuery.of(context).orientation;
    _loadAd();
  }




  /// Load another ad, disposing of the current ad if there is one.
  Future<void> _loadAd() async {
    await _anchoredAdaptiveAd?.dispose();
    setState(() {
      _anchoredAdaptiveAd = null;
      _isLoaded = false;
    });

    final AnchoredAdaptiveBannerAdSize size =
    await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    _anchoredAdaptiveAd = BannerAd(
      adUnitId: Ads.banner,
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$ad loaded: ${ad.responseInfo}');
          setState(() {
            // When the ad is loaded, get the ad size and use it to set
            // the height of the ad container.
            _anchoredAdaptiveAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return _anchoredAdaptiveAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredAdaptiveAd?.dispose();
    _interstitialAd?.dispose();

  }


  /// Gets a widget containing the ad, if one is loaded.
  ///
  /// Returns an empty container if no ad is loaded, or the orientation
  /// has changed. Also loads a new ad if the orientation changes.
  Widget _getAdWidget() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (_currentOrientation == orientation &&
            _anchoredAdaptiveAd != null &&
            _isLoaded) {
          return Container(
            //color: Colors.green,
            width: _anchoredAdaptiveAd.size.width.toDouble(),
            height: _anchoredAdaptiveAd.size.height.toDouble(),
            child: AdWidget(ad: _anchoredAdaptiveAd),
          );
        }
        // Reload the ad if the orientation changes.
        if (_currentOrientation != orientation) {
          _currentOrientation = orientation;
          _loadAd();
        }
        return Container();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
    _loadAd() ;

  }

  @override
  Widget build(BuildContext context) {
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
                  _showInterstitialAd();
                  //Provider.of<MyProvider>(context, listen: false).GetFunctionDesign(true);
                  //Provider.of<MyProvider>(context, listen: false).GetStringAppAbar('رسم دالة ');
                  //DesignFunction
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
                  _showInterstitialAd();

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
                  _showInterstitialAd();

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
                  _showInterstitialAd();

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
                  _showInterstitialAd();


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
                  _showInterstitialAd();

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
        _getAdWidget(),

      ]),
    );
  }
}
