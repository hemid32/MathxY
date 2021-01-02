import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:google_fonts_arabic/fonts.dart';

class ShowLteax extends StatelessWidget {
  final Date_Latex ;
  final nombre_definition ;

  ShowLteax(this.Date_Latex , this.nombre_definition);
  @override
  Widget build(BuildContext context) {
    var target_st = nombre_definition;
    var def;
    if (target_st == 1) {
      def = '1';
    } else if (target_st == 2) {
      def = '2';
    } else if (target_st == 3) {
      def = '3';
    }
    return  Container(



      child :  Column(

        children: <Widget>[
          Text(Date_Latex['def' + def + '1'],
            style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
          data_vide(Date_Latex['eq' + def + '1'])? Container() : TeXView(

              child: TeXViewColumn(children: [
                TeXViewDocument(
                    Date_Latex['eq' + def + '1'], // Date_Latex['eq' + def + '1']
                    style: TeXViewStyle.fromCSS(
                        'padding: 5px; color: black; background: #EEEEEE')

                )
              ])


          ),

          data_vide(Date_Latex['def' + def + '2'])? Container() : Text(Date_Latex['def' + def + '2'],
              style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),

          data_vide(Date_Latex['eq' + def + '2'])? Container() : TeXView(

              //loadingWidgetBuilder: gicr(),
              child: TeXViewColumn(
                  children: [
                    TeXViewDocument(
                        Date_Latex['eq' + def + '2'],
                        style: TeXViewStyle.fromCSS(
                            'padding: 5px; color: black; background: #EEEEEE')

                    )
                  ])),

          data_vide(Date_Latex['def' + def + '3'])? Container() : Text(Date_Latex['def' + def + '3'],
              style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),

          data_vide(Date_Latex['eq' + def + '3'])? Container() : TeXView(



              child: TeXViewColumn(children: [
                TeXViewDocument(
                    Date_Latex['eq' + def + '3'],
                    style: TeXViewStyle.fromCSS(
                        'padding: 5px; color: black; background: #EEEEEE')

                )
              ])),

          data_vide(Date_Latex['def' + def + '4'])? Container() : Text(Date_Latex['def' + def + '4'],
              style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),

          data_vide(Date_Latex['eq' + def + '4'])? Container() : TeXView(



              child: TeXViewColumn(children: [

                TeXViewDocument(

                    Date_Latex['eq' + def + '4'],
                    style: TeXViewStyle.fromCSS(
                        'padding: 5px; color: black; background: #EEEEEE')

                )
              ])),

          data_vide(Date_Latex['def' + def + '5'])? Container() :Text(Date_Latex['def' + def + '5'],
              style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),

          data_vide(Date_Latex['eq' + def + '5'])? Container() :TeXView(


              child: TeXViewColumn(children: [
                TeXViewDocument(
                    Date_Latex['eq' + def + '5'],
                    style: TeXViewStyle.fromCSS(
                        'padding: 5px; color: black; background: #EEEEEE')

                )
              ])),
        ],
      ),
    );
  }
}

data_vide(data){
  //print((widget.data[0][0]['eq' + '1' + '2']).toString().trim());
  if((data).toString().trim() == '' || data == null ){
    //print('penameuuuuuuuuuuuuuuuuur');
    return true ;
  }else
    return false ;

}
