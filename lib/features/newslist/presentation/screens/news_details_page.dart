import 'package:flutter/material.dart';
import 'package:news_app/shared/domain/models/news.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsItem = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Top-Headlines'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (newsItem.urlToImage.isNotEmpty)
                Image(
                  image: NetworkImage(
                    newsItem.urlToImage,
                  ),
                ),
              const Padding(
                padding: EdgeInsets.all(
                  16.0,
                ),
              ),
              Text(
                newsItem.source.name,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Text(
                newsItem.title,
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
              ),
              Text(
                newsItem.description,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(
                newsItem.publishedAt,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
              ),
              Text(
                newsItem.content,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
