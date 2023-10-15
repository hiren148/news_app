import 'package:news_app/shared/data/remote/mapper/network_to_entity_mapper.dart';
import 'package:news_app/shared/data/remote/model/news.dart';
import 'package:news_app/shared/domain/models/news.dart';
import 'package:news_app/shared/domain/models/paginated_response.dart';

import '../data/news_response.dart';

Map<String, dynamic> ktestNewsResponse = newsListMap();

PaginatedResponse ktestPaginatedResponse() =>
    PaginatedResponse.fromJson(
        newsListMap(), newsListMap()['articles']);

final List<NewsNetModel> ktestNewsNetList = (newsListMap()['articles'] as List)
    .map((e) => NewsNetModel.fromJson(e))
    .toList();

final List<News> kTestNewsList = ktestNewsNetList.map((e) => e.toEntity()).toList();

final ktestNewsNetModel = NewsNetModel.fromJson({});
