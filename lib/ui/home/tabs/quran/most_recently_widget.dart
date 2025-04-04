import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_content.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/shared_pref_utils.dart';

import '../../../../utils/app_assets.dart';

class MostRecentlyWidget extends StatefulWidget {
  MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  List<int> mostRenctelyIndices = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMostRecentIndicesList();
  }

//todo : get List<int> from shared Prefreances
  void getMostRecentIndicesList() async {
    mostRenctelyIndices = await readMostRecently();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Visibility(
      visible: mostRenctelyIndices.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Most Recently",
            style: AppStyles.bold20white,
          ),
          SizedBox(
            height: height * 0.010,
          ),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: width * 0.02,
                );
              },
              itemCount: mostRenctelyIndices.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        arguments: mostRenctelyIndices[index],
                        context,
                        SuraContent.routeName);
                  },
                  child: Container(
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${QuranResources.englishQuranSurahs[mostRenctelyIndices[index]]}",
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                "${QuranResources.arabicQuranSuras[mostRenctelyIndices[index]]}",
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                "${QuranResources.AyaNumber[mostRenctelyIndices[index]]} Verses",
                                style: AppStyles.bold14Black,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(AppAssets.mostRecently)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
