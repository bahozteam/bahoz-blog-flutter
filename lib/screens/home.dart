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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          titleSpacing: 29,
          centerTitle: false,
          title: SvgPicture.asset('images/icons/app_bar/logo.svg'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: IconButton(
                splashRadius: 24,
                tooltip: 'Notification',
                onPressed: () {},
                // شریفی: این مکانیزم نشون دادن آیکون نوتیفیکیشن هست
                // شریفی: به کامنت های "ایگنور" توجه نکنید چون بعدا به ای پی آی متصل بشه اوکی میشه
                icon: hasNotification
                    // ignore: dead_code
                    ? SvgPicture.asset(
                        'images/icons/app_bar/notification_dot.svg',
                      )
                    // ignore: dead_code
                    : SvgPicture.asset(
                        'images/icons/app_bar/notification.svg',
                      ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSearchBar(myController),
                const SizedBox(width: 14),
                getSettingButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  // شریفی: این آیکون تنظیمات که سبز هست رو ریترن میکنه
  Widget getSettingButton() {
    return IconButton(
      tooltip: 'تنظیمات',
      splashRadius: 28,
      iconSize: 39,
      icon: Container(
        height: 39,
        width: 39,
        decoration: BoxDecoration(
            color: const Color(0xFF159F91),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: SvgPicture.asset('images/icons/home/setting.svg'),
        ),
      ),
      onPressed: () {},
    );
  }

  // شریفی: این سرچ بار رو ریترن میکنه
  // شریفی: هنوز مکانیزم سرچش درست نشده کامل چون هنوز لیستی نداریم برای سرچ
  Widget getSearchBar(myController) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 29),
      height: 39,
      width: 284,
      child: TextField(
        controller: myController,
        onChanged: (value) {
          //Do something
        },
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset('images/icons/home/search.svg'),
          ),
          filled: true,
          fillColor: const Color(0xFFEBEBEB),
          hintText: 'جستجو',
          hintStyle: const TextStyle(
            fontSize: 15.0,
            color: Color(0xFF7D7D7D),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  //
}
