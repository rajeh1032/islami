import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/hadith_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class HadithItem extends StatefulWidget {
  int index;

  HadithItem({required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadith;
  @override
  void initState() {
    // TODO: implement initState
    readHadithData(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.primaryColor,
        // image: const DecorationImage(
        //   image: AssetImage(AppAssets.hadithContainerBg),
        // ),
      ),
      child: hadith == null
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.bgBlackColor,
              ),
            )
          : Stack(
              children: [
                Positioned(
                    bottom: 0, child: Image.asset(AppAssets.mosqueBlackImage)),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(AppAssets.leftHadithCorner),
                        Expanded(
                          child: Text(
                            hadith?.title ?? "",
                            style: AppStyles.bold20Black,
                          ),
                        ),
                        Image.asset(AppAssets.rightHadithCorner),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.016,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          textAlign: TextAlign.center,
                          hadith?.content ?? "",
                          style: AppStyles.bold20Black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  void readHadithData(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/files/Hadeeth/h$index.txt");
    print(fileContent);
    String title = fileContent.substring(0, fileContent.indexOf('\n'));
    String contnet = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadith = HadithModel(title: title, content: contnet);
    setState(() {});
  }
}
