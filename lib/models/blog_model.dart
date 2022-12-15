class BlogModel {
  final String title;
  final String category;
  final String publishDate;
  final String lastEditDate;
  final String readDuration;
  final String thumbnail;
  BlogModel({
    required this.title,
    required this.thumbnail,
    required this.category,
    required this.publishDate,
    required this.lastEditDate,
    required this.readDuration,
  });
}
