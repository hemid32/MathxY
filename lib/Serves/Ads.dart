
import 'package:firebase_admob/firebase_admob.dart';

class ManageAds {

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    //testDevices: ['ca-app-pub-3940256099942544~3347511713'],
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );


  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId:'ca-app-pub-1803778669602445/9902569271',
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-1803778669602445/1276127886',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  NativeAd createNativeAd() {
    return NativeAd(
      adUnitId:'ca-app-pub-1803778669602445/9411421168',
      factoryId: 'adFactoryExample',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("$NativeAd event $event");
      },
    );
  }
}


//ca-app-pub-1803778669602445/5694408138