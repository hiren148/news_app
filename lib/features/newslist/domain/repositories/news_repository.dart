import 'package:dartz/dartz.dart';
import 'package:news_app/shared/domain/models/news_source.dart';
import 'package:news_app/shared/domain/models/paginated_response.dart';
import 'package:news_app/shared/exceptions/http_exception.dart';

abstract class NewsRepository {
  Future<Either<AppException, PaginatedResponse>> getNewsList(
      {required int page, List<NewsSource>? selectedSources});

  Future<Either<AppException, List<NewsSource>>> getNewsSources();

}
