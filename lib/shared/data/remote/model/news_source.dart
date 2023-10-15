import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_source.freezed.dart';

part 'news_source.g.dart';

@freezed
class NewsSourceNetModel with _$NewsSourceNetModel {
  const factory NewsSourceNetModel({
    String? id,
    String? name,
  }) = _NewsSourceNetModel;

  factory NewsSourceNetModel.fromJson(Map<String, Object?> json) =>
      _$NewsSourceNetModelFromJson(json);
}
