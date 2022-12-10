import 'package:bahoz_blog/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../screens/home.dart';

class columnListShow extends StatelessWidget {
  final List<BlogModel> items;
  final List<int> categorySelected;
  const columnListShow(
      {Key? key, required this.items, required this.categorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(children: [
          for (int i = 0; i < items.length; i++) ...[
            if (this.categorySelected.length == 0) ...[
              columnListShowItem(blogDatas: items[i]),
              lineInList()
            ] else ...[
              for (int j = 0; j < this.categorySelected.length; j++) ...[
                if (HomeScreen.categorys[categorySelected[j]] ==
                    items[i].category) ...[
                  columnListShowItem(blogDatas: items[i]),
                  lineInList()
                ]
              ]
            ],
          ]
        ]));
  }
}

class lineInList extends StatelessWidget {
  const lineInList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 21,
        ),
        Container(
            width: double.infinity,
            height: 1.5,
            color: Color.fromARGB(255, 239, 239, 239)),
        SizedBox(
          height: 21,
        ),
      ],
    );
  }
}

class columnListShowItem extends StatelessWidget {
  final BlogModel blogDatas;
  const columnListShowItem({Key? key, required this.blogDatas})
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
            child: Image.network(blogDatas.cover_link,
                fit: BoxFit.cover, width: 132, height: 101),
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
                Text(blogDatas.category,
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
                Text(blogDatas.topic,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'IranSans-medium')),
                Spacer(),
                Row(
                  children: [
                    Text(blogDatas.date + '  •  ' + blogDatas.read_time,
                        style: TextStyle(fontSize: 13)),
                    Spacer(),
                    SvgPicture.asset('images/icons/home/read_more.svg')
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

class rowListSelection extends StatefulWidget {
  List<String> itemsShow = [];
  final List<String> items;
  final List<int> itemsSelected;
  rowListSelection({
    Key? key,
    required this.items,
    required this.itemsSelected,
  }) : super(key: key);

  @override
  State<rowListSelection> createState() => _rowListSelectionState();
}

// کتگوری لیست
class _rowListSelectionState extends State<rowListSelection> {
  // برای بار اول که سلکت وجود ندارد و همه ی آیتم ها انتخاب می شوند
  initState() {
    widget.items.forEach((element) {
      widget.itemsShow.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0 || index == widget.itemsShow.length + 1) {
            return SizedBox(width: 29);
          }
          return itemOflist(widget.itemsShow[index - 1]);
        },
        itemCount: widget.itemsShow.length + 2,
        scrollDirection: Axis.horizontal,
      ))
    ]);
  }

  // این بخش برای حذف و اضافه کردن آیتم است و لیست شو را تغییر میدهد
  void AddSelected(String data) {
    int index = widget.items.indexOf(data);
    if (widget.itemsSelected.indexOf(index) != -1) {
      widget.itemsSelected.remove(index);
    } else {
      widget.itemsSelected.add(index);
    }
    widget.itemsShow.clear();

    for (int i = 0; i < widget.itemsSelected.length; i++) {
      print(widget.items.length);
      widget.itemsShow.add(widget.items[widget.itemsSelected[i]]);
    }
    for (int i = 0; i < widget.items.length; i++) {
      if (widget.itemsSelected.indexOf(i) == -1) {
        widget.itemsShow.add(widget.items[i]);
      }
    }
  }

  // ویدجت هر آیتم در لیست کتگوری
  Widget itemOflist(String data) {
    return GestureDetector(
      onTap: () {
        AddSelected(data);
        listCategoryController.to.addCategory(widget.itemsSelected);
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.only(top: 6, right: 14, left: 14),
        margin: EdgeInsets.only(left: 11),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(57),
            color:
                widget.itemsSelected.indexOf(widget.items.indexOf(data)) == -1
                    ? Color.fromARGB(255, 235, 235, 235)
                    : Color.fromARGB(255, 21, 159, 145)),
        child: Text(data,
            style: TextStyle(
                fontSize: 15,
                color:
                    widget.itemsSelected.indexOf(widget.items.indexOf(data)) !=
                            -1
                        ? Colors.white
                        : Colors.black)),
      ),
    );
  }
}

// این کد برای تشخیص تغییر لیست سلکت هست و با هر تغییر در لیست ویو آپدیت ایجاد میکند

class listCategoryController extends GetxController {
  static listCategoryController get to => Get.find();

  List<int> categoryList = <int>[];
  void addCategory(List<int> listedSelected) {
    categoryList.clear();
    for (int i = 0; i < listedSelected.length; i++) {
      categoryList.add(listedSelected[i]);
    }
    update();
  }
}
