// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsNetModelImpl _$$NewsNetModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsNetModelImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      source: json['source'] == null
          ? null
          : NewsSourceNetModel.fromJson(json['source'] as Map<String, dynamic>),
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$$NewsNetModelImplToJson(_$NewsNetModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'source': instance.source,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'author': instance.author,
    };
