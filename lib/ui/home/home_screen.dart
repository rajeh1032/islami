import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadith/hadith_tab.dart';
import 'package:islami/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int selectedIndex = 0;
  //list of tabs background
  List<String> backGroundImages = [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  //list of tabs screen
  List<Widget> tabsList = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        //background for every tab
        Image.asset(
          backGroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
            // bottomNavigationBar
            bottomNavigationBar: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: buildItemInBottomNavBar(0, AppAssets.iconQuran),
                        label: "Quran"),
                    BottomNavigationBarItem(
                        icon: buildItemInBottomNavBar(1, AppAssets.iconHadith),
                        label: "Hadith"),
                    BottomNavigationBarItem(
                        icon: buildItemInBottomNavBar(2, AppAssets.iconSebha),
                        label: "Sebha"),
                    BottomNavigationBarItem(
                        icon: buildItemInBottomNavBar(3, AppAssets.iconRadio),
                        label: "Radio"),
                    BottomNavigationBarItem(
                        icon: buildItemInBottomNavBar(4, AppAssets.iconTime),
                        label: "Time"),
                  ]),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.logo,
                  height: height * 0.15,
                ),
                tabsList[selectedIndex],
              ],
            )),
      ],
    );
  }

  Widget buildItemInBottomNavBar(int index, String imageName) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.bgBlackColor),
            child: ImageIcon(AssetImage(imageName)),
          )
        : ImageIcon(AssetImage(imageName));
  }
}
