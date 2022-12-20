import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/w_inputs.dart';
import '../widgets/w_slider.dart';
import '../widgets/w_header.dart';
import '../models/list_model.dart';

class HomeScreen extends StatelessWidget {
  static var categorys;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // شریفی: با ترو و فالس شدن این، آیکون نوتیفیکیشن اون نقطه قرمز برداشته میشه
    bool hasNotification = true;
    final myController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Header/AppBar of BahozBlog */
          getHomeHeader(context, hasNotification, myController),
          /* Content of screen (Slider & Lists)*/
          getScreenContent()
        ],
      ),
    );
  }

  Widget getScreenContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12),
            TitleOfSections(
              text: 'برترین‌های امروز',
              icon: 'assets/icons/icn_main/sliderhorizontal.svg',
            ),

            /* Bahoz Custon Slider */
            Padding(
              padding: const EdgeInsets.only(top: 21, bottom: 24),
              child: BahozSlider(),
            ),

            /* Recommanded Posts Sections*/
            Column(
              children: [
                TitleOfSections(
                  text: 'پیشنهاد شده',
                  icon: 'assets/icons/icn_main/slidervertical.svg',
                ),
                SizedBox(height: 18),

                /* get Recommended Blog Posts */
                RecommendedPosts(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getHomeHeader(context, hasNotification, myController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Header(
              hasNotification: hasNotification,
              title: SvgPicture.asset(
                'assets/icons/icn_appbar/logo.svg',
              ),
            ),
          ),
          SizedBox(height: 20),
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget getSettingButton() {
    return Container(
      width: 39,
      height: 39,
      decoration: BoxDecoration(
        color: const Color(0xFF2E8EFF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.5),
        child: SvgPicture.asset('assets/icons/icn_home/setting.svg'),
      ),
    );
  }
}
