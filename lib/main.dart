import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:mathxy/Screen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';






void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseAdMob.instance.initialize(appId: AdManager.appId);

  await Firebase.initializeApp();

  //print(FirebaseAdMob.testAppId);
  FirebaseAdMob.instance.initialize(appId:'ca-app-pub-1803778669602445~6902545696' );

  //rint(x.GetPointGpaphFunction('0.5x+2'));
  //var get = Data_Get();
  //var getdata = await get.Data_Cours('info2', 0);
  //print(getdata);





  //print('coper == $cope2');
  //print(cope);


  //print(cope) ;
  //var data = Data_Get() ;
  //var point = Point() ;
  //var validing = await point.Validing_point('point_info2') ;
  //var datas = await data.Data_Cours('info2');
  //print('point === $datas') ;
  //var FIleFine = await  point.VerifeFileFin('info2');
  //print(FIleFine);
  //var valid = await point.VerifeFileFin('info2');
  //print(valid) ;

  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://6affc6acffb8435dad45b7c95e44de6f@o494566.ingest.sentry.io/5565886';
    },
    appRunner: () => runApp(MaterialApp(



      title: 'Navigation Basics',

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const FallbackCupertinoLocalisationsDelegate(),

      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home: GotoHomesPages(),//login(title: 'Flutter Login'), //home_page(info_tout), // FirstRoute() // home_page



    )),
  );








  /*
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MyListCont>(
          create: (context) => MyListCont()),
    ],
    child: MaterialApp(
      title: 'Navigation Basics',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const FallbackCupertinoLocalisationsDelegate(),
      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home: home_page(),//login(title: 'Flutter Login'), //home_page(info_tout), // FirstRoute() // home_page
    ),
  ));
   */
  //getdata();
  //data_partin1();
  //runApp(wilcom());



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