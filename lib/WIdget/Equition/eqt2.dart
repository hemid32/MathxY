import 'dart:math';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:mathxy/Serves/Ads.dart';



/*
void main() {
  var pgcde = pgcd(9 , 7) ;
  print('pgcd(24,20)=$pgcde') ;
  //print(pp('ndbkdbv'));
}

 */

class Equation2 extends StatefulWidget {

  @override
  _PgcdState1 createState() => _PgcdState1();
}

class _PgcdState1 extends State<Equation2> {
  final _nativeAdController = NativeAdmobController();
  InterstitialAd _interstitialAd;
  final adm =  ManageAds() ;




  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  String rslt = '';

  String at = 'a';
  String bt = 'b';
  String ct = 'c';
  String method = '';
  List <String> mdt = [];

  // ads
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _interstitialAd = adm.createInterstitialAd()..load() ;


  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    a.dispose();
    b.dispose();
    c.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.limeAccent,
          title: Center(child: Text('معادلة من الدرجة الثانية' , style:  TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),)),

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
              child : TeXView(

                  style: TeXViewStyle(
                    elevation: 10,
                    borderRadius: TeXViewBorderRadius.all(0),
                    border: TeXViewBorder.all(TeXViewBorderDecoration(
                        borderColor: Colors.indigo,
                        borderStyle: TeXViewBorderStyle.Solid,
                        borderWidth: 2)),
                    backgroundColor: Colors.black,
                  ),
                  child: TeXViewColumn(children: [
                    TeXViewDocument(
                        "\$\$ ax^{2} +bx = c \$\$",
                        style: TeXViewStyle.fromCSS(
                            'padding: 5px; color: black; background: white')
                    )
                  ])),
              //padding: EdgeInse
    //padding: EdgeInsets.only(left:50),
            )
        ),
        Center(
          child: Container(

              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'اضغط على a و b و c لادخال القيم',
                    style: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
        ),

        Container(
          height: 90,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 20.0),
          child: NativeAdmob(
            // Your ad unit id
            adUnitID: 'ca-app-pub-1803778669602445/9411421168',
            numberAds: 1,
            controller: _nativeAdController,
            type: NativeAdmobType.banner,
            loading: Container(),
          ),
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(width: MediaQuery.of(context).size.width * 0.05,),



            Card(



                color: Colors.white30,
                child: Container(
                  //padding: EdgeInsets.only(left: 20 ,top: 0 , right: 200),

                  //padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

                  //width: MediaQuery.of(context).size.width * 0.6,

                    child: SizedBox(
                      width: 50,

                      child: TextField(
                        controller: c,
                        //print(text);
                        //print(masafa);
                        textAlign: TextAlign.center,
                        //controller: myController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'c',
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
                      '<h1> \\(' + 'x' + '\\)</h1>',


                    )
                  ])),
            ) ,









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
                      '<h1> \\(' + 'x^2' + '\\)</h1>',


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
            SizedBox(width: MediaQuery.of(context).size.width * 0.05,),











          ],
        ),






        //**

        Container(
          child: Column(

            children: <Widget>[

              method.trim() == '' ? Container() :  Card(

                child: Container(
                  width: 500,

                  child: Column(
                    children: [
                      Text('الحل' ,style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                      rslt.trim() =='' ? Container(): TeXView(
                          style: TeXViewStyle(
                            elevation: 10,
                            borderRadius: TeXViewBorderRadius.all(25),
                            border: TeXViewBorder.all(TeXViewBorderDecoration(
                                borderColor: Colors.deepOrangeAccent,
                                borderStyle: TeXViewBorderStyle.Solid,
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
                        'طريقة الحل' ,style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                      method.trim() == '' ? Container() :  TeXView(
                          style: TeXViewStyle(
                            elevation: 10,
                            borderRadius: TeXViewBorderRadius.all(25),
                            border: TeXViewBorder.all(TeXViewBorderDecoration(
                                borderColor: Colors.blue,
                                borderStyle: TeXViewBorderStyle.Solid,
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
                      _interstitialAd?.show();

                      setState(() {
                        method = ' ';
                      });
                      var av = double.parse(a.text.trim());
                      var bv = double.parse(b.text.trim());
                      var cv = double.parse(c.text.trim());
                      var h ;

                      try {h = pgcd(av, bv , cv); }catch(e){
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
                      print(mdt);
                    },
                    child: Text(
                      "احسب",
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
              )

            ],
          ),

        )


      ],
    );
  }

  pgcd(var a, var b , var c) {
    mdt = [];

    var bb = b * b ;
    var f = 4*(a * c) ; 
    var  dt = bb - f ;
    mdt.add('\$\$ $a x^2  + $b x = $c     \$\$');

    mdt.add('\$\$ \\triangle  \\text{  } \\text{في البداية نحسب ديلتا}   \$\$' );
    mdt.add('\$\$\\triangle =  b^{2} - 4ac\$\$ '  );
    mdt.add('\$\$\\triangle =  (($b)^2 - 4 \\times  $a \\times $c ) \$\$'  );
    mdt.add('\$\$\\triangle =  ($bb - 4 \\times $f ) \$\$'  );
    mdt.add('\$\$\\triangle =  $dt \$\$'  );
    if (dt == 0 ){
      mdt.add('\$\$ \\text{بما ان ديلتا يساوي 0} \$\$') ;
      mdt.add('\$\$  \\text{المعادلة تقبل حل وحيد هو} \$\$');
      mdt.add('\$\$ X = - \\frac{b}{2a} \$\$');
      double rslt = - (b)/(2*a);
      mdt.add('\$\$X = $rslt\$\$');
      return '\$\$X = $rslt\$\$' ;
    }else if(dt > 0){
      mdt.add('\$\$ \\text{بما ان ديلتا اكبر من صفر}  \$\$') ;
      mdt.add('\$\$ \\text{المعادلة تقبل حلان هما}   \$\$');
      //mdt.add(' X = - b /(2a)');
    //<string name="sqr_root">√¯</string>
      mdt.add('\$\$ X1 = \\frac{-b -\\sqrt{\\triangle}}{2a}\$\$');
      mdt.add('\$\$ X2 = \\frac{-b +\\sqrt{\\triangle}}{2a}\$\$');
      mdt.add('\$\$ اذا \$\$');
      double rslt1 = (-b - sqrt(dt))/(2*a) ;
      double rslt2 = (-b + sqrt(dt))/(2*a) ;
      mdt.add('\$\$ X1 = $rslt1\$\$');
      mdt.add('\$\$ X2 = $rslt2\$\$');
      return '\$\$ X1 = $rslt1\$\$ \n \$\$ X2 = $rslt2\$\$' ;
    }else if (dt < 0 ){
      mdt.add('\$\$ \\text{بما ان ديلتا اصغر من صفر}  \$\$') ;
      mdt.add('\$\$ \\text{يمكن القول انها لا تقبل حلول}  \$\$');
      //mdt.add('يمكن القول انها لا تقبل حلول');
      return 'Nan' ;
    }
  }





}



