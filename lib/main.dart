import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:group04/screens/auth-ui/sign_in_screen.dart';
import 'package:group04/screens/auth-ui/sign_up_screen.dart';
import 'package:group04/screens/auth-ui/splash-screen.dart';
import 'package:group04/screens/user_panel/main_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    if(kIsWeb){
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyBQk1yaKhWn5bRw9Z_IUt75eADtMT23kks',
          appId: '1:1087109060697:web:8cfdc25dfa2124267d3948',
          messagingSenderId:'1087109060697' ,
          projectId:'my-shop-a13b1' ,
          storageBucket:'my-shop-a13b1.appspot.com' ,

        ),
      );
  }else {
      await Firebase.initializeApp();
    }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Tuan Istore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}
