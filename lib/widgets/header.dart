import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class TitleOfSections extends StatelessWidget {
  final String text;
  final void Function() buttomClick;
  const TitleOfSections(
      {Key? key, required this.text, required this.buttomClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
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
                child: SvgPicture.asset('images/icons/home/more.svg', width: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}
