import 'package:dartz/dartz.dart';
import 'package:news_app/shared/data/remote/mapper/network_to_entity_mapper.dart';
import 'package:news_app/shared/data/remote/model/news_source.dart';
import 'package:news_app/shared/data/remote/network_service.dart';
import 'package:news_app/shared/domain/models/news_source.dart';
import 'package:news_app/shared/domain/models/paginated_response.dart';
import 'package:news_app/shared/exceptions/http_exception.dart';
import 'package:news_app/src/api_key.g.dart';

abstract class NewsDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedNews(
      {required int page, List<NewsSource>? selectedSources});

  Future<Either<AppException, List<NewsSource>>> fetchNewsSources();
}

class NewsRemoteDatasource extends NewsDatasource {
  final NetworkService networkService;

  String? _apiKey;

  NewsRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedNews(
      {required int page, List<NewsSource>? selectedSources}) async {
    if (_apiKey == null) {
      await fetchApiKey();
    }
    final qParams = buildQueryParams(selectedSources);
    qParams['page'] = page;
    qParams['pageSize'] = perPageLimit;
    qParams['apiKey'] = _apiKey;

    final response = await networkService.get(
      '/top-headlines',
      queryParameters: qParams,
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse =
            PaginatedResponse.fromJson(jsonData, jsonData['articles'] ?? []);
        return Right(paginatedResponse);
      },
    );
  }

  @override
  Future<Either<AppException, List<NewsSource>>> fetchNewsSources() async {
    if (_apiKey == null) {
      await fetchApiKey();
    }
    final response = await networkService.get(
      '/top-headlines/sources',
      queryParameters: {
        'country': 'in',
        'apiKey': _apiKey,
      },
    );
    return response.fold((l) => Left(l), (r) {
      final jsonData = r.data;
      if (jsonData == null) {
        return Left(
          AppException(
            identifier: 'fetchNewsSources',
            statusCode: 0,
            message: 'The data is not in the valid format.',
          ),
        );
      }
      final sourceList = ((jsonData['sources'] ?? []) as List)
          .map((e) => NewsSourceNetModel.fromJson(e))
          .toList();
      final sourceEntities = sourceList.map((e) => e.toEntity()).toList();
      return Right(sourceEntities);
    });
  }

  Future<void> fetchApiKey() async {
    try {
      _apiKey = await ApiKeyHost().getApiKey();
    } catch (e) {
      //error fetching API key from HOST
    }
  }

  Map<String, dynamic> buildQueryParams(List<NewsSource>? selectedSources) {
    final Map<String, dynamic> qParams = {};
    if (selectedSources != null && selectedSources.isNotEmpty) {
      qParams['sources'] = selectedSources.map((e) => e.id).join(",");
    } else {
      qParams['country'] = 'in';
    }
    return qParams;
  }
}
