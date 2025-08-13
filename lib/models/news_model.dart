class NewsModel {
  final String? image;
  final String? title;
  final String? subTitle;

  NewsModel({required this.image, required this.subTitle, required this.title});

  factory NewsModel.fromJson(json) {
    return NewsModel(
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
    );
  }
}
