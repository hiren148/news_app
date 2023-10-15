import 'package:intl/intl.dart';
import 'package:news_app/shared/data/remote/model/news.dart';
import 'package:news_app/shared/data/remote/model/news_source.dart';
import 'package:news_app/shared/domain/models/news.dart';
import 'package:news_app/shared/domain/models/news_source.dart';

extension NewsNetModelX on NewsNetModel {
  News toEntity() => News(
        title ?? '',
        description ?? '',
        source?.toEntity() ?? const NewsSource('', ''),
        publishedAt.toReadableDateTime(),
        content ?? '',
        url ?? '',
        urlToImage ?? '',
        author ?? '',
      );
}

extension NewsSourceNetModelX on NewsSourceNetModel {
  NewsSource toEntity() => NewsSource(id ?? '', name ?? '');
}

extension StringX on String? {
  String toReadableDateTime() {
    if (this != null) {
      return DateFormat.yMd()
          .format(DateTime.parse(this!.replaceAll('T', ' ')));
    }
    return '';
  }
}
