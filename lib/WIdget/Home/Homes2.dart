import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathxy/Screen/devision/screenintegral.dart';
import 'package:mathxy/Screen/integral/screenintegral.dart';
import 'package:mathxy/WIdget/Equition/Function/FunctionDesign.dart';
import 'package:mathxy/WIdget/Equition/eq1.dart';
import 'package:mathxy/WIdget/Equition/eqt2.dart';
import 'package:mathxy/WIdget/Equition/pgcd.dart';
import 'package:mathxy/thems.dart';

class HomePage extends StatefulWidget {
  //InterstitialAd _interstitialAd;
  //final adm =  AdManager() ;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




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

      ]),
    );
  }
}
