import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/constant/color.dart';
import 'package:test_app/constant/size_config.dart';
import 'package:test_app/views/home/controller/home_controller.dart';
import 'package:test_app/views/home/widget/home_container.dart';
import 'package:test_app/views/home_detail/page/home_detail_screen.dart';

class HomeScreen extends GetView<HomeCtrl> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Post ",
          style: GoogleFonts.poppins(
            fontSize: 2 * SizeConfig.textMultiplier,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.blackColor,
              ))
            : controller.postList.isEmpty
                ? Center(
                    child: Text(
                    "No Post Found".tr,
                    style: GoogleFonts.poppins(
                      fontSize: 1.8 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor,
                    ),
                  ))
                : RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: controller.scrollController,
                      itemCount: controller.isLoading.value
                          ? controller.postList.length + 1
                          : controller.postList.length,
                      itemBuilder: (context, index) {
                        if (index < controller.postList.length) {
                          return HomeContainer(
                              ontap: () {
                                Get.to(() => HomeDetailScreen(
                                    homeModel: controller.postList[index]));
                              },
                              homeModel: controller.postList[index]);
                        } else {
                          return Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.blackColor));
                        }
                      },
                    ),
                  ),
      ),
    );
  }

  Future<void> _refresh() async {
    controller.getPosts();
    await Future.delayed(const Duration(seconds: 2));
  }
}
