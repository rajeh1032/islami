import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/radio/csutom_media_player_button.dart';

class RadioList extends StatelessWidget {
  const RadioList({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, index) => SizedBox(
        height: height * 0.02,
      ),
      itemBuilder: (_, index) {
        return CustomMediaPlayerButton(
          sheikhName: "RadioList",
          isPlaying: index % 2 == 0 ? true : false, // مجرد مثال
          isMuted: index % 3 == 0 ? true : false,
        );
      },
    );
  }
}
