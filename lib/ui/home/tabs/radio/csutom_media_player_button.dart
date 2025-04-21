import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class CustomMediaPlayerButton extends StatelessWidget {
  CustomMediaPlayerButton(
      {required this.sheikhName,
      super.key,
      required this.isPlaying,
      required this.isMuted});
  String sheikhName;
  bool isPlaying = false;
  bool isMuted = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.151,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primaryColor,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                  isPlaying ? AppAssets.soudWave : AppAssets.mosqueBlackImage),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.012),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  sheikhName,
                  style: AppStyles.bold20Black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: isPlaying
                          ? ImageIcon(AssetImage(AppAssets.playIcon))
                          : ImageIcon(
                              AssetImage(AppAssets.pauseIcon),
                            ),
                      iconSize: 35,
                      color: AppColors.blackColor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: isMuted
                          ? ImageIcon(AssetImage(AppAssets.speakerOf))
                          : ImageIcon(
                              AssetImage(AppAssets.speakerOn),
                            ),
                      iconSize: 35,
                      color: AppColors.blackColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
/*
w:430
h:932
*/