import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:group04/controller/get_user_data_controller.dart';
import 'package:group04/screens/admin_panel/admin_main_screen.dart';
import 'package:group04/screens/auth-ui/welcom_screen.dart';
import 'package:group04/screens/user_panel/main_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:group04/utils/app_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      loggdin(context);
    });
  }

  Future<void> loggdin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => AdminMainScreen());
      } else {
        Get.offAll(() => MainScreen());
      }
    } else {
      Get.to(() => WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/image/anhnen.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPowerredBy,
                style: TextStyle(
                    color: AppConstant.appTestColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                ),

              ) ,
            )
          ],
        ),
      ),
    );
  }
}
