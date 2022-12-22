import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/profile_model.dart';
import '../widgets/w_header.dart';

//ParsaNik

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    bool hasNotification = true;
    final myController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: Floating_button(),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHomeHeader(context, hasNotification, myController),
            //
            //
            //
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://avatars.githubusercontent.com/u/94043228?v=4'),
                                  radius: 30,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 6.0),
                                  child: Text('پارسا نیک سیرت'),
                                ),
                                subtitle: Text('توسعه دهنده فلاتر '),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                ),
                                width: 90,
                                height: 40,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'ویرایش پروفایل',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 0,
                              ),
                            ),
                          ],
                        )

                        //
                        //
                        ,
                        SizedBox(
                          height: 12,
                        ),
                        //
                        //
                        //
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: Text(
                                  '۱۲ دنبال شونده',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                child: VerticalDivider(
                                  width: 30,
                                  thickness: 2,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '۱۲ دنبال کننده',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                child: VerticalDivider(
                                  width: 30,
                                  thickness: 2,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '۱۲ مقالات',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        //
                        //
                        TitleOfSections(
                          text: 'پیش نویس',
                          icon: 'assets/icons/icn_main/slidervertical.svg',
                        ),
                        SizedBox(height: 18),

                        /* get Recommended Blog Posts */
                        Draft(),
                        TitleOfSections(
                          text: 'منتشر شده',
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
            ),
            //
            //
            //
          ],
        ),
        drawer: Profile_drawer(),
      ),
    );
  }

  // Return Header/AppBar Widget
  Widget getHomeHeader(context, hasNotification, myController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/images/img_profile/logo.svg'),
                  GestureDetector(
                    onTap: () {},
                    child:
                        SvgPicture.asset('assets/icons/icn_profile/menu.svg'),
                  )
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 28,
          )
        ],
      ),
    );
  }
}

//Floating Action Button
class Floating_button extends StatelessWidget {
  const Floating_button({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Icon(Icons.create),
      onPressed: (() {
        Creat_post();
      }),
    );
  }
}

//Creat Screen for new post
class Creat_post extends StatelessWidget {
  const Creat_post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
