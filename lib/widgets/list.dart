import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/blog_model.dart';

class ColumnListShow extends StatelessWidget {
  final List<BlogModel> items;
  final List<int> categorySelected;
  const ColumnListShow(
      {Key? key, required this.items, required this.categorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            ColumnListShowItem(blogDatas: items[i]),
            LineInList(),
          ]
        ],
      ),
    );
  }
}

class LineInList extends StatelessWidget {
  const LineInList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 21),
          child: Container(
            width: double.infinity,
            height: 1.5,
            color: Color(0xFFEFEFEF),
          ),
        ),
      ],
    );
  }
}

class ColumnListShowItem extends StatelessWidget {
  final BlogModel blogDatas;
  const ColumnListShowItem({Key? key, required this.blogDatas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      height: 101,
      child: Row(
        children: [
          ClipRRect(
            child: Image.network(
              blogDatas.coverLink,
              fit: BoxFit.cover,
              width: 132,
              height: 101,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          SizedBox(width: 11),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  blogDatas.category,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                AutoSizeText(
                  blogDatas.topic,
                  maxLines: 2,
                  minFontSize: 18,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: 'IranSans-medium',
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      blogDatas.date + '  •  ' + blogDatas.readTime,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset('images/icons/home/more.svg')
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
