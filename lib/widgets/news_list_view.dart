import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/models/news_model.dart';
import 'package:news/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final dynamic category;

  const NewsListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: getGeneralNews(category: category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Connection Error',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We couldn\'t fetch the news right now. Please check your internet connection and try again.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      // might want to add retry logic here
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.article_outlined, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'No News Available',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'There are no news articles to display at the moment. Please check back later.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        } else {
          final articles = snapshot.data!;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => NewsTile(newsModel: articles[index]),
              childCount: articles.length,
            ),
          );
        }
      },
    );
  }
}