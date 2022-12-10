import 'dart:math';

import 'package:flutter/material.dart';

//مجیدی:این ویجت برای هدر ها است
class Header extends StatefulWidget {
  final bool hasNotification;
  final Widget title;
  final Widget icon1;
  final Widget icon2;
  final void Function() buttomClick;
  const Header(
      {Key? key,
      required this.hasNotification,
      required this.title,
      required this.icon1,
      required this.icon2,
      required this.buttomClick})
      : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          widget.title,
          Spacer(),
          GestureDetector(
            onTap: widget.buttomClick,
            child: Container(
                width: 24,
                height: 24,
                child: widget.hasNotification ? widget.icon1 : widget.icon2),
          )
        ],
      ),
    );
  }
}

class HeaderTopList extends StatelessWidget {
  final String text;
  final void Function() buttomClick;
  const HeaderTopList({Key? key, required this.text, required this.buttomClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              this.text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Spacer(),
            Text("دیدن همه", style: TextStyle(fontSize: 15)),
            SizedBox(width: 2),
            GestureDetector(
              onTap: this.buttomClick,
              child: Icon(Icons.navigate_next_rounded, size: 20),
            )
          ],
        ),
      ],
    );
  }
}
