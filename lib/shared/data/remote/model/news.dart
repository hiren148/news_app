import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/shared/data/remote/model/news_source.dart';

part 'news.freezed.dart';

part 'news.g.dart';

@freezed
class NewsNetModel with _$NewsNetModel {
  const factory NewsNetModel({
    String? title,
    String? description,
    NewsSourceNetModel? source,
    String? publishedAt,
    String? content,
    String? url,
    String? urlToImage,
    String? author,
  }) = _NewsNetModel;

  factory NewsNetModel.fromJson(Map<String, Object?> json) =>
      _$NewsNetModelFromJson(json);
}
