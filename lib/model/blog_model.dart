class BlogModel {
  final String topic;
  final String category;
  final String date;
  final String read_time;
  final String cover_link;
  BlogModel(
      {required this.date,
      required this.read_time,
      required this.cover_link,
      required this.category,
      required this.topic});
}
