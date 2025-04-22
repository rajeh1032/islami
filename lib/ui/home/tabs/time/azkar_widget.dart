import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class AzkarWidget extends StatelessWidget {
  AzkarWidget({super.key, required this.isEvvinnig});
  bool isEvvinnig = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
        onTap: () {},
        child: Container(
          width: width * 0.430,
          height: height * 0.29,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.primaryColor, width: 2)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(isEvvinnig
                    ? AppAssets.azkarEvining
                    : AppAssets.azkarMorning),
                Text(
                  isEvvinnig ? "اذكار الصباح" : "اذكار المساء",
                  style: AppStyles.bold20white,
                ),
              ]),
        ));
  }
}
/*

width: 430
height: 932
*/