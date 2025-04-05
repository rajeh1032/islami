import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/ui/home/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "on_boarding_screen";

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: SizedBox(),
          bodyWidget: Column(
            children: [
              SizedBox(height: 10),
              Image.asset("assets/images/Logo.png", height: 170),
              SizedBox(height: 40),
              Image.asset(
                "assets/images/Group 41.png",
                height: 300,
                width: double.infinity,
              ),
              SizedBox(height: 60),
              const Text(
                "Welcome To Islami App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              ),
            ],
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xFF202020),
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox(),
          bodyWidget: Column(
            children: [
              SizedBox(height: 10),
              Image.asset("assets/images/Logo.png", height: 170),
              SizedBox(height: 40),
              Image.asset("assets/images/kabba.png",
                  width: double.infinity, height: 300),
              SizedBox(height: 30),
              const Text(
                "Welcome To Islami App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              ),
              SizedBox(height: 30),
              const Text(
                "We Are Very Excited To Have You In Our Community",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              )
            ],
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xFF202020),
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox(),
          bodyWidget: Column(
            children: [
              SizedBox(height: 10),
              Image.asset("assets/images/Logo.png", height: 170),
              SizedBox(height: 40),
              Image.asset(
                "assets/images/welcome.png",
                height: 300,
                width: double.infinity,
              ),
              SizedBox(height: 30),
              const Text(
                "Reading the Quran",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              ),
              SizedBox(height: 30),
              const Text(
                "Read, and your Lord is the Most Generous",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              )
            ],
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xFF202020),
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox(),
          bodyWidget: Column(
            children: [
              SizedBox(height: 10),
              Image.asset(
                "assets/images/Logo.png",
                height: 170,
                width: double.infinity,
              ),
              SizedBox(height: 40),
              Image.asset(
                "assets/images/bearish.png",
                height: 300,
                width: double.infinity,
              ),
              SizedBox(height: 30),
              const Text(
                "Bearish",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              ),
              SizedBox(height: 30),
              const Text(
                "Praise the name of your Lord, the Most High",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              )
            ],
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xFF202020),
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox(),
          bodyWidget: Column(
            children: [
              SizedBox(height: 10),
              Image.asset("assets/images/Logo.png", height: 170),
              SizedBox(height: 40),
              Image.asset(
                "assets/images/radio.png",
                height: 300,
                width: double.infinity,
              ),
              SizedBox(height: 30),
              const Text(
                "Holy Quran Radio",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              ),
              SizedBox(height: 30),
              const Text(
                "You can listen to the Holy Quran Radio through the application for free and easilys",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F),
                ),
              )
            ],
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xFF202020),
          ),
        ),
      ],
      onDone: () {
        Navigator.popAndPushNamed(context, HomeScreen.routeName);
      },
      onSkip: () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      next: (Text(
        "Next",
        style: TextStyle(fontSize: 18, color: Color(0xffE2BE7F)),
      )),
      showBackButton: true,
      back: (Text(
        "Back",
        style: TextStyle(fontSize: 18, color: Color(0xffE2BE7F)),
      )),
      done: const Text(
        "Finish",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xffE2BE7F)),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(8.0, 8.0),
        color: Colors.grey,
        activeColor: Color(0xffE2BE7F),
        activeSize: Size(16.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      showSkipButton: false,
      globalBackgroundColor: Color(0xFF202020),
    );
  }
}
