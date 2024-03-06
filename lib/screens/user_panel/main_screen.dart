import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:group04/screens/user_panel/all_flash_sale_product_screen.dart';
import 'package:group04/screens/auth-ui/sign_in_screen.dart';
import 'package:group04/screens/auth-ui/welcom_screen.dart';
import 'package:group04/screens/user_panel/all_categories_screen.dart';
import 'package:group04/screens/user_panel/all_product_screen.dart';
import 'package:group04/screens/user_panel/cart_screen.dart';
import 'package:group04/utils/app_constant.dart';
import 'package:group04/widgets/all-products-widget.dart';
import 'package:group04/widgets/banner_widget.dart';
import 'package:group04/widgets/category-widget.dart';
import 'package:group04/widgets/custom_drawer_widget.dart';
import 'package:group04/widgets/flash-sale-widget.dart';
import 'package:group04/widgets/heading_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTestColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appScendoryColor,
          statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstant.appScendoryColor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: AppConstant.appTestColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => CartScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics:  BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              Text('Chuyên các mặt hàng điện thoại'),
              //banner
              BannerWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Danh Mục Sản Phẩm ",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),

              CategoriesWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Chương Trình Siêu Sale Của Tháng",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllFlashSaleProductScreen()),
                buttonText: "See More >",
              ),

              FlashSaleWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Tất Cả Sản Phẩm",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllProductsScreen()),
                buttonText: "See More >",
              ),

              AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
