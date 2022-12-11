class BlogModel {
  final String topic;
  final String category;
  final String date;
  final String readTime;
  final String coverLink;
  BlogModel(
      {required this.date,
      required this.readTime,
      required this.coverLink,
      required this.category,
      required this.topic});
}
