
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:mathxy/Serves/Ads.dart';
import 'package:mathxy/WIdget/Equition/Function/FunctionBody.dart';
import 'package:mathxy/thems.dart';
class DesignFunction extends StatefulWidget {
  @override
  _DesignFunctionState createState() => _DesignFunctionState();
}

class _DesignFunctionState extends State<DesignFunction> {

  final adm =  ManageAds() ;
  final b = TextEditingController();
  bool ShawPlot = false ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.limeAccent,
          title: Center(child: Text('رسم منحنى دالة' , style: txtStyleAppBar,)),

        ),
        body: ListView(
          children: <Widget>[

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

                    setState(() {
                      //print('b ===================$b') ;
                      ShawPlot = true ;
                    });


                  },
                  child: Text(
                    "رسم المنحنى",
                    textAlign: TextAlign.center,
                    style: txtStyle ,
                  ),
                ),
              ),
            ),






          ],





    ),
      );
  }
}
