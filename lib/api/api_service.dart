import 'package:dio/dio.dart';
import 'package:news/models/news_model.dart';

final dio = Dio();

Future<List<NewsModel>> getGeneralNews({required category}) async {
  try {
     final response = await dio.get(
      'https://newsapi.org/v2/top-headlines?apiKey=3f1698824c074853a5c30c83d377b75a&category=$category',
    );
    Map<String, dynamic> jsonData = response.data;

    List<dynamic> articles = jsonData['articles'];

    List<NewsModel> articlesList = [];

    for (var article in articles) {
      NewsModel articleModel = NewsModel.fromJson(article);
      articlesList.add(articleModel);
    }

    return articlesList;
  } catch (e) {
    return [];
  }
}
