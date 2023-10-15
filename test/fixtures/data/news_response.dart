import 'package:news_app/shared/globals.dart';

import 'news_source_response.dart';

Map<String, dynamic> newsListMap() => {
      "articles": List.generate(itemsPerPage, (index) => newsMap),
      "totalResults": 100,
      "status": "ok",
    };
Map<String, dynamic> newsMap = {
  "title":
      "going nowhere in a hurry - FXStreet",
  "description":
      "Gold price",
  "url":
      "https://www.fxstreet.com/",
  "urlToImage":
      "https://editorial.fxstreet.com/Large.jpg",
  "publishedAt": "2023-10-11T06:04:29Z",
  "content":
      "Gold price extends",
  "author": "Menghani",
  "source": newsSourceMap,
};
