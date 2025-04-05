import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 1;
  int index = 0;
  double angle = 0;
  List<String> azkarList = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله",
    "أستغفر الله",
    "سبحان الله وبحمده",
    "سبحان الله العظيم",
    "اللهم صلِّ وسلم \nعلى نبينا محمد",
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(children: [
      SizedBox(
        height: height * 0.02,
      ),
      Text(
        "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
        style: AppStyles.bold24White.copyWith(fontSize: 36),
      ),
      SizedBox(
        height: height * 0.02,
      ),
      GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          setState(() {
            angle += 0.2;
            if (counter < 33) {
              counter += 1;
              angle += 0.0000005;
            } else {
              angle = 0;

              counter = 1;
              index = (index + 1) % azkarList.length;
            }
          });
        },
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Transform.rotate(
            angle: angle,
            child: Image.asset(
              AppAssets.sebha,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                azkarList[index],
                style: AppStyles.bold24White.copyWith(fontSize: 28),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "$counter",
                style: AppStyles.bold24White.copyWith(fontSize: 28),
              ),
            ],
          ),
        ]),
      ),
    ]);
  }
}
/*

width: 430
height: 932
*/