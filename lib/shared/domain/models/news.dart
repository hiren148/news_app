import 'package:equatable/equatable.dart';
import 'package:news_app/shared/domain/models/news_source.dart';

class News extends Equatable {
  const News(this.title, this.description, this.source, this.publishedAt,
      this.content, this.url, this.urlToImage, this.author);

  final String title;
  final String description;
  final NewsSource source;
  final String publishedAt;
  final String content;
  final String url;
  final String urlToImage;
  final String author;

  @override
  List<Object?> get props => [title, description, source, publishedAt, content];
}
