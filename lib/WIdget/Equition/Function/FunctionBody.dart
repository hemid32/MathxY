import 'package:flutter_plot/flutter_plot.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:mathxy/Serves/FunctionCalcul.dart';

class BodyFunction extends StatelessWidget {
  final func ;
  BodyFunction(this.func) ;
  final ClassFunc = FunctionCalculPoint();

  final List<Point> data = [
    //Point(point1[0], point1[1]),
    //Point(point2[0], point2[1]),
    //Point(point3[0], point3[1]),
    const Point(0,0),
    const Point(1,3),
    const Point(5,6),

  ];




  @override
  Widget build(BuildContext context) {
    return

      FutureBuilder(
        future: ClassFunc.GetPointGpaphFunction(func),
        builder: (cxt , snapShot){

          print('Data builder snapShot.data === ${snapShot.data}');
          if(snapShot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator() ;
          }else {
            return snapShot.hasData ?  Container(
              child: Card(
                  child: Column(
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: new Text('منحنى الدالة'),
                      ),

                        TeXView(

                            child: TeXViewColumn(children: [
                              TeXViewDocument(
                                '<h4> \\(' + 'f(x)' + '=' + func +  '\\)</h4>',


                              )
                            ])),


                      new Container(
                        child: new Plot(
                          height: 400.0,
                          data: snapShot.data,
                          gridSize: new Offset(2.0, 2.0),
                          style: new PlotStyle(
                            axisStrokeWidth: 2.0,
                            pointRadius: 3.0,
                            outlineRadius: 1.0,
                            primary: Colors.yellow,
                            secondary: Colors.red,
                            trace: true,
                            traceStokeWidth: 3.0,
                            traceColor: Colors.blueGrey,
                            traceClose: true,
                            showCoordinates: true,
                            textStyle: new TextStyle(
                              fontSize: 8.0,
                              color: Colors.indigo,
                            ),
                            axis: Colors.indigo,
                            gridline: Colors.blueGrey[100],
                          ),
                          padding: const EdgeInsets.fromLTRB(
                              40.0, 12.0, 12.0, 40.0),
                          xTitle: 'X',
                          yTitle: 'Y',
                        ),
                      ),
                    ],
                  )),

            ) : Center(child: CircularProgressIndicator());
          }


        },
      );
  }
}
