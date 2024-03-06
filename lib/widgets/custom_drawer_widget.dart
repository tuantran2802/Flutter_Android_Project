import 'package:group04/screens/auth-ui/sign_in_screen.dart';
import 'package:group04/screens/user_panel/all_orders_screen.dart';
import 'package:group04/screens/user_panel/all_product_screen.dart';
import 'package:group04/screens/user_panel/main_screen.dart';
import 'package:group04/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:group04/screens/auth-ui/welcom_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Tuan",
                  style: TextStyle(color: AppConstant.appTestColor),
                ),
                subtitle: Text(
                  "Version 1.0.1",
                  style: TextStyle(color: AppConstant.appTestColor),
                ),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppConstant.appMainColor,
                  child: Text(
                    "T",
                    style: TextStyle(color: AppConstant.appTestColor),
                  ),
                ),
              ),
            ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Trang Chủ",
                  style: TextStyle(color: AppConstant.appTestColor),
                ),
                leading: Icon(
                  Icons.home,
                  color: AppConstant.appTestColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTestColor,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => MainScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Sản phẩm",
                  style: TextStyle(color: AppConstant.appTestColor),
                ),
                leading: Icon(
                  Icons.production_quantity_limits,
                  color: AppConstant.appTestColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTestColor,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => AllProductsScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Đơn hàng",
                  style: TextStyle(color: AppConstant.appTestColor),
                ),
                leading: Icon(
                  Icons.shopping_bag,
                  color: AppConstant.appTestColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTestColor,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => AllOrdersScreen());
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: ListTile(
            //     titleAlignment: ListTileTitleAlignment.center,
            //     title: Text(
            //       "Contact",
            //       style: TextStyle(color: AppConstant.appTestColor),
            //     ),
            //     leading: Icon(
            //       Icons.help,
            //       color: AppConstant.appTestColor,
            //     ),
            //     trailing: Icon(
            //       Icons.arrow_forward,
            //       color: AppConstant.appTestColor,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  Get.offAll(() => WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Đăng Xuất",
                  style: TextStyle(color: AppConstant.appTestColor),
                ),
                leading: Icon(
                  Icons.logout,
                  color: AppConstant.appTestColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTestColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppConstant.appScendoryColor,
      ),
    );
  }
}