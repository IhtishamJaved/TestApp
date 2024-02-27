import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/constant/size_config.dart';
import 'package:test_app/views/home/model/home_model.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.homeModel,
    required this.ontap,
  });

  final HomeModel homeModel;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 4 * SizeConfig.widthMultiplier,
            vertical: 1 * SizeConfig.heightMultiplier),
        padding: EdgeInsets.symmetric(
            horizontal: 2 * SizeConfig.widthMultiplier,
            vertical: 1.2 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(1, 1)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              homeModel.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 1.6 * SizeConfig.textMultiplier,
              ),
            ),
            Text(
              homeModel.body!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 1.4 * SizeConfig.textMultiplier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
