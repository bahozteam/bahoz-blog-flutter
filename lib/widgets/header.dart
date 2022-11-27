import 'package:flutter/material.dart';

//مجیدی:این ویجت برای هدر ها است
class Header extends StatefulWidget {
  final bool hasNotification;
  final Widget title;
  final Widget icon1;
  final Widget icon2;
  final Function buttomClick;
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
          Container(
            width: 24,
            height: 24,
            child: widget.hasNotification ? widget.icon1 : widget.icon2,
          )
        ],
      ),
    );
  }
}
