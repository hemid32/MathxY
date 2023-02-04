import 'package:flutter/material.dart';
import 'package:mathxy/Screen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';






void main() async{

  WidgetsFlutterBinding.ensureInitialized();


  //AppLovinMAX.showMediationDebugger();

// SDK is initialized, start loading ads


      runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const FallbackCupertinoLocalisationsDelegate(),

      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home: GotoHomesPages(),//login(title: 'Flutter Login'), //home_page(info_tout), // FirstRoute() // home_page



    ));













}

aMethodThatMightFail(text){
  print( 5 * text ) ;

}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}