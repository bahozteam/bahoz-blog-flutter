import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatefulWidget {
  final bool hasNotification;
  final Widget title;
  const Header(
      {Key? key,
      required this.hasNotification,
      required this.title,
      })
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
            child: widget.hasNotification ? SvgPicture.asset('assets/icons/icn_appbar/notification_dot.svg') : SvgPicture.asset('assets/icons/icn_appbar/notification_dot.svg'),
          )
        ],
      ),
    );
  }
}

class TitleOfSections extends StatelessWidget {
  final String text;
  final String icon;
  const TitleOfSections({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(height: 32),
        Positioned(
          right: 24,
          child: Row(
            children: [
              SvgPicture.asset(
                this.icon,
                color: Colors.black87,
              ),
              SizedBox(width: 8),
              Text(
                this.text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
