import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group04/screens/auth-ui/sign_in_screen.dart';
import 'package:group04/utils/app_constant.dart';
import 'package:lottie/lottie.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
        title: Text(
            "Welcom to my shop",
          style: TextStyle(color: AppConstant.appTestColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child:
            Lottie.asset('assets/image/anhnen.json'),
            ),

            Container(
              margin: EdgeInsets.only(top: 20.0),
                child: Text(
                    "TUAN ISTORE",
                    style: TextStyle(
                        fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                ),
            ),
            SizedBox(height:  Get.height/12,),
            Material(
              child: Container(
                width: Get.width/1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appMainColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon: Image.asset('assets/image/final-google-logo.png',
                      width: Get.width /12,
                      height: Get.height / 12,),
                  label: Text(
                      "Sign in with google",
                    style: TextStyle(color: AppConstant.appTestColor),
                  ),
                  onPressed: (){},
                ),
              ),
            ),
            SizedBox(height:  Get.height/60,),
            Material(
              child: Container(
                width: Get.width/1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appMainColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon: Icon(Icons.email, color:  AppConstant.appTestColor,),
                  label: Text(
                    "Sign in with email",
                    style: TextStyle(color: AppConstant.appTestColor),
                  ),
                  onPressed: (){
                    Get.off(() => SignInScreen());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
