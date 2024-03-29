
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:mathxy/Serves/Ads.dart';
import 'package:mathxy/thems.dart';


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
  final _nativeAdController = NativeAdmobController();
  InterstitialAd _interstitialAd;
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
    _interstitialAd = adm.createInterstitialAd()..load() ;
    print('hemidi');


  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    a.dispose();
    b.dispose();
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
                                borderStyle: TeXViewBorderStyle.Solid,
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
                      _interstitialAd?.show() ;


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
