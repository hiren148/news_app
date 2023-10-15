import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/shared/domain/models/paginated_response.dart';

import '../../../fixtures/news/dummy_news_list.dart';


void main() {
  test('Should calculate the page from the response data', () {
    final PaginatedResponse paginatedResponse = ktestPaginatedResponse();

    expect(paginatedResponse.toString(),
        'PaginatedResponse(total:${paginatedResponse.total}, data:${paginatedResponse.data.length})');
  });
}
