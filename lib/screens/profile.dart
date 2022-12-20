import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/w_header.dart';

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
                    /* محتوای کل این صفحه اینجا بنویس  */
                  ],
                ),
              ),
            ),
            //
            //
            //
          ],
        ),
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
