import 'package:dartz/dartz.dart';
import 'package:news_app/features/newslist/data/datasource/news_remote_datasource.dart';
import 'package:news_app/features/newslist/domain/repositories/news_repository.dart';
import 'package:news_app/shared/domain/models/news_source.dart';
import 'package:news_app/shared/domain/models/paginated_response.dart';
import 'package:news_app/shared/exceptions/http_exception.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsDatasource newsDatasource;

  NewsRepositoryImpl(this.newsDatasource);

  @override
  Future<Either<AppException, PaginatedResponse>> getNewsList(
      {required int page, List<NewsSource>? selectedSources}) {
    return newsDatasource.fetchPaginatedNews(
        page: page, selectedSources: selectedSources);
  }

  @override
  Future<Either<AppException, List<NewsSource>>> getNewsSources() {
    return newsDatasource.fetchNewsSources();
  }
}
