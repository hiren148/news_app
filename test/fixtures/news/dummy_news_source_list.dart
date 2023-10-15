import 'package:news_app/shared/data/remote/mapper/network_to_entity_mapper.dart';
import 'package:news_app/shared/data/remote/model/news_source.dart';
import 'package:news_app/shared/domain/models/news_source.dart';

import '../data/news_source_response.dart';

Map<String, dynamic> ktestNewsSourceResponse = newsSourceListMap;

final List<NewsSourceNetModel> ktestNewsSourceNetList =
    (newsSourceListMap['sources'] as List)
        .map((e) => NewsSourceNetModel.fromJson(e))
        .toList();

final List<NewsSource> kTestNewsSourceList =
    ktestNewsSourceNetList.map((e) => e.toEntity()).toList();

final ktestNewsSource = NewsSourceNetModel.fromJson({});
