import 'package:bahoz_blog/model/blog_model.dart';
import 'package:bahoz_blog/widget/header.dart';
import 'package:bahoz_blog/widget/inputField.dart';
import 'package:bahoz_blog/widget/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static TextEditingController myController = TextEditingController();
  static listCategoryController controller = Get.put(listCategoryController());
  static List<String> categorys = ['تکنولوژی', 'رایانه', 'برنامه نویسی'];
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // شریفی: با ترو و فالس شدن این، آیکون نوتیفیکیشن اون نقطه قرمز برداشته میشه
    bool hasNotification = true;
    final myController = TextEditingController();
    List<int> itemsSelcted = [];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              SizedBox(height: 18),
              // هدر و سرچ و تنظیمات درون یک پدینگ
              Padding(
                padding: EdgeInsets.only(left: 29, right: 29),
                child: Column(
                  children: [
                    Header(
                      hasNotification: hasNotification,
                      title:
                        SvgPicture.asset('images/icons/app_bar/logo.svg'),
                      icon1: SvgPicture.asset(
                        'images/icons/app_bar/notification_dot.svg'),
                      icon2: SvgPicture.asset(
                        'images/icons/app_bar/notification.svg'),
                      buttomClick: () {}
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    searchAndSetting(),
                    SizedBox(
                      height: 32,
                    ),
                    HeaderTopList(text: 'دسته بندی ها', buttomClick: () {}),
                    SizedBox(
                      height: 18,
                    ),
                  ]
                )
              ),
              // لیست کتگوری ها
              Container(
                height: 35,
                width: double.infinity,
                child: rowListSelection(
                  items: HomeScreen.categorys, 
                  itemsSelected: itemsSelcted
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 29, right: 29),
                  child: ListView(
                    children: [
                      HeaderTopList(text: "پیشنهاد شده", buttomClick: () {}),
                      SizedBox(
                        height: 18,
                      ),
                      GetBuilder<listCategoryController>(
                        init: listCategoryController(),
                        builder: (_) => columnListShow(
                          categorySelected: listCategoryController.to.categoryList,
                          items: [
                            BlogModel(
                              date: 'امروز',
                              read_time: 'خواندن در ۳ دقیقه',
                              cover_link: 'https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg',
                              category: 'تکنولوژی',
                              topic: "روند پیشرفت تکنولوژی در سال 2022"
                            ),
                            BlogModel(
                              date: 'امروز',
                              read_time: 'خواندن در ۳ دقیقه',
                              cover_link: 'https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg',
                              category: 'تکنولوژی',
                              topic: "روند پیشرفت تکنولوژی در سال 2022"
                            ),
                            BlogModel(
                              date: 'امروز',
                              read_time: 'خواندن در ۳ دقیقه',
                              cover_link: 'https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg',
                              category: 'تکنولوژی',
                              topic: "روند پیشرفت تکنولوژی در سال 2022"
                            ),
                            BlogModel(
                              date: 'امروز',
                              read_time: 'خواندن در ۳ دقیقه',
                              cover_link: 'https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg',
                              category: 'تکنولوژی',
                              topic: "روند پیشرفت تکنولوژی در سال 2022"
                            ),
                            BlogModel(
                              date: 'امروز',
                              read_time: 'خواندن در ۳ دقیقه',
                              cover_link: 'https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg',
                              category: 'تکنولوژی',
                              topic: "روند پیشرفت تکنولوژی در سال 2022"
                            )
                          ]
                        ),
                      )
                    ],
                  ),
                )
              )
            ]
          ),
        ),
      )
    );
  }

  // شریفی: این آیکون تنظیمات که سبز هست رو ریترن میکنه
  Widget getSettingButton() {
    return GestureDetector(
      onTap: (() {
        print(HomeScreen.myController.text);
      }),
      child: Container(
        width: 39,
        height: 39,
        decoration: BoxDecoration(
            color: const Color(0xFF159F91),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: SvgPicture.asset('images/icons/home/setting.svg'),
        ),
      ),
    );
  }

  Widget searchAndSetting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SearchBar(controller: HomeScreen.myController, onChanged: (value) {}),
        const SizedBox(width: 14),
        getSettingButton(),
      ],
    );
  }
}
