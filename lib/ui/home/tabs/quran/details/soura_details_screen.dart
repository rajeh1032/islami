import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:flutter/services.dart' show rootBundle;

class SouraDetailsScreen extends StatefulWidget {
  static const String routeName = "SouraDetailsScreen";

  SouraDetailsScreen({super.key});

  @override
  State<SouraDetailsScreen> createState() => _SouraDetailsScreenState();
}

class _SouraDetailsScreenState extends State<SouraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraDetails(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurahs[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Stack(
        children: [
          Container(
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
                            return Text(
                              verses[index],
                              style: AppStyles.bold20Primary,
                              textAlign: TextAlign.center,
                            );
                          },
                          itemCount: verses.length,
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadSuraDetails(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/files/Suras/${index + 1}.txt");
    var suraLines = fileContent.trim().split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines);
    }
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        verses = suraLines;
      });
    });
  }
}
/*

width: 430
height: 932
*/