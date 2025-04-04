import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_content.dart';
import 'package:islami/ui/home/tabs/quran/most_recently_widget.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/ui/home/tabs/quran/details/soura_details_screen.dart';
import 'package:islami/ui/home/tabs/quran/sura_list_widget.dart';

import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:islami/utils/shared_pref_utils.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterIndeciesList = List.generate(
    114,
    (index) => index,
  );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(width * 0.046),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //todo TextField For search
            TextField(
              style: AppStyles.bold20white,
              onChanged: (newText) {
                filterListByNewText(newText);
              },
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                  prefixIcon: ImageIcon(
                    AssetImage(AppAssets.iconQuran),
                    color: AppColors.primaryColor,
                  ),
                  hintText: "Sura Name",
                  hintStyle: AppStyles
                      .bold20white /* Theme.of(context).textTheme.headlineLarge*/,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 2)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2),
                  )),
            ),
            SizedBox(
              height: height * 0.021,
            ),
            //todo MostRecently widget
            MostRecentlyWidget(),
            SizedBox(
              height: height * 0.021,
            ),
            Text(
              "Suras List",
              style: AppStyles.bold20white,
            ),
            SizedBox(
              height: height * 0.010,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(0),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.WhiteColor,
                    thickness: 1,
                    endIndent: width * 0.144,
                    indent: width * 0.17,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      updateMostRecentIndcisList(filterIndeciesList[index]);
                      Navigator.pushNamed(
                          arguments: filterIndeciesList[index],
                          context,
                          SuraContent.routeName);
                    },
                    child: SuraListWidget(
                      index: filterIndeciesList[index],
                    ),
                  );
                },
                itemCount: filterIndeciesList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterListByNewText(String newText) {
    List<int> filterList = [];
    for (int i = 0; i < QuranResources.arabicQuranSuras.length; i++) {
      if (QuranResources.englishQuranSurahs[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterList.add(i);
      } else if (QuranResources.arabicQuranSuras[i].contains(newText)) {
        filterList.add(i);
      }
    }
    setState(() {
      filterIndeciesList = filterList;
    });
  }
}

/*
283
150h
width: 430
height: 932
*/