
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mathxy/Serves/Ads.dart';
import 'package:mathxy/thems.dart';

import '../../api/ads.dart';


/*
void main() {
  var pgcde = pgcd(9 , 7) ;
  print('pgcd(24,20)=$pgcde') ;
  //print(pp('ndbkdbv'));
}

 */

class CalculePgcd extends StatefulWidget {
  final a;
  final b;
  const CalculePgcd({Key key, this.a, this.b}) : super(key: key);
  @override
  _CalculePgcdState createState() => _CalculePgcdState();
}

class _CalculePgcdState extends State<CalculePgcd> {
  final adm =  ManageAds() ;



  final a = TextEditingController();
  final b = TextEditingController();
  String rslt = '....';

  String at = 'a';
  String bt = 'b';
  String method = '';
  List<String> mdt = [];

  // ads
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    print('hemidi');


  }


  BannerAd _anchoredAdaptiveAd;
  bool _isLoaded = false;
  Orientation _currentOrientation;


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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    a.dispose();
    b.dispose();
    _anchoredAdaptiveAd?.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: Center(child: Text('القاسم المشترك الاكبر' , style: txtStyleAppBar)),

      ),

        body : mybody()

    );

  }

  Widget mybody() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        Card(
            child: Container(
          decoration: BoxDecoration(
            //color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
          margin: EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //width: 500,

                Icon(Icons.border_color),
                Text(
                  'PGCD(a , b)',
                  textAlign: TextAlign.center,
                  style: txtStyle ,
                ),
                //padding: EdgeInsets.only(left:50),

                Icon(
                  Icons.assignment,
                )
              ]),
        )),

        _getAdWidget(), 

        Center(
          child: Container(

              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'اضغط على a و b لادخال القيم',
                    style: txtStyle ,
                  ),
                ),
              )),
        ),






        Container(
          child: Column(

            children: <Widget>[


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /*

                  Expanded(child:TeXView(


                      child: TeXViewColumn(children: [
                        TeXViewDocument(
                          r'''<h2>)</h2>''',


                        )
                      ])),) ,

                   */
                  Text('(' ,

                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),


                  Card(

                      color: Colors.white30,
                      child: Container(
                        //padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

                        //width: MediaQuery.of(context).size.width * 0.6,

                          child: SizedBox(
                            width: 70,

                            child: TextField(
                              controller: a,
                                //print(text);
                                //print(masafa);
                              textAlign: TextAlign.center,
                              //controller: myController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'a',
                              ),
                            ),
                          ))),

                  Text(',' ,

                  style: TextStyle(
                    fontSize: 30,
                  ),
                  ),

                  Card(

                      color: Colors.white30,
                      child: Container(
                        //padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

                        //width: MediaQuery.of(context).size.width * 0.6,

                          child: SizedBox(
                            width: 70,

                            child: TextField(
                              controller: b,
                              //print(text);
                              //print(masafa);
                              textAlign: TextAlign.center,
                              //controller: myController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'b',
                              ),
                            ),
                          ))),

                  Text(')PGCD' ,

                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),








                ],
              ),


              //*****
              /*
              Row(
                children: [
                  Card(
                      color: Colors.white30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: a,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'اضغط هنا لكتابة العدد a ',
                        ),
                      )),
                ],
              ),

               */


              method.toString().trim() == '' ? Container(): Card(
                child: Container(
                  width: 500,
                  child: Column(
                    children: [

                      Text('الحل' ,style:txtStyle ),
                      rslt.trim() == '' ? Container():  TeXView(
                          style: TeXViewStyle(
                            elevation: 10,
                            borderRadius: TeXViewBorderRadius.all(25),
                            border: TeXViewBorder.all(TeXViewBorderDecoration(
                                borderColor: Colors.deepOrangeAccent,
                                borderStyle: TeXViewBorderStyle.solid,
                                borderWidth: 2)),
                            backgroundColor: Colors.black,
                          ),
                          child: TeXViewColumn(children: [
                            TeXViewDocument(
                          ' \$\$ PGCD($at , $bt) = $rslt \$\$ ',
                                style: TeXViewStyle.fromCSS(
                                    'padding: 5px; color: black; background: yellow')
                            )
                          ])),

                      Text(
                        'طريقة الحل' ,style:txtStyle
                      ),
                      method.trim() == '' ? Container() : TeXView(
                          style: TeXViewStyle(
                            elevation: 10,
                            borderRadius: TeXViewBorderRadius.all(25),
                            border: TeXViewBorder.all(TeXViewBorderDecoration(
                                borderColor: Colors.blue,
                                borderStyle: TeXViewBorderStyle.solid,
                                borderWidth: 5)),
                            backgroundColor: Colors.black,
                          ),

                          child: TeXViewColumn(children: [
                            TeXViewDocument(
                                method,
                                style: TeXViewStyle.fromCSS(
                                    'padding: 5px; color: black; background: white')
                            )
                          ])),

                    ],
                  ),
                ),
              ),



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


                      setState(() {
                        method = ' ';
                      });
                      print('a === ${a.text} b===$b');
                      var av = a.text == '' ? 0:  int.parse(a.text.trim());
                      var bv = b.text == '' ? 0 :  int.parse(b.text.trim());
                      var h;

                      try {
                        h = pgcd(av, bv);
                      } catch (e) {
                        print('prblm pgcd = 370');
                        print(e);
                        h = 0;
                      }


                      setState(() {
                        at = a.text;
                        bt = b.text;
                        //String he = method ;
                        String text_method = ' ';

                        mdt.forEach((element) {
                          //print(element);
                          text_method = text_method + element + '\n';
                        });
                        method = text_method;

                        rslt = h.toString();




                      });
                      print(mdt);
                    },
                    child: Text(
                      "احسب",
                      textAlign: TextAlign.center,
                      style: txtStyle
                    ),
                  ),
                ),
              )
            ],
          ),
        ),


      ],
    );
  }

  PrPlmZero(a,b){

    if(a != 0 && b!=0){
      return true ;
    }else if ((a==0 && b>0) | (b==0 && a>0) ) {
      print('from 429 ');
      if(a>b) {
        print('retrun a == $a ');

        return a;
      }
      else {
        print('retrun b == $b ');

        return b;
      }
    }else{
      return true ;
    }

  }


  int pgcd(var a, var b) {
    var g;
    if(PrPlmZero(a, b) == true){
      if (a > b) {
        g = pgcd1(a, b);
        return g;
      } else if (a < b) {
        g = pgcd1(b, a);
        return g;
      } else {
        g = pgcd1(a, b);
        return g;
      }

    }else{
      print('retrun PRplmZero ');
      pgcd1(a, b);
      var Rslt = PrPlmZero(a, b) ;

      return Rslt  ;
    }
  }

  int pgcd1(var a, var b) {
    //print('entre to while ');

    mdt = [];

    try {
      while (true) {
        var m;
        int z;
        z = a % b;
        m = (a / b).toInt();
        //print('m  : $m');
        String value = '\$\$$a = $b  \\times  $m + $z\$\$';
        mdt.add(value);
        if (z == 0) {
          if (b < m) {
            return b;
          } else {
            return b;
          }


        } else {
          a = b;
          b = z;
          //print('$a , $b');

        }
      }
    } catch (e) {
      mdt.add('الرجاء اختيار عددان طبيعيان');
      return 0;
    }
  }
}
