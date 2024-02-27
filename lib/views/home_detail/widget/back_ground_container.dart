import 'package:flutter/material.dart';
import 'package:test_app/constant/size_config.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({
    super.key,
    required this.childd,
  });

  final Widget childd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100 * SizeConfig.widthMultiplier,
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
      child: childd,
    );
  }
}
