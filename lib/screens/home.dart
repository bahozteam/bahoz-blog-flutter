import 'package:bahoz_blog/widget/header.dart';
import 'package:bahoz_blog/widget/inputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // شریفی: با ترو و فالس شدن این، آیکون نوتیفیکیشن اون نقطه قرمز برداشته میشه
    bool hasNotification = true;
    final myController = TextEditingController();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 8, left: 29, right: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Header(
                  hasNotification: hasNotification,
                  title: SvgPicture.asset('images/icons/app_bar/logo.svg'),
                  icon1: SvgPicture.asset(
                      'images/icons/app_bar/notification_dot.svg'),
                  icon2:
                      SvgPicture.asset('images/icons/app_bar/notification.svg'),
                  buttomClick: () {}),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SearchBar(
                      controller: myController,
                      onChanged: (value) {
                        print(value);
                      }),
                  const SizedBox(width: 14),
                  getSettingButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // شریفی: این آیکون تنظیمات که سبز هست رو ریترن میکنه
  Widget getSettingButton() {
    return Container(
      width: 39,
      height: 39,
      decoration: BoxDecoration(
          color: const Color(0xFF159F91),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(7.5),
        child: SvgPicture.asset('images/icons/home/setting.svg'),
      ),
    );
  }
}
