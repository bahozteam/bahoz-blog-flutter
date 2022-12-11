import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/blog_model.dart';
import '../widgets/inputField.dart';
import '../widgets/slider.dart';
import '../widgets/header.dart';
import '../widgets/list.dart';

class HomeScreen extends StatelessWidget {
  static var categorys;

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Header/AppBar of BahozBlog */
            getHomeHeader(context, hasNotification, myController),
            /* Content of screen (Slider & Lists)*/
            getScreenContent()
          ],
        ),
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
              buttomClick: (() {}),
            ),

            /* Bahoz Custon Slider */
            Padding(
              padding: const EdgeInsets.only(top: 21, bottom: 28),
              child: BahozSlider(),
            ),

            /* Recommanded Sections*/
            Column(
              children: [
                TitleOfSections(
                  text: 'پیشنهاد شده',
                  buttomClick: () {},
                ),
                SizedBox(height: 18),

                /* get Recommended Blog Posts */
                getRecommendedPosts(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getRecommendedPosts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: ColumnListShow(
        categorySelected: [],
        items: [
          BlogModel(
            date: 'امروز',
            readTime: 'خواندن در ۳ دقیقه',
            coverLink:
                'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
            category: 'تکنولوژی',
            topic: "روند پیشرفت تکنولوژی در سال 2022",
          ),
          BlogModel(
            date: 'امروز',
            readTime: 'خواندن در ۳ دقیقه',
            coverLink:
                'https://images.unsplash.com/photo-1581089781785-603411fa81e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
            category: 'تکنولوژی',
            topic: 'تجهیزات جدید شگفت انگیز برای AR و دوستداران واقعیت مجازی',
          ),
          BlogModel(
            date: 'دیروز',
            readTime: 'خواندن در ۸ دقیقه',
            coverLink:
                'https://images.unsplash.com/photo-1580894742597-87bc8789db3d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
            category: 'برنامه نویسی',
            topic: 'شیرجه زدن به دنیای جدید هوشمند...',
          ),
          BlogModel(
            date: '۱۲/۴/۲۲',
            readTime: 'خواندن در ۱۵ دقیقه',
            coverLink:
                'https://images.unsplash.com/photo-1504384764586-bb4cdc1707b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
            category: 'دیزاین',
            topic: 'معرفی سیستم دیزاین جدید گوگل به اسم متریال یو',
          ),
          BlogModel(
            date: '۱۲/۴/۲۲',
            readTime: 'خواندن در ۳۴ دقیقه',
            coverLink:
                'https://images.unsplash.com/photo-1457305237443-44c3d5a30b89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
            category: 'هوش مصنوعی',
            topic: '۱۰ ابزار خفن برای هوش مصنوعی',
          ),
        ],
      ),
    );
  }

  Widget getHomeHeader(context, hasNotification, myController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Header(
              hasNotification: hasNotification,
              title: SvgPicture.asset(
                'images/icons/app_bar/logo.svg',
              ),
              icon1: SvgPicture.asset(
                'images/icons/app_bar/notification_dot.svg',
              ),
              icon2: SvgPicture.asset(
                'images/icons/app_bar/notification.svg',
              ),
              buttomClick: () {},
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
            height: 14,
          )
        ],
      ),
    );
  }

  Widget getSettingButton() {
    return Container(
      width: 39,
      height: 39,
      decoration: BoxDecoration(
        color: const Color(0xFF159F91),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.5),
        child: SvgPicture.asset('images/icons/home/setting.svg'),
      ),
    );
  }
}
