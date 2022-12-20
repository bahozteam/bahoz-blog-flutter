import 'package:flutter/material.dart';
import '../models/list_model.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> items = [
    'همه',
    'تکنولوژی',
    'برنامه نویسی',
    'دیزاین',
    'هوش مصنوعی',
    'بیزینس',
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 36,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    // curve: Curves.slowMiddle,
                    margin: EdgeInsets.only(left: 11),
                    // height: 36,
                    decoration: BoxDecoration(
                      color: current == index
                          ? Color(0xFF2E8EFF)
                          : Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                current == index ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 24),
          getList().elementAt(current),
        ],
      ),
    );
  }

  List<Widget> getList() {
    return <Widget>[
      RecommendedPosts(),
      RecommendedPosts(),
      RecommendedPosts(),
      RecommendedPosts(),
      RecommendedPosts(),
      RecommendedPosts(),
    ];
  }
}
