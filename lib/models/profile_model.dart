// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import '../models/blog_model.dart';

//ParsaNik

class MyListTile extends StatelessWidget {
  const MyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const RecommendedPosts(),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({required this.BlogDatas});

  final BlogModel BlogDatas;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                BlogDatas.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Color(0xFF2E8EFF).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.tag, size: 12),
                    Text(
                      BlogDatas.category,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${BlogDatas.publishDate}  •  ${BlogDatas.readDuration}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/icons/icn_home/more.svg')
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.category,
    required this.publishDate,
    required this.lastEditDate,
    required this.readDuration,
    required this.isSaved,
    required this.isDownloaded,
  });

  final String thumbnail;
  final String title;
  final String category;
  final String publishDate;
  final String lastEditDate;
  final String readDuration;
  final bool isSaved;
  final bool isDownloaded;

  get BlogDatas => BlogModel(
        title: title,
        thumbnail: thumbnail,
        category: category,
        publishDate: publishDate,
        lastEditDate: lastEditDate,
        readDuration: readDuration,
        isSaved: isSaved,
        isDownloaded: isDownloaded,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: MediaQuery.of(context).size.height / 8.5,
          height: 100,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  child: Container(
                    color: Color(0xFFEBEBEB),
                    child: Image.network(
                      thumbnail,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            'بدون اینترنت :/',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: SpinKitThreeBounce(
                            size: 20.0,
                            color: Color(0xFF2E8EFF),
                          ),
                        );
                      },
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 12.0, 5.0),
                  child: _ArticleDescription(
                    BlogDatas: BlogDatas,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Divider(thickness: 1.5, color: Color(0xFFEFEFEF)),
        )
      ],
    );
  }
}

class RecommendedPosts extends StatelessWidget {
  const RecommendedPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: <Widget>[
        CustomListItem(
          thumbnail:
              'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
          title: 'روند پیشرفت تکنولوژی در سال ۲۰۲۲',
          category: 'تکنولوژی',
          publishDate: '۱۲/۴/۲۲',
          readDuration: 'خواندن در ۱۵ دقیقه',
          lastEditDate: '',
          isSaved: true,
          isDownloaded: false,
        ),
        CustomListItem(
          thumbnail:
              'https://images.unsplash.com/photo-1581089781785-603411fa81e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
          title: 'تجهیزات جدید شگفت انگیز برای AR و دوستداران واقعیت مجازی',
          category: 'تکنولوژی',
          publishDate: '۱۲/۴/۲۲',
          readDuration: 'خواندن در ۷ دقیقه',
          lastEditDate: '',
          isSaved: true,
          isDownloaded: false,
        ),
        CustomListItem(
          thumbnail:
              'https://images.unsplash.com/photo-1580894742597-87bc8789db3d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
          title: 'شیرجه زدن به دنیای جدید هوشمند...',
          category: 'برنامه نویسی',
          publishDate: '۱۲/۴/۲۲',
          readDuration: 'خواندن در ۷ دقیقه',
          lastEditDate: '',
          isSaved: false,
          isDownloaded: false,
        ),
        CustomListItem(
          thumbnail:
              'https://images.unsplash.com/photo-1504384764586-bb4cdc1707b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
          title: 'معرفی سیستم دیزاین جدید گوگل به اسم متریال یو',
          category: 'دیزاین',
          publishDate: '۱۲/۴/۲۲',
          readDuration: 'خواندن در ۷ دقیقه',
          lastEditDate: '',
          isSaved: false,
          isDownloaded: false,
        ),
        CustomListItem(
          thumbnail:
              'https://images.unsplash.com/photo-1457305237443-44c3d5a30b89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
          title: '۱۰ ابزار خفن برای هوش مصنوعی',
          category: 'هوش مصنوعی',
          publishDate: '۱۲/۴/۲۲',
          readDuration: 'خواندن در ۷ دقیقه',
          lastEditDate: '',
          isSaved: false,
          isDownloaded: false,
        ),
      ],
    );
  }
}

// برای پیش نویس پروفایل
class Draft extends StatelessWidget {
  const Draft({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: <Widget>[
        CustomListItem(
          thumbnail:
              'https://images.unsplash.com/photo-1457305237443-44c3d5a30b89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
          title: '۱۰ ابزار خفن برای هوش مصنوعی',
          category: 'هوش مصنوعی',
          publishDate: '۱۲/۴/۲۲',
          readDuration: 'خواندن در ۷ دقیقه',
          lastEditDate: '',
          isSaved: false,
          isDownloaded: false,
        ),
      ],
    );
  }
}

// Profile Drawer

class Profile_drawer extends StatelessWidget {
  const Profile_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
    );
  }
}
