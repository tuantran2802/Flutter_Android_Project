import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:group04/controller/get_user_data_controller.dart';
import 'package:group04/controller/sign_in_controller.dart';
import 'package:group04/screens/admin_panel/admin_main_screen.dart';
import 'package:group04/screens/auth-ui/forget_password_screen.dart';
import 'package:group04/screens/auth-ui/sign_up_screen.dart';
import 'package:group04/screens/user_panel/main_screen.dart';
import 'package:group04/utils/app_constant.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
  Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return Scaffold(
              appBar: AppBar(
              backgroundColor: AppConstant.appMainColor,
              centerTitle: true,
              title: Text(
              "Đăng Nhập",
              style: TextStyle(color: AppConstant.appTestColor),
          ),
          ),
          body: Container(
            child: Column(
              children: [
                isKeyboardVisible
          ?         Text("Welcome to my shop")
                 : Column(
                      children: [
                          Lottie.asset('assets/image/anhnen.json'),
                  ],
                 ),
               SizedBox(
                  height: Get.height / 20,
                ),
               Container(
                   margin: EdgeInsets.symmetric(horizontal: 5.0),
                   width: Get.width,
                   child: Padding(
                       padding: const EdgeInsets.all(10.0),
                         child: TextFormField(
                          controller: userEmail,
                          cursorColor: AppConstant.appMainColor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Email",
                               prefixIcon: Icon(Icons.email),
                                contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                                border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10.0),
                            ),
                           ),
                        ),
                       ),
                  ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                 width: Get.width,
                   child: Padding(
                         padding: const EdgeInsets.all(10.0),
                        child: Obx(
                            () => TextFormField(
                             controller: userPassword,
                             obscureText: signInController.isPasswordVisible.value,
                             cursorColor: AppConstant.appMainColor,
                              keyboardType: TextInputType.visiblePassword,
                               decoration: InputDecoration(
                                   hintText: "Password",
                                   prefixIcon: Icon(Icons.password),
                                   suffixIcon: GestureDetector(
                                   onTap: () {
                                     signInController.isPasswordVisible.toggle();
                                     },
                                   child: signInController.isPasswordVisible.value
                                     ? Icon(Icons.visibility_off)
                                         : Icon(Icons.visibility),
                                  ),
                                 contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                                   border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                             ),
                          ),
                   ),
                 )),
          ),
                   Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                      onTap: () {
                       Get.to(() => ForgetPasswordScreen());
                   },
                        child: Text(
                           "Quên Mật Khẩu?",
                        style: TextStyle(
                        color: AppConstant.appMainColor,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
               ),
                SizedBox(
                 height: Get.height / 20,
               ),
                Material(
                    child: Container(
                    width: Get.width / 2,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                    color: AppConstant.appMainColor,
                    borderRadius: BorderRadius.circular(20.0),
                   ),
                        child: TextButton(
                        child: Text(
                        "ĐĂNG NHẬP",
                        style: TextStyle(color: AppConstant.appTestColor),
                        ),
                          onPressed: () async {
                          String email = userEmail.text.trim();
                          String password = userPassword.text.trim();

                          if (email.isEmpty || password.isEmpty) {
                          Get.snackbar(
                          "Error",
                           "Please enter all details",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appMainColor,
                          colorText: AppConstant.appTestColor,
                        );
                          } else {
                          UserCredential? userCredential = await signInController
                              .signInMethod(email, password);

                          var userData = await getUserDataController
                              .getUserData(userCredential!.user!.uid);

                          if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {
                          //
                          if (userData[0]['isAdmin'] == true) {
                          Get.snackbar(
                          "Success Admin Login",
                          "login Successfully!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appMainColor,
                          colorText: AppConstant.appTestColor,
                       );
                          Get.offAll(() => AdminMainScreen());
                          } else {
                          Get.offAll(() => MainScreen());
                          Get.snackbar(
                          "Success User Login",
                          "login Successfully!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appMainColor,
                          colorText: AppConstant.appTestColor,
                      );
                     }
                   } else {
                          Get.snackbar(
                          "Error",
                          "Please verify your email before login",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appMainColor,
                          colorText: AppConstant.appTestColor,
                          );
                          }
                            } else {
                            Get.snackbar(
                            "Error",
                            "Please try again",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appMainColor,
                            colorText: AppConstant.appTestColor,
                            );
                            }
                          }
                          },
                        ),
                     ),
                  ),
                  SizedBox(
                  height: Get.height / 20,
                  ),
                 Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(
                      "Don't have an account? ",
                      style: TextStyle(color: AppConstant.appMainColor),
                      ),
                      GestureDetector(
                      onTap: () => Get.offAll(() => SignUpScreen()),
                      child: Text(
                      "Sign Up",
                      style: TextStyle(
                      color: AppConstant.appMainColor,
                      fontWeight: FontWeight.bold),
                      ),
                   ),
                 ],
               )
            ],
          ),
          ),
          );
        });
  }
}
