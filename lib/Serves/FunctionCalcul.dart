import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class FunctionCalculPoint{




  GetPointGpaphFunction(Functions) async  {
     print('Function ==== $Functions');
     var point1 = [0 ,Function(Functions , 0) ] ;  // [x,y]
     var point2 = [5 ,Function(Functions , 5) ] ;  // [x,y]
     var point3 = [-5 ,Function(Functions , -5) ] ;  // [x,y]

     //return [point1 , point2 , point3 ]  ;

     final List<Point> data = [
       Point(point1[0], point1[1]),
       Point(point2[0], point2[1]),
       Point(point3[0], point3[1]),


     ];

     print('data ===== $data');

     return data ;


  }


  Function(FuncStr , VarX){
  Variable x = Variable('x');
  ContextModel cm = ContextModel();
  cm.bindVariable(x, Number(VarX));
  //cm.bindVariable(y, Number(1));
  //
  Parser p = Parser();
  Expression exp = p.parse(TakeString(FuncStr));

  // Evaluate expression:
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  print('Calc func === $eval'); // = 1.0


  return eval ;






    }


    TakeString(Str){

      var numpr = ['1' , '2' , '3' , '4', '5' , '6' , '7' , '8' , '9', '0'];
      var zomra = Str ;
      var parts = zomra.split('');
      var indexX = parts.indexOf('x');
      //print('From 67 line Str == ${Str}');

      if (indexX - 1 >= 0 ) {
        if (numpr.contains(parts[indexX - 1 ])) {
          parts.insert(indexX, '*');
        }
      }

      //return Function(parts.join());











      print(indexX);
      print('From 85 line parse == ${parts.join()}');
      return parts.join() ;


    }







}