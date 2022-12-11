class SliderModel {
  final String image;
  final String tag;
  final String title;
  final String date;
  final String timeRead;
  SliderModel(this.image, this.tag, this.title, this.date, this.timeRead);

  static final List<SliderModel> items = [
    SliderModel(
      'https://images.unsplash.com/photo-1581089781785-603411fa81e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2000&q=80',
      'تکنولوژی',
      'تجهیزات جدید شگفت انگیز برای AR و دوستداران واقعیت مجازی',
      '۱۲/۴/۲۲',
      '۱۰ دقیقه',
    ),
    SliderModel(
      'https://images.unsplash.com/photo-1580894742597-87bc8789db3d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2000&q=80',
      'برنامه نویسی',
      'شیرجه زدن به دنیای جدید هوشمند...',
      '۱۲/۴/۲۲',
      '۸ دقیقه',
    ),
    SliderModel(
      'https://images.unsplash.com/photo-1504384764586-bb4cdc1707b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2000&q=80',
      'دیزاین',
      'معرفی سیستم دیزاین جدید گوگل به اسم متریال یو',
      '۱۲/۴/۲۲',
      '۱۵ دقیقه',
    ),
    SliderModel(
      'https://images.unsplash.com/photo-1457305237443-44c3d5a30b89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2000&q=80',
      'هوش مصنوعی',
      '۱۰ ابزار خفن برای هوش مصنوعی',
      '۱۲/۴/۲۲',
      '۳۴ دقیقه',
    ),
  ];
}
