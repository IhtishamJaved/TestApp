import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/constant/color.dart';
import 'package:test_app/constant/size_config.dart';
import 'package:test_app/views/home/model/home_model.dart';
import 'package:test_app/views/home_detail/widget/back_ground_container.dart';

class HomeDetailScreen extends StatelessWidget {
  final HomeModel homeModel;
  const HomeDetailScreen({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          homeModel.title!,
          style: GoogleFonts.poppins(
            fontSize: 2 * SizeConfig.textMultiplier,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 1 * SizeConfig.heightMultiplier),
          BackGroundContainer(childd: titleTile("Title :", homeModel.title!)),
          SizedBox(height: 1 * SizeConfig.heightMultiplier),
          BackGroundContainer(childd: userIDTile()),
          SizedBox(height: 1 * SizeConfig.heightMultiplier),
          BackGroundContainer(childd: titleTile("Details :", homeModel.body!))
        ],
      ),
    );
  }

  Row userIDTile() {
    return Row(
      children: [
        Text(
          "User ID :",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 1.6 * SizeConfig.textMultiplier,
          ),
        ),
        SizedBox(width: 4 * SizeConfig.widthMultiplier),
        Text(
          homeModel.id!.toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 1.6 * SizeConfig.textMultiplier,
          ),
        ),
      ],
    );
  }

  Column titleTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 1.6 * SizeConfig.textMultiplier,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 1.6 * SizeConfig.textMultiplier,
          ),
        ),
      ],
    );
  }
}
