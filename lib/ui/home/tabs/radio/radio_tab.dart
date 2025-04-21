import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/radio/csutom_media_player_button.dart';
import 'package:islami/ui/home/tabs/radio/radio_list.dart';
import 'package:islami/ui/home/tabs/radio/reciter_list.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.015),
            AnimatedToggleSwitch<bool>.size(
              current: positive,
              values: const [false, true],
              indicatorSize: Size.fromWidth(width * 0.4),
              customIconBuilder: (context, local, global) {
                bool isSelected = local.value == global.current;
                return Text(
                  local.value ? 'Reciters' : 'Radio',
                  style: isSelected
                      ? AppStyles.bold20Black
                      : AppStyles.bold20white,
                );
              },
              borderWidth: 4.0,
              iconAnimationType: AnimationType.onHover,
              style: ToggleStyle(
                indicatorColor: AppColors.primaryColor,
                borderColor: Colors.transparent,
                backgroundColor: AppColors.blackColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1.5),
                  ),
                ],
              ),
              selectedIconScale: 1.0,
              onChanged: (b) => setState(() => positive = b),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(child: positive ? ReciterList() : RadioList())
          ],
        ),
      ),
    );
  }
}
