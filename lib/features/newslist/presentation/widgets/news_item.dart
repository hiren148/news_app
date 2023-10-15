import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/domain/models/news.dart';

class NewsItem extends ConsumerWidget {
  final News newsItem;
  const NewsItem({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/detail',
        arguments: newsItem,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Text(
              newsItem.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(
              newsItem.publishedAt,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              newsItem.source.name,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
