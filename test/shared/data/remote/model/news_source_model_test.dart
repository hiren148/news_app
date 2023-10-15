import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/shared/data/remote/model/news_source.dart';

import '../../../../fixtures/data/news_source_response.dart';
import '../../../../fixtures/news/dummy_news_source_list.dart';

void main(){
  group('NewsSource Net Model Test\n', () {
    test('Should parse News source from json', () {
      expect(NewsSourceNetModel.fromJson(newsSourceMap), ktestNewsSourceNetList[0]);
    });

    test('Should return string of news', () {
      expect(ktestNewsSourceNetList[0].toJson(), isA<Map<String, dynamic>>());
    });
  });
}