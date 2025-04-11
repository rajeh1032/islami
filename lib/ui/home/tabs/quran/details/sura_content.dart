import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/most_recentley_provider.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraContent extends StatefulWidget {
  static const String routeName = "SuraContent";
  const SuraContent({super.key});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  late MostRecentleyProvider provider;
  List<String> verses = [];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provider.refreshMostRecentList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final index = ModalRoute.of(context)?.settings.arguments as int;

    provider = Provider.of<MostRecentleyProvider>(context);
    if (verses.isEmpty) {
      loadSuraContent(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurahs[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.040),
        color: AppColors.blackColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftSuraIcon),
                Text(
                  QuranResources.arabicQuranSuras[index],
                  style: AppStyles.bold20Primary.copyWith(fontSize: 24),
                ),
                Image.asset(AppAssets.rightSuraIcon),
              ],
            ),
            Expanded(
              child: verses.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(vertical: height * 0.005),
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.blackColor),
                            child: Text(
                              "${verses[index]}[${index + 1}]",
                              textDirection: TextDirection.rtl,
                              style: AppStyles.bold20Primary,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      itemCount: verses.length,
                    ),
            )
          ],
        ),
      ),
    );
  }

  void loadSuraContent(int index) async {
    var suraContent =
        await rootBundle.loadString("assets/files/Suras/${index + 1}.txt");
    var suraLines = suraContent.trim().split('\n');
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        verses = suraLines;
      });
    });
  }
}
