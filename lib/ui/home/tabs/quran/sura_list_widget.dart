import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
  SuraListWidget({super.key, required this.index});
  late int index;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vectorImage),
            Text(
              "${index + 1}",
              style: AppStyles.bold20white.copyWith(fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          width: width * 0.023,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSurahs[index],
              style: AppStyles.bold24White,
            ),
            Text(
              QuranResources.AyaNumber[index],
              style: AppStyles.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranSuras[index],
          style: AppStyles.bold20white,
        ),
      ],
    );
  }
}

/*
283
150h
width: 430
height: 932
*/