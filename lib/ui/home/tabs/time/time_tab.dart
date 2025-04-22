import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadith/hadith_item.dart';
import 'package:islami/ui/home/tabs/time/azkar_widget.dart';
import 'package:islami/ui/home/tabs/time/prayer_time.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<PrayerTime> prayerTimes = [
      PrayerTime(name: "Fajr", time: "04:30", period: "AM"),
      PrayerTime(name: "Dhuhr", time: "01:01", period: "PM"),
      PrayerTime(name: "Asr", time: "04:38", period: "PM"),
      PrayerTime(name: "Maghrib", time: "07:57", period: "PM"),
      PrayerTime(name: "Isha", time: "09:37", period: "PM"),
    ];
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.040, vertical: height * 0.020),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: height * 0.322,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.primaryDarkColor,
                image: DecorationImage(
                    image: AssetImage(
                      AppAssets.prayBg,
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Date Miladi
                    Column(
                      children: [
                        Text(
                          '16 jul,',
                          style: AppStyles.bold16White,
                        ),
                        Text(
                          '2024',
                          style: AppStyles.bold16White,
                        ),
                      ],
                    ),
                    //pray txt And name Date
                    Column(
                      children: [
                        Text(
                          'Pray Time',
                          style: AppStyles.bold20Black,
                        ),
                        Text(
                          'Tuesday',
                          style: AppStyles.bold20Black,
                        ),
                      ],
                    ),
                    //Date Hegri
                    Column(
                      children: [
                        Text(
                          '9 Muh,',
                          style: AppStyles.bold16White,
                        ),
                        Text(
                          '1446',
                          style: AppStyles.bold16White,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                //prayer times
                CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.16,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.3, // عرض كل عنصر بالنسبة للشاشة
                  ),
                  items: prayerTimes.map((prayer) {
                    return Container(
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              AppAssets.prayTimeBg,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.black
                            .withOpacity(0.5), // نفس لون الخلفية في الصورة
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            prayer.name,
                            style: AppStyles.bold16White2.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            prayer.time,
                            style: AppStyles.bold16White2.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            prayer.period,
                            style: AppStyles.bold16White.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.25,
                      ),
                      Text(
                        "Next Pray-",
                        style: AppStyles.bold20Black,
                      ),
                      Text(
                        "02:32",
                        style: AppStyles.bold20Black,
                      ),
                      SizedBox(
                        width: width * 0.1,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(AssetImage(AppAssets.speakerOf)),
                        color: AppColors.blackColor,
                        iconSize: 30,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text("Azker", style: AppStyles.bold20white.copyWith(fontSize: 24)),
          SizedBox(
            height: height * 0.02,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AzkarWidget(
              isEvvinnig: true,
            ),
            AzkarWidget(
              isEvvinnig: false,
            ),
          ])
        ],
      ),
    ));
  }
}
/*

width: 430
height: 932
*/