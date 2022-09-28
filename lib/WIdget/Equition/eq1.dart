
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

class Eqution1 extends StatefulWidget {

  @override
  _PgcdState1 createState() => _PgcdState1();
}

class _PgcdState1 extends State<Eqution1> {
  final adm =  ManageAds() ;


  // *** ads

  // *** ads



  final a = TextEditingController();
  final b = TextEditingController();
  String rslt = '';

  String at = 'a';
  String bt = 'b';
  String method = '';
  List <String> mdt = [];

  // ads
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



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
    // TODO: implement dispose
    a.dispose();
    b.dispose();
    _anchoredAdaptiveAd?.dispose();

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.limeAccent,
          title: Center(child: Text('معادلة من الدرجة الاولى' , style:  txtStyleAppBar)),

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
            child : Container(

              decoration: BoxDecoration(
                //color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

              padding: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5),

              margin:EdgeInsets.only(top: 10 , left: 5 , right: 5),
              child :
                    TeXView(

                        style: TeXViewStyle(
                          elevation: 10,
                          borderRadius: TeXViewBorderRadius.all(0),
                          border: TeXViewBorder.all(TeXViewBorderDecoration(
                              borderColor: Colors.indigo,
                              borderStyle: TeXViewBorderStyle.solid,
                              borderWidth: 2)),
                          backgroundColor: Colors.black,
                        ),
                        child: TeXViewColumn(children: [
                          TeXViewDocument(
                              "\$\$ ax +b = 0 \$\$",
                              style: TeXViewStyle.fromCSS(
                                  'padding: 5px; color: black; background: white')
                          )
                        ])),
                    //padding: EdgeInsets.only(left:50),




              )  ,
            ),
        _getAdWidget(),
        Center(
          child: Container(

              child: Card(
                child: Container(
                  child: Text(
                    'اضغط على a و b لادخال القيم',
                    style: txtStyle
                  ),
                ),
              )),
        ),





        Container(

          child: Column(

            children: <Widget>[

              //**

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.15,),



                  Text('0' ,

                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),



                  Text('=' ,

                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),








                  Card(



                      color: Colors.white30,
                      child: Container(
                          //padding: EdgeInsets.only(left: 20 ,top: 0 , right: 200),

                          //padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

                        //width: MediaQuery.of(context).size.width * 0.6,

                          child: SizedBox(
                            width: 50,

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
                  Text('+' ,

                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),



                  Expanded(
                    child: TeXView(

                        child: TeXViewColumn(children: [
                          TeXViewDocument(
                      '<h1> \\(' + 'x' + '\\)</h1>',


                          )
                        ])),
                  ) ,


                  Card(

                      color: Colors.white30,
                      child: Container(
                        //padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

                        //width: MediaQuery.of(context).size.width * 0.6,

                          child: SizedBox(
                            width: 50,

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
                  SizedBox(width: MediaQuery.of(context).size.width * 0.15,),











                ],
              ),



              //**





              method.trim() == ''? Container() :  Card(

                child: Container(
                  width: 500,

                  child: Column(
                    children: [
                      Text('الحل' ,style: txtStyle),
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
                                rslt,
                                style: TeXViewStyle.fromCSS(
                                    'padding: 5px; color: black; background: yellow')
                            )
                          ])),
                  Text(
                    'طريقة الحل' ,style: txtStyle),
                     method.trim() == '' ? Container() :  TeXView(
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
                      var av ;
                      var bv ;
                      a.text.trim() == '' ? av=0 :   av = double.parse(a.text.trim());
                      b.text.trim() == '' ? bv=0 :  bv = double.parse(b.text.trim());
                      var h ;

                      try {h = pgcd(av, bv); }catch(e){
                        h = 0 ;
                      }

                      setState(() {



                        at = a.text;
                        bt = b.text;
                        //String he = method ;
                        String  text_method  = ' '  ;

                        mdt.forEach((element) {text_method = text_method +   element   +'\n' ; }) ;
                        method = text_method ;


                        rslt = h.toString();
                      }



                      );
                    },
                    child: Text(
                      "احسب",
                      textAlign: TextAlign.center,
                      style:txtStyle
                    ),
                  ),
                ),
              )

            ],
          ),

        )


      ],
    );
  }

  pgcd(var a, var b) {
    mdt = [];
    double x ;
    x = -(b)/a ;
    mdt.add('\$\$$a \\times x + $b = 0\$\$' );
    mdt.add('\$\$$a \\times x = -($b)\$\$'  );
    mdt.add('\$\$x = -\\frac{$b}{$a}\$\$'  );
    mdt.add('\$\$x = $x\$\$' );
    return '\$\$x = $x\$\$' ;
  }




}



